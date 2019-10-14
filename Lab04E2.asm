.MODEL small
.DATA

	texto0 DB 10,13, 'Ejercicio 2: $'
	texto1 DB 10,13, 'Ingresar numero 1: $'
	texto2 DB 10,13, 'Ingresar numero 2: $'
	texto3 DB 10,13, 'Son iguales$'
	texto4 DB 10,13, 'No son iguales$'
	texto5 DB 10,13, 'El primero es mayor$'
	texto6 DB 10,13, 'El segundo es mayor$'
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
	
	;Definir si son iguales
	MOV BL, num1
	MOV CL, num2
	CMP BL, CL
	JNE Diferentes
	JMP Iguales

	Diferentes:
		MOV DX, OFFSET texto4
		MOV AH, 09h
		INT 21h
		JMP Mayor

	Iguales:
		MOV DX, OFFSET texto3
		MOV AH, 09h
		INT 21h
		JMP FINALIZAR

	Mayor:
		JS SegundoMayor
		JMP PrimeroMayor

	PrimeroMayor:
		MOV DX, OFFSET texto5
		MOV AH, 09h
		INT 21h
		JMP FINALIZAR

	SegundoMayor:
		MOV DX, OFFSET texto6
		MOV AH, 09h
		INT 21h
		JMP FINALIZAR

	FINALIZAR:
		MOV AH, 4Ch
		INT 21h	
END Programa