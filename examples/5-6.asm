STACK1  SEGMENT PARA STACK
STACK_AREA  DB  100H    DUP(?)
STACK1  ENDS

DATA    SEGMENT
VALUE   DW      0FFFEH
DIVISOR DW      10000,1000,100,10,1
DATA    ENDS

CODE    SEGMENT
        ASSUME  CS:CODE,SS:STACK1,DS:DATA
;description
MAIN    PROC
        MOV     AX,DATA
        MOV     DS,AX
        MOV     SI,OFFSET  DIVISOR
        MOV     AX,VALUE
        MOV     CX,5
LP:     XOR     DX,DX ;清空被除数高16位
        DIV     WORD PTR [SI] ;AX=AX/DIVISOR
        PUSH    DX
        OR      AX,30H ;变成ASCII码
PRINT:  MOV     DL,AL
        MOV     AH,2
        INT     21H
        POP     AX
        ADD     SI,2
        LOOP    LP
EXIT:   MOV     AX,4C00H
        INT     21H
MAIN    ENDP
CODE    ENDS
        END     MAIN