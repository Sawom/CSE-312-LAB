.MODEL SMALL
.STACK 100H
.DATA
A DB '?'
STR DB "AND IS: $"     
     
.CODE
MAIN PROC
    
    MOV AX,@DATA  ;DATA INITIALIZATION
    MOV DS,AX
             
    
    MOV AH,1H     ;INPUT
    INT 21H
    
    SUB AL,30H    ;CONVERT ASCII
    MOV A, AL
    
    MOV AH,2H
    MOV DL,0AH    ; NEW LINE
    INT 21H
    MOV DL,0DH    ;CARRIAGE RETURN
    INT 21H  
    
    MOV CL,2H     ;MULTIPLY BY 4
    
    SHL A,CL      ;LEFT SHIFT BY 2, ADD 00 IN LAST POSITION
    
    MOV AH,9H
    LEA DX,STR    ;DISPLAY STRING
    INT 21H
    
    ADD A,30H
    
    MOV AH,2H
    MOV DL,A
    INT 21H
    
             
    MOV AH, 4CH
    INT 21H       
    MAIN ENDP
END MAIN