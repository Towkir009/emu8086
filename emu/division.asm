org 100h

mov ah, 0     ; clear high byte of AX
mov al, 0FFh  ; load dividend (numerator) into AL
mov bl, 05h   ; load divisor (denominator) into BL

xor bh, bh    ; clear high byte of BX

div bl        ; divide AL by BL

mov dl, al    ; move quotient into DL

sub ah, ah    ; clear AH
mov al, bh    ; move remainder into AL

; print result
mov ah, 09h   ; print character function
mov dx, offset result_msg ; point to message to print
int 21h       ; print message
mov dl, dh    ; move quotient into DL for printing
add dl, 30h   ; convert quotient to ASCII
mov ah, 02h   ; print DL
int 21h       ; print quotient
mov dl, al    ; move remainder into DL for printing
add dl, 30h   ; convert remainder to ASCII
mov ah, 02h   ; print DL
int 21h       ; print remainder
mov dl, 0dh   ; move cursor to next line
mov ah, 02h   ; print DL
int 21h       ; print newline character

; end program
mov ah, 4ch   ; exit function
int 21h       ; call DOS to exit

; data
result_msg db 'Result: $' ; message to print

end