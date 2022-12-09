;NHAP XUAT SO HE 10
.MODEL SMALL
.STACK 100H
.DATA
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        XOR BX,BX
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
    MAIN ENDP
END MAIN
        
        