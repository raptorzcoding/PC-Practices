# PR1. PRINCIPIO DE COMPUTADORES.
# Autor: Pablo García de los Reyes
# Fecha ultima modificacion: 28/02/2024
# Tabla de valores (principalmente los registros salvados esenciales para la elaboración del programa)
# $f20 = error_maximo
# $f22 = error_minimo
# $f24 = número e
# $f26 = factoriales de la serie del número e
# $f28 = número de términos
# $f30 = último término

	.data

titulo:		.asciiz "\nPR1: Principio de computadores.\n"
pet:		.asciiz "\nIntroduzca maximo error permitido: "
caderr:		.asciiz "\nError: el dato introducido debe cumplir 0.00001 <= dato < 1\n"
cade:		.asciiz "\nNumero e: "
cadnt:		.asciiz "\nNumero de terminos: "
cadfin:		.asciiz "\nPR1: Fin del programa.\n"
error_maximo:	.double 1.0
error_minimo:	.double 0.00001
uno:	    .double 1.0

	.text

main:

# Imprime el mensaje inicial al comenzar el programa
li $v0, 4
la $a0, titulo
syscall

# Carga en los registros $f20 y $f22 los limites de error admisibles. 
l.d $f20, error_maximo  # Asignamos $f20=1.0
l.d $f22, error_minimo   # Asignamos $f22=0.0001

j pedir_error      # Procede a pedir el error.

mensaje_error: # Mensaje de error si el dato introducido no cumple los limites
li $v0, 4
la $a0, caderr
syscall

pedir_error: 
# Imprime el mensaje de máximo error permitido
li $v0, 4
la $a0, pet
syscall

# Pide al usuario que introduzca el error
li $v0, 7
syscall

mov.d $f4, $f0  # $f4= error introducido

# Comparacion que mira si el error establecido está dentro de los limites
c.le.d $f22, $f4    # min_error < error?
bc1f mensaje_error      # Si no se cumple, salta a error_msg
c.lt.d $f4, $f20    # error < max_error?
bc1f mensaje_error       # Si no se cumple, saltar a error_msg

cargar_valores: # Introduce los valores correspondientes en cada registro
li.d $f24, 1.0       # e = 1.0
li.d $f26, 1.0       # fact = 1.0
li.d $f28, 1.0       # numterminos = 1.0
li.d $f30, 1.0       # ultimo_termino = 1.0
l.d $f8, uno       # mete el constante 1 en el registro $f8 para futuros calculos

calcular_e: # Bucle while
c.lt.d $f30, $f4     # Condición del while ultimo_termino > error
bc1t cout_resultado

mul.d $f26, $f26, $f28  # fact *= numterminos;
div.d $f30, $f8, $f26   # ultimo_termino = 1/fact;
add.d $f24, $f24, $f30  # e += ultimo_termino,
add.d $f28, $f28, $f8   # numterminos++

b calcular_e  # Vuelve a la comprobación del while

cout_resultado: # Imprimir los valores finales
li $v0, 4        # Imprime string
la $a0, cade
syscall

li $v0, 3        # Imprime e
mov.d $f12, $f24
syscall

li $v0, 4        # Imprime la string de número de términos
la $a0, cadnt
syscall

li $v0, 3        # Imprime numterminos
mov.d $f12, $f28
syscall

fin_programa:     # Final del código
li $v0, 4
la $a0, cadfin 
syscall

li $v0, 10
syscall
