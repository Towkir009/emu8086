.MODEL SMALL
.STACK 100H
.DATA
NUM1 DB 'ENTER YOUR FIRST NUMBER: $'
NUM2 DB 10,13,'ENTER YOUR SECOND NUMBER: $'
SUM DB 10,13,'SUM: $'
DIF DB 10,13,'SUB: $'
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
; INPUT FIRST NUMBER
MOV AH,9
LEA DX,NUM1
INT 21H
MOV AH,1
INT 21H
SUB AL, 30H
MOV BH,AL
; INPUT SECOND NUMBER
MOV AH,9
LEA DX,NUM2
INT 21H
MOV AH,1
INT 21H
SUB AL, 30H
MOV BL,AL
; COMPARE THE TWO NUMBERS AND PERFORM ADDITION OR
;SUBTRACTION ACCORDINGLY
CMP BH, BL
JG SUBTRACT
; ADD TWO NUMBERS
ADD BH, BL
MOV AH,9
LEA DX,SUM
INT 21H
MOV DL, BH
ADD DL, 30H
MOV AH,2
INT 21H
JMP EXIT
SUBTRACT:
; SUBTRACT TWO NUMBERS
SUB BH, BL
MOV AH,9
LEA DX,DIF
INT 21H
MOV DL, BH
ADD DL, 30H
MOV AH,2
INT 21H
EXIT:
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN