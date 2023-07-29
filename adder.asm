.model small
.stack 100h

;data segment 
.data
NUM1 DB ?
NUM2 DB ?
RESULT DB ?
MSG1 DB 10,13,"ENTER FIRST NUMBER TO ADD : $"
MSG2 DB 10,13,"ENTER SECOND NUMBER TO ADD : $"
MSG3 DB 10,13,"RESULT OF ADDITION IS : $"

.code
main proc
MOV AX,@DATA
MOV DS,AX

;print a msg1 
LEA DX,MSG1
MOV AH,9
INT 21H

;take input 
MOV AH,1
INT 21H
;change to number from ascii 
SUB AL,30H
MOV NUM1,AL

;same process for taking the second number
LEA DX,MSG2
MOV AH,9
INT 21H

MOV AH,1
INT 21H

SUB AL,30H

;add both numbers 
MOV NUM2,AL
ADD AL,NUM1
MOV RESULT,AL

;convert the result back to ascii 
MOV AH,0
AAA
ADD AH,30H
ADD AL,30H
MOV BX,AX

;display the result 
LEA DX,MSG3
MOV AH,9
INT 21H

MOV AH,2
MOV DL,BH
INT 21H

MOV AH,2
MOV DL,BL
INT 21H

;exit the program 
MOV AH,4CH
INT 21H

main endp
end main