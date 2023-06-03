.model small
.stack 100h

.data
num1 db ?
num2 db ?
result db ?
prompt db 'Enter two 8-bit hexadecimal numbers: $'
output db 'Result: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt and read in two numbers
    mov ah, 9
    lea dx, prompt
    int 21h

    ; Read in first number
    mov ah, 1
    int 21h
    sub al, 30h ; convert ASCII digit to number
    shl al, 4 ; shift left by 4 bits
    mov num1, al

    ; Read in second number
    mov ah, 1
    int 21h
    sub al, 30h ; convert ASCII digit to number
    mov num2, al

    ; Perform multiplication
    mov al, num1
    mul num2
    mov result, al

    ; Display result in hexadecimal format
    mov ah, 9
    lea dx, output
    int 21h

    mov al, result
    mov bl, al
    shr bl, 4 ; shift right by 4 bits
    call print_hex_digit ; print upper nibble
    mov bl, al
    and bl, 0x0F ; mask off upper nibble
    call print_hex_digit ; print lower nibble

    ; Exit program
    mov ah, 4ch
    int 21h

main endp

print_hex_digit proc
    cmp bl, 10
    jl print_hex_digit_0
    add bl, 7
print_hex_digit_0:
    add bl, 30h ; convert to ASCII character 0-9 or A-F
    mov dl, bl
    mov ah, 2
    int 21h
    ret
print_hex_digit endp

end main