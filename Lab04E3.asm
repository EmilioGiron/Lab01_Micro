.MODEL small
.DATA

	texto0 DB 10,13, 'Ejercicio 3: $'
	texto1 DB 10,13, 'Ingresar numero 1: $'
	texto2 DB 10,13, 'Ingresar numero 2: $'
	texto3 DB 10,13, 'Producto: $'
	texto4 DB 10,13, 'Cociente: $'
	texto5 DB 10,13, 'Residuo: $'
	num1 DB ?		
	num2 DB ?

.STACK
.CODE
Programa:

	MOV AX, @Data
	MOV DS, AX

	;Mostrar mensaje texto0
	MOV DX, OFFSET texto0
	MOV AH, 09h
	INT 21h

	;Mostrar mensaje texto1
	MOV DX, OFFSET texto1
	MOV AH, 09h
	INT 21h

	;Leer numero1:
	XOR AX, AX
	MOV AH, 01h
	INT 21h
	SUB AL, 30h
	MOV num1, AL

	;Mostrar mensaje texto2
	MOV DX, OFFSET texto2
	MOV AH, 09h
	INT 21h

	;Leer numero2:
	XOR AX, AX
	MOV AH, 01h
	INT 21h
	SUB AL, 30h
	MOV num2, AL
	
	;Multiplicación por sumas sucesivas
	XOR CL, CL
	XOR BX, BX
	MOV CL, num1
	SUB CL, 01h
	MOV BL, num2

	CICLO:
		ADD BL, num2
		SUB CL, 01h
		CMP CL, 0h
		JNE CICLO

	;Mostrar resultado
	MOV DX, OFFSET texto3
	MOV AH, 09h
	INT 21h

	MOV AL, 10
	DIV BL
	XOR CL, CL
	XOR BL, BL
	MOV CL, AL
	ADD CL, 30h
	MOV BL, AH
	ADD BL, 30h
	MOV DX, OFFSET CX
	MOV AH, 02h
	INT 21h
	MOV DX, OFFSET CX
	MOV AH, 02h
	INT 21h

	FINALIZAR:
		MOV AH, 4Ch
		INT 21h	
END Programa