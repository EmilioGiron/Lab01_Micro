.386
.model flat, stdcall
option casemap:none

;includes
include \masm32\include\windows.inc ;incluye formularios 
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc ;hace llamada a la hora del sistema

;macros
include \Macros\macros.lib

;librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

;Segmento de datos
.DATA
	texto1 db "Ingrese un numero (Max 12): ",0
.DATA?
num1 DW 20 dup(?)
total DD 20 dup(?)


.CODE
programa:
	
	INVOKE StdOut, addr texto1
	INVOKE StdIn, addr num1, 8
	INVOKE atodw, addr num1
	MOV num1, AX

	MOV EAX, 1
	MOV total,1
	MOV BX,0
	Ciclo:
		INC BX
		MOV CX, BX
		CMP CX,2
		JB Fin
		SUB CX, 1
		MOV EDX, total
		Contador:
			ADD EDX,total
			SUB CX,1
			CMP CX,0
			JA Contador
			MOV total, EDX
		Fin:
		CMP BX,num1
		JB Ciclo
	print str$(total)

	;finalizar
finalizar:
	INVOKE ExitProcess,0
END programa