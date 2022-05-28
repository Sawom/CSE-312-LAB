.MODEL SMALL
.STACK 100H 
.DATA

X DB '?'
Y DB '?' 


STR1 DB "ENTER FIRST DIGIT : $"
STR2 DB "ENTER SECOND DIGIT : $" 
STR3 DB "NUMBER IS EQUAL $"  
STR4 DB "NUMBER IS NOT EQUAL $"
 
.CODE
 
 
MAIN PROC
    MOV AX,@DATA   
    MOV DS,AX
    
    MOV AH,9H
    LEA DX,STR1   
    INT 21H
    
    MOV AH,1H     
    INT 21H 
    
    
    SUB AL,30H   
    MOV X,AL
    
    MOV AH,2H
    MOV DL,0AH    
    INT 21H
    MOV DL,0DH     
    INT 21H
         
         
         
    MOV AH,9H
    LEA DX,STR2   
    INT 21H 
    
    
    MOV AH,1H     
    INT 21H
    
    SUB AL, 30H  
    MOV Y,AL
    
    MOV AH,2H
    MOV DL,0AH    
    INT 21H
    MOV DL,0DH    
    INT 21H         
         
         
    MOV CL,X    
    
    CMP CL,Y     
    JE  XX    
                 
    CMP CL,Y     
    JNE YY
      
      
     
    XX:     
    MOV AH,2H     
    MOV DL,0AH   
    INT 21H
    MOV DL,0DH    
    INT 21H
    
    MOV AH,9H
    LEA DX,STR3    
    INT 21H
    
    MOV AH,2H
    ADD X, 30H
    MOV DL,X
    INT 21H
    
    
    JMP EXIT   
     
     
    
    YY:
    MOV AH,2H
    MOV DL,0AH    
    INT 21H
    MOV DL,0DH    
    INT 21H
    
    MOV AH,9H
    LEA DX,STR4 
    INT 21h
    
    
    JMP EXIT  
            
    
    
    EXIT:
         
    MOV AH, 4CH  
    INT 21H   
   MAIN ENDP
 END MAIN 