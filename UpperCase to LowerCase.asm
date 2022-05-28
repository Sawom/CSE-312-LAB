.MODEL SMALL
.STACK 100H  ;STACK SEGMENT
.DATA    
STR1 DB "ENTER A UPPERCASE: $"
STR2 DB "ANSWER: $"                                      

.CODE         ;CODE SEGMENT
MAIN PROC
    MOV AX,@DATA    ;DATA INITIALIZATION
    MOV DS,AX
    
    MOV AH,9H
    LEA DX, STR1  ;DISPLAY STRING
    INT 21H
    
    MOV AH,1H     ;INPUT
    INT 21H         
    
    MOV BL,AL    ;IF input 'A' is taken whose ascii code is 65  
    ADD BL,32    ;ADD 65+32 IN DECIMAL (ASCII)
    
    
    MOV AH,2H
    MOV DL,0AH    ; NEW LINE
    INT 21H
    MOV DL,0DH    ;CARRIAGE RETURNS
    INT 21H  
    
    MOV AH,9H
    LEA DX, STR2  ;DISPLAY STRING
    INT 21H
    
    MOV AH,2H
    MOV DL, BL     ;SINGLE KEY OUTPUT
    INT 21H        ;OUTPUT IS 'a' ASCII=97 
    
    
    MOV AH,4CH
    INT 21H     
                
MAIN ENDP
  END MAIN