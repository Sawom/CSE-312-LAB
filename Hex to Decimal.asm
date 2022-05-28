.MODEL SMALL
.STACK 100H
.DATA

STR1 DB 'INPUT A DIGIT$'
STR2 DB 'DECIMAL: $'
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9H
    LEA DX,STR1
    INT 21H
    
    MOV AH,1H  ;GIVE INPUT A TO F TO SEE THE DECIMAL VALUE
    INT 21H
    MOV BL,AL
    SUB BL,17D   ;IN C-> 67-17=50='2'
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,9H
    LEA DX,STR2
    INT 21H
    
    MOV DL,49D     ;1 IN DECIMAL, PRINTING 1
    MOV AH,2H
    INT 21H
    
    MOV DL,BL
    MOV AH,2H
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN