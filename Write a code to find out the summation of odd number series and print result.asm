.MODEL SMALL
.DATA
N DB '?'
SUM DB 0H 

STR1 DB "ENTER THE VALUE OF N: $"
STR2 DB "SUM OF ODD NUMBER: $"

.CODE
MAIN PROC
        MOV AX,@DATA     ; DATA INITIALIZATION
        MOV DS,AX

        MOV AH,9H
        LEA DX, STR1     ;DISPLAY STRING
        INT 21H          

        MOV AH, 1H       ;INPUT N
        INT 21H

        SUB AL,30H       ;CONVERTION ASCII
        MOV N,AL

        MOV AH,2H      
        MOV DL,0AH       ; NEW LINE
        INT 21H
        MOV DL,0DH       ;CARRIAGE RETURN
        INT 21H

        MOV BL, 1H       ;ODD SO START FROM 1
        MOV CL, N        ;LOOP DECEREMENT N-1

        L:
        ADD SUM,BL        ;SUM OF ODD
        ADD BL,2H       

        LOOP L

        MOV AH,9H
        LEA DX,STR2
        INT 21H

        ADD SUM,30H ;CONVERSTION ASCII 

        MOV AH, 2H
        MOV DL,SUM
        INT 21H


        MOV AH, 4CH
        INT 21H
    MAIN ENDP

END MAIN