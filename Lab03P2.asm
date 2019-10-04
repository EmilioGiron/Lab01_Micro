.MODEL small
.DATA

	texto0 DB 10,13, 'Ejercicio 2: $'
	texto1 DB 10,13, 'Ingresar numero 1: $'
	texto2 DB 10,13, 'Ingresar numero 2: $'
	texto3 DB 10,13, 'Total: $'
	texto4 DB 10,13, 'Diferencia: $'
	texto5 DB 10,13, 'Producto: $'
	texto6 DB 10,13, 'Cociente: $'
	texto7 DB 10,13, 'Residuo: $'
	total DB ?
	diferencia DB ?
	producto DB ?
	cociente DB ?
	residuo DB ?
	num1 DB ?		
	num2 DB ?		;Inicializando la variable

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

	;Leer numero 1:
	XOR AX, AX
	MOV AH, 01h
	INT 21h
	SUB AL, 30h
	MOV num1, AL

	;Mostrar mensaje texto2
	MOV DX, OFFSET texto2
	MOV AH, 09h
	INT 21h

	;Leer numero 2:
	XOR AX, AX
	MOV AH, 01h
	INT 21h
	SUB AL, 30h
	MOV num2, AL


	;OPERACIONES ARITMETICAS

	;Suma
	MOV DX, OFFSET texto3
	MOV AH, 09h
	INT 21h

	XOR CX, CX
	MOV CL, num1
	ADC CL, num2

	XOR AX, AX
	MOV AL, CL
	MOV BL, 10
	DIV BL
	XOR BX, BX
	XOR CX, CX
	MOV BL, AL
	ADD BL, 30h
	MOV CL, AH
	ADD CL, 30h
	
	MOV DX, OFFSET BX
	MOV AH, 02h
	INT 21h
	MOV DX, OFFSET CX
	MOV AH, 02h
	INT 21h 

	;Resta
	MOV DX, OFFSET texto4
	MOV AH, 09h
	INT 21h

	XOR CX, CX
	MOV CL, num1
	SUB CL, num2
	ADD CL, 30h
	MOV DX, OFFSET CX
	MOV AH, 02h
	INT 21h

	;Multiplicacion:
	MOV DX, OFFSET texto5
	MOV AH, 09h
	INT 21h

	XOR AX, AX
	MOV AL, num1
	IMUL num2
	XOR BX, BX
	MOV BL, 10	
	DIV BL
	XOR BX, BX
	XOR CX, CX
	MOV BL, AL
	ADD BL, 30h
	MOV CL, AH
	ADD CL, 30h
	
	MOV DX, OFFSET BX
	MOV AH, 02h
	INT 21h
	MOV DX, OFFSET CX
	MOV AH, 02h
	INT 21h 

	;Division
	XOR DX, DX
	MOV DX, OFFSET texto6
	MOV AH, 09h
	INT 21h

	XOR AX, AX
	MOV AL, num1
	DIV num2
	XOR CX, CX
	XOR BX, BX
	MOV CL, AL
	ADD CL, 30h
	MOV BL, AH
	ADD BL, 30h
	MOV DX, OFFSET CX
	MOV AH, 02h
	INT 21h

	XOR DX, DX
	MOV DX, OFFSET texto7
	MOV AH, 09h
	INT 21h

	MOV DX, OFFSET BX
	MOV AH, 02h
	INT 21h

	;FINALIZAR
	MOV AH, 4Ch
	INT 21h	
END Programa