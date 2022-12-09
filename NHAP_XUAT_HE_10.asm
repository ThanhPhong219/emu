;NHAP XUAT SO HE 10
.MODEL SMALL
.STACK 100H
.DATA
    A DW 0
    B DW 0  
.CODE
    MAIN PROC 
        MOV AX,@DATA
        MOV DS,AX
        XOR BX,BX
        
        CALL INPUT_DEC
        MOV A,BX
        XOR BX,BX
        CALL INPUT_DEC
        MOV B,BX
        MOV BX,A
        ADD BX,B
        CALL OUTPUT_DEC
        MAIN ENDP
    INPUT_DEC PROC
        NHAP:
        MOV AH,1
        INT 21H 
        ;Kiem tra phim enter
        CMP AL,13
        JE THOAT
        ;Kiem tra tinh dung dan
        CMP AL,30H
        JB LOI
        CMP AL,39H
        JA LOI
        SUB AL,30H
        JMP LUUTRU
        LUUTRU:
        XOR AH,AH
        PUSH AX
        MOV AL,10
        MUL BL
        MOV BX,AX
        POP AX
        ADD BX,AX
        JMP NHAP
        LOI:
        XOR BX,BX
        JMP NHAP
        THOAT:
        MOV AH,2
        MOV DL,2
        INT 21H
        MOV DL,10
        INT 21H
    RET
    OUTPUT_DEC PROC
        XOR CX,CX
        MOV AX,BX
        MOV BX,10
        CHIA:
        XOR DX,DX
        DIV BX
        PUSH DX
        INC CX
        CMP AX,0
        JA CHIA
        MOV AH,2
        LAP:
        POP DX
        AND DX,000FH
        ADD DL,30H
        INT 21H
        LOOP LAP
    RET
    
    
END MAIN
        
        
