.MODEL SMALL 
.DATA
X DB '?'


STR1 DB "ENTER THE VALUE: $"



STR3 DB "ITS A DIGIT$"
STR4 DB "ITS NOT DIGIT$" 

.CODE    
MAIN PROC
      
         MOV AX,@DATA
         MOV DS,AX
         
         MOV AH,9H
         LEA DX,STR1   ; DISPLAY STRING
         INT 21H
         
         ;INPUT FOR X
         MOV AH,1H     ; INPUT   ASCII
         INT 21H              
         
         SUB AL,30H   ; MAKEING NUMBER
         MOV X,AL    
         
         
         MOV AH,2H
         MOV DL,0AH    ; NEW LINE
         INT 21H         
         MOV DL,0DH    ;CARRIAGE RETURN
         INT 21H
         
         
       
         CMP X,0H      
         JGE EQ1        ;IF X>=0
         JL EQ2   
         
         CMP X,9H        ;IF X<=9
         JLE EQ1
         JG EQ2
             
             
             
         EQ1:
         
         CMP X,9H        ;IF X<=9
         JLE EQ3
         JG EQ4
         
            EQ3:          
                MOV AH,2H
                MOV DL,0AH    ; NEW LINE
                INT 21H         
                MOV DL,0DH    ;CARRIAGE RETURN  
                INT 21H    
         
         
                MOV AH,9H
                LEA DX,STR3  ; DISPLAY STRING
                INT 21H
                JMP EXIT  
                
                
                 EQ4:
                  MOV AH,2H
                   MOV DL,0AH    ; NEW LINE
                    INT 21H         
                 MOV DL,0DH    ;CARRIAGE RETURN  
                INT 21H
         
         
                 MOV AH,9H
                LEA DX,STR4   ; DISPLAY STRING
                    INT 21H  
         
         JMP EXIT 
         
         
         EQ2:
         MOV AH,2H
                   MOV DL,0AH    ; NEW LINE
                    INT 21H         
                 MOV DL,0DH    ;CARRIAGE RETURN  
                INT 21H
         
         
                 MOV AH,9H
                LEA DX,STR4   ; DISPLAY STRING
                    INT 21H 
         
             JMP EXIT
              
              
         EXIT:
         MOV AH, 4CH
         INT 21H
         
     
       MAIN ENDP 
END MAIN
 
 