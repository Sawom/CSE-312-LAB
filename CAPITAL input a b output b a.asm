.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
    MOV AH,1H ; TAKING FIRST CHARACTER INPUT 
    INT 21H       ;CALLING FUNCTION
    MOV BL,AL  ; MOVE TO BL  
    
    
    MOV AH,1H ; TAKING 2ND INPUT CHARACTER
    INT 21H
    MOV BH,AL
    
    
    CMP BL,BH   ; CAMPARING 1ST AND 2ND CHARACTER 
    JG LVEL1            ; JG IS GRATER, LARGEST IS BL 
           
                     ;PRINIT WILL BE BH
                     
    MOV AH,2H 
    MOV DL,BL       ; PRINT BH (IF BL<BH 
    INT 21H
    MOV DL,BH       ;ELSE PRINT BL
    INT 21H 
    JMP EXIT:         ;JUMP TO EXIT
    
    
    LVEL1:
    MOV AH,2H
    MOV DL,BH       ;PRINT BH (IF BL>BH
    INT 21H
    MOV DL,BL        ;ELSE PRINT BL
    INT 21H            ;JUMP TO EXIT
    JMP EXIT:
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN