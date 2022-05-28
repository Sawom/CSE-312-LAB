.MODEL SMALL
.STACK 100H
.DATA

A DW 1234H

.CODE     
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    XOR AX,AX
    
    MOV AX,A
    XOR AH,0FFH ;12 0001 0010
                ;   1110 1101
                ;   E    D            
    XOR AL,0FFH ;34 0011 0100
    
    
    
EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN