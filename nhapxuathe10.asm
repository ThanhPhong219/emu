;TONG 2 SO NHI PHAN

.MODEL SMALL
.STACK 100H
.DATA 
    TB1 DB "NHAP SO THU NHAT: $"  
    TB2 DB "NHAP SO THU HAI: $"
    TB3 DB "TONG 2 SO LA: $"
    DEM DW 0     
    A DW 0 
    B DW 0
.CODE   
    MAIN PROC
        ;KHOI TAO DU LIEU
        MOV AX,@DATA
        MOV DS,AX
        XOR BX,BX
        
        MOV AH,9  ;thong bao 1
        LEA DX,tb1
        INT 21H
        
        CALL NHAP_DEC ;NHAP 1
        MOV A,BX
        
        
        XOR BX,BX
        MOV AH,9    ;thong bao 2
        LEA DX,tb2
        INT 21H
        
        CALL NHAP_DEC ; NHAP2
        MOV B,BX 
        
        MOV BX,A
        ADD BX,B
        
        MOV AH,9    ;thong bao 1
        LEA DX,tb3
        INT 21h
        CALL XUAT_DEC
        
        MOV AH,4CH
        INT 21H
    MAIN ENDP


    NHAP_DEC PROC
        NHAP:
            MOV AH,1   ;HAM1
            INT 21H
            ;SO SANH VOI PHIM ENTER NEU BANG->THOAT 
            CMP AL,13
            JE THOAT
            CMP AL,30H ;SO SANH VOI 0
            JB LOI     ;NHO HON->LOI
            CMP AL,39H ;SO SANH VOI 9
            JA LOI     ;LON HON->LOI
            SUB AL,30H ;
            AND AX,000FH
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
            ;GACH DAU DONG
            MOV AH,2
            MOV DL,13
            INT 21H
            MOV DL,10
            INT 21H
    RET   
            
    XUAT_DEC PROC
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

