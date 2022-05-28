.MODEL SMALL


.DATA

A DB '?'
B DB '?'  

STR1 DB "ENTER FIRST NUMBER: $"
STR2 DB "ENTER SECOND NUMBER: $"

STR3 DB "THE FIRST NUMBER IS SMALL: $"  
STR4 DB "THE SECOND NUMBER IS SMALL: $" 


.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX 
        
        
        ;CODE FOR A INPUT
        MOV AH,9H
        LEA DX, STR1  ;DISPLAY STRING
        INT 21H
        
        MOV AH, 1H     ;INPUT A
        INT 21H
        
        SUB AL,30H     ;CONVERTION ASCII
        MOV A,AL
        
        MOV AH,2H
        MOV DL,0AH    ; NEW LINE
        INT 21H
        MOV DL,0DH    ;CARRIAGE RETURN
        INT 21H
        
          
          
        ;CODE FOR B INPUT
        MOV AH,9H
        LEA DX, STR2  ;DISPLAY STRING
        INT 21H
        
        MOV AH, 1H ;INPUT B
        INT 21H
        
        SUB AL,30H ;CONVERTION ASCII
        MOV B,AL
                
                
        MOV AH,2H
        MOV DL,0AH    ; NEW LINE
        INT 21H
        MOV DL,0DH    ;CARRIAGE RETURN
        INT 21H
                
        
        MOV BL,A  5
        CMP BL,B  6 ; BL-B, BL REMAINS UNCHANGED, ONLY FLAG SET
        
        
        JG  BB       ; BL>B
        JL  AA       ; BL<B
               
               
               
        BB:
        MOV AH,9H       ; TO DISPLAY STRING
        LEA DX, STR4
        INT 21H
        
        ADD B,30H 
        MOV AH,2H
        MOV DL,B
        INT 21H
        
        JMP EXIT
        
        
        
        AA:
        MOV AH,9H       ; TO DISPLAY STRING
        LEA DX, STR3
        INT 21H 
        
        ADD A,30H 
        MOV AH,2H
        MOV DL,A
        INT 21H   
        
        
        EXIT:
        
        
        
        
        
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP

END MAIN