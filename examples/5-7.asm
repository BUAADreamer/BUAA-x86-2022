STACK1  SEGMENT PARA STACK
STACK_AREA  DB  100H    DUP(?)
STACK1  ENDS

DATA    SEGMENT
VALUE   DW      0FFFEH
DATA    ENDS

CODE    SEGMENT
        ASSUME  CS:CODE,SS:STACK1,DS:DATA
;description
MAIN    PROC
        MOV     AX,DATA
        MOV     DS,AX
        MOV     CX,5
        MOV     AX,VALUE
        MOV     BX,10
LOOP1:  XOR     DX,DX
        DIV     BX
        PUSH    DX
        LOOP    LOOP1
        MOV     CX,5
LOOP2:  POP     AX
        OR      AX,30H
        MOV     DL,AL
        MOV     AH,2
        INT     21H
        LOOP    LOOP2
EXIT:   MOV     AX,4C00H
        INT     21H
MAIN    ENDP
CODE    ENDS
        END     MAIN