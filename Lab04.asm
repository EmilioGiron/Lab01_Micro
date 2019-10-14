.MODEL small
.DATA

	texto0 DB 10,13, 'Ejercicio 1: $'
	texto1 DB 10,13, 'Ingresar numero: $'
	texto2 DB 10,13, 'Es par$'
	texto3 DB 10,13, 'Es impar$'
	num DB ?		

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

	;Leer numero:
	XOR AX, AX
	MOV AH, 01h
	INT 21h
	SUB AL, 30h
	MOV num, AL
	
	;Definir si es par o impar
	MOV AL, num
	MOV BL, 02h
	DIV BL
	CMP AH, 0h
	JNE EsImpar
	JMP EsPar

	EsPar:
		MOV DX, OFFSET texto2
		MOV AH, 09h
		INT 21h
		JMP FINALIZAR

	EsImpar:
		MOV DX, OFFSET texto3
		MOV AH, 09h
		INT 21h
		JMP FINALIZAR

	FINALIZAR:
		MOV AH, 4Ch
		INT 21h	
END Programa