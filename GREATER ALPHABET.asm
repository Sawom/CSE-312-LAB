.MODEL SMALL
.STACK 100H
.DATA

A DB '?'
B DB '?'

STR1 DB "ENTER TWO ALPHABET: $"
STR2 DB "RESULT: $"

.CODE
MAIN PROC
    MOV AX,@DATA    ;DATA INITIALIZATION
    MOV DS,AX  
    
    MOV AH,9H
    LEA DX,STR1
    INT 21H
    
    MOV AH,1H
    INT 21H
    MOV A,AL
    
    
    MOV AH,2H
    MOV DL,0AH    ; NEW LINE
    INT 21H
    MOV DL,0DH    ;CARRIAGE RETURN 
    INT 21H
    
    MOV AH,1H
    INT 21H
    MOV B,AL
    
    SUB A,30H 
    SUB B,30H 
    
    MOV BL,A
    
    CMP BL,B
    JG LVL1 
    JL LVL2
    
    LVL1:
    MOV AH,2H
    MOV DL,0AH    ; NEW LINE
    INT 21H
    MOV DL,0DH    ;CARRIAGE RETURN 
    INT 21H
    
    
    MOV AH,2H
    ADD BL,30H
    MOV DL,BL
    INT 21H
    JMP EXIT: 
    
   
    
    LVL2:
      
    MOV AH,2H
    MOV DL,0AH    ; NEW LINE
    INT 21H
    MOV DL,0DH    ;CARRIAGE RETURN 
    INT 21H
    
    MOV AH,2H
    ADD B,30H
    MOV DL,B
    INT 21H
    JMP EXIT:
    
    
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
