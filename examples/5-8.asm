STACK1  SEGMENT PARA STACK
STACK_AREA  DB  100H    DUP(?)
STACK1  ENDS

DATA    SEGMENT
VALUE   DW      0FFFEH
RES     DB 5 DUP(?),'$'
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
        MOV     DI,OFFSET RES + 4
LOOP1:  XOR     DX,DX
        DIV     BX
        OR      DX,30H
        MOV     [DI],DL
        DEC     DI
        LOOP    LOOP1
LOOP2:  MOV     DX,OFFSET RES
        MOV     AH,9
        INT     21H
EXIT:   MOV     AX,4C00H
        INT     21H
MAIN    ENDP
CODE    ENDS
        END     MAIN