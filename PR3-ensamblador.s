#// Solución PR3 curso 23-24
#// Manejo de matrices con funciones
# Pablo García de los Reyes
# 14/04/2024
#
#typedef struct {
#  int nFil;
nFil = 0	# El desplazamiento al campo dentro de la estructura
#  int nCol;
nCol = 4	# El desplazamiento al campo dentro de la estructura
#  float elementos[];
elementos = 8	# El desplazamiento al campo dentro de la estructura
#} structMat;
#

sizeF = 4	# Numero de bytes de un float
LF = 10		# Caracter salto de línea
	.data
#structMat mat1 {
#  6,
#  6,
#  {
#    11.11, 12.12, 13.13, 14.14, 15.15, 16.16,
#    21.21, 22.22, 23.23, 24.24, 25.25, 26.26,
#    31.31, 32.32, 33.33, 34.34, 35.35, 36.36,
#    41.41, 42.42, 43.43, 44.44, 45.45, 46.46,
#    51.51, 52.52, 53.53, 54.54, 55.55, 56.56,
#    61.61, 62.62, 63.63, 64.64, 65.65, 66.66
#  }
#};
mat1:	.word	6
	.word	6
	.float	11.11, 12.12, 13.13, 14.14, 15.15, 16.16,
	.float	21.21, 22.22, 23.23, 24.24, 25.25, 26.26,
	.float	31.31, 32.32, 33.33, 34.34, 35.35, 36.36,
	.float	41.41, 42.42, 43.43, 44.44, 45.45, 46.46,
	.float	51.51, 52.52, 53.53, 54.54, 55.55, 56.56,
	.float	61.61, 62.62, 63.63, 64.64, 65.65, 66.66

#structMat mat2 {
#  7,
#  10,
#  {
#    -36.886, -58.201,  78.671,  19.092, -50.781,  33.961, -59.511, 12.347,  57.306,  -1.938,
#    -86.858, -81.852,  54.623, -22.574,  88.217,  64.374,  52.312, 47.918, -83.549,  19.041,
#     4.255, -36.842,  82.526,  27.394,  56.527,  39.448,  18.429, 97.057,  76.933,  14.583,
#    67.79 ,  -9.861, -96.191,  32.369, -18.494, -43.392,  39.857, 80.686, -36.87 , -17.786,
#    30.073,  89.938,  -6.889,  64.601, -85.018,  70.559, -48.853, -62.627, -60.147,  -5.524,
#    84.323, -51.718,  93.127, -10.757,  32.119,  98.214,  69.471, 73.814,   3.724,  57.208,
#    -41.528, -17.458, -64.226, -71.297, -98.745,   7.095, -79.112, 33.819,  63.531, -96.181
#  }
#};
mat2:	.word	7
	.word	10
	.float	-36.886, -58.201,  78.671,  19.092, -50.781,  33.961, -59.511, 12.347,  57.306,  -1.938,
	.float	-86.858, -81.852,  54.623, -22.574,  88.217,  64.374,  52.312, 47.918, -83.549,  19.041,
	.float	4.255, -36.842,  82.526,  27.394,  56.527,  39.448,  18.429, 97.057,  76.933,  14.583,
	.float	67.79 ,  -9.861, -96.191,  32.369, -18.494, -43.392,  39.857, 80.686, -36.87 , -17.786,
	.float	30.073,  89.938,  -6.889,  64.601, -85.018,  70.559, -48.853, -62.627, -60.147,  -5.524,
	.float	84.323, -51.718,  93.127, -10.757,  32.119,  98.214,  69.471, 73.814,   3.724,  57.208,
	.float	-41.528, -17.458, -64.226, -71.297, -98.745,   7.095, -79.112, 33.819,  63.531, -96.181

# structMat mat3 {
#   1,
#   8,
#   {
#     -36.52,  35.3 ,  79.05, -58.69, -55.23, -19.44, -88.63, -93.61
#   }
# };
mat3:	.word	1
	.word	8
	.float	-36.52,  35.3 ,  79.05, -58.69, -55.23, -19.44, -88.63, -93.61

# structMat mat4 {
#   16,
#   1,
#   { -90.57, -65.11, -58.21, -73.23, -89.38, -79.25,  16.82,  66.3 ,
#     -96.14, -97.16, -24.66,   5.27, -33.5 , -13.09,  27.13, -74.83 }
# };
mat4:	.word	16
	.word	1
	.float	-90.57, -65.11, -58.21, -73.23, -89.38, -79.25,  16.82,  66.3
	.float	-96.14, -97.16, -24.66,   5.27, -33.5 , -13.09,  27.13, -74.83

# structMat mat5 {
#   1,
#   1,
#   { 78.98 }
# };
mat5:	.word	1
	.word	1
	.float	78.98

# structMat mat6 {
#   0,
#   0,
#   { 0 }
# };
mat6:	.word	0
	.word	0
	.float	0.0

#float infinito = INFINITY;
infinito:	.word	0x7F800000

# Cadenas de caracteres
str_titulo:	.asciiz	"\nComienza programa manejo matrices con funciones\n"
str_menu:	.ascii	"(0) Terminar el programa\n"
		.ascii	"(1) Cambiar la matriz de trabajo\n"
		.ascii	"(3) Cambiar el valor de un elemento\n"
		.ascii	"(4) Intercambiar un elemento con su opuesto\n"
		.ascii	"(7) Encontrar el minimo\n"
		.asciiz	"\nIntroduce opción elegida: "
str_errorOpc:	.asciiz	"Error: opcion incorrecta\n"
str_termina:	.asciiz	"\nTermina el programa\n"
str_elijeMat:	.asciiz	"\nElije la matriz de trabajo (1..6): "
str_numMatMal:	.asciiz	"Numero de matriz de trabajo incorrecto\n"
str_errorFil:	.asciiz	"Error: dimension incorrecta.  Numero de fila incorrecto\n"
str_errorCol:	.asciiz	"Error: dimension incorrecta.  Numero de columna incorrecto\n"
str_indFila:	.asciiz	"\nIndice de fila: "
str_indCol:	    .asciiz	"Indice de columna: "
str_nuevoValor:	.asciiz	"Nuevo valor para el elemento: "
str_valMin:	    .asciiz	"\nEl valor minimo esta en ("
str_conValor:	.asciiz	") con valor "

str_matTiene:	.asciiz	"\n\nLa matriz tiene dimension "

    .text

# -----------------------------FUNCIONES--------------------------------
# Función para imprimir una matriz
# Swap de dos elementos
# Intercambiar elementos opuestos
# Encontrar el mínimo



# ------------------Función para imprimir una matriz-------------------
#
# --------------------------PARÁMETROS---------------------------------
# $a0: Dirección de la matriz de trabajo 
#
# --------------------------REGISTROS----------------------------------
# $s1: Fila
# $s2: Columna
# $s3: Dirección de los elementos
# $f20: Elemento
# $s4: f (variable del bucle para recorrer las filas)
# $s5: c (variable del bucle para recorrer las columnas)
# $ra: Dirección de retorno de función

print_mat:

    # Guardamos los registros usados en pila
    subu $sp, $sp, 32 # 8 registros * 4 bytes = 32 bytes
    sw $s1, 0($sp) # Guardar nFil
    sw $s2, 4($sp) # Guardar nCol
    sw $s3, 8($sp) # Guardar la dirección de elementos
    s.s $f20, 12($sp) # Guardar el elemento
    sw $s4, 16($sp) # Guardar f
    sw $s5, 20($sp) # Guardar c
    sw $s6, 24($sp) # Guardar formula matriz
    sw $ra, 28($sp) # Guardar la dirección de retorno
    

    # Cargar los valores de nFil y nCol desde la estructura mat
    lw $s1, nFil($a0)  # Cargar nFil
    lw $s2, nCol($a0)  # Cargar nCol
    la $s3, elementos($a0)  # Cargar la dirección de elementos en $s3
    
    # Imprimir mensaje de dimensiones de la matriz
    li $v0, 4
    la $a0, str_matTiene
    syscall
    # Imprimir nFil
    move $a0, $s1
    li $v0, 1
    syscall
    # Imprimir "x"
    li $v0, 11
    li $a0, 120
    syscall
    # Imprimir nCol
    move $a0, $s2
    li $v0, 1
    syscall
    # Imprimir salto de línea
    li $v0, 11
    li $a0, 10
    syscall

    # Bucle para imprimir los elementos de la matriz
    li $s4, 0  # Inicializar f en 0
    loop_f:
        # Comprobar si f < nFil
        bge $s4, $s1, exit_loop_f  # Salir del bucle si f >= nFil
        li $s5, 0  # Inicializar c en 0

        loop_c:
            # Comprobar si c < nCol
            bge $s5, $s2, exit_loop_c  # Salir del bucle si c >= nCol

            # Calcular el índice del elemento en elem[f*nCol + c]
            mul $s6, $s4, $s2  # f * nCol
            add $s6, $s6, $s5  # f * nCol + c
            mul $s6, $s6, sizeF  # Multiplicar por sizeF para obtener la dirección en bytes

            # Cargar el elemento de la matriz
            addu $s6, $s6, $s3  # Calcular la dirección del elemento
            lwc1 $f20, 0($s6)  # Cargar el elemento en $f20

            # Imprimir el elemento
            li $v0, 2
            mov.s $f12, $f20
            syscall

            # Imprimir espacio
            li $v0, 11
            li $a0, 32
            syscall

            # c++
            addi $s5, $s5, 1
            j loop_c

        exit_loop_c:
        # Imprimir salto de línea
        li $v0, 11
        li $a0, 10
        syscall

        # f++
        addi $s4, $s4, 1
        j loop_f

    exit_loop_f:

        # Imprimir salto de línea
        li $v0, 11
        li $a0, 10
    	syscall

        # Restauramos los regsitros de la pila
        lw $s1, 0($sp) # Guardar nFil
        lw $s2, 4($sp) # Guardar nCol
        lw $s3, 8($sp) # Guardar la dirección de elementos
        l.s $f20, 12($sp) # Guardar el elemento
        lw $s4, 16($sp) # Guardar f
        lw $s5, 20($sp) # Guardar c
        lw $s6, 24($sp) # Guardar formula matriz
        lw $ra, 28($sp) # Guardar la dirección de retorno
        subu $sp, $sp, -32
        
        # Retornar
        jr $ra

    print_mat_fin:
        

# --------------------Función para cambiar un elemento de la matriz--------------------
#
# -----------------------------------PARÁMETROS----------------------------------------
# $a0: Dirección de la matriz de trabajo
# $a1: Fila
# $a2: Columna
# $f12: Nuevo valor del elemento
#
# -----------------------------------REGISTROS-----------------------------------------
# $t3: nCol
# $t4: Dirección de los elementos
# $ra: Dirección de retorno de función

change_elto:

    move $t0, $a0 # Guardar la dirección de la matriz de trabajo
    move $t1, $a1 # Guardar la fila
    move $t2, $a2 # Guardar la columna
    mov.s $f10, $f12 # Guardar el nuevo valor del elemento

    lw $t3, 4($t0) # SACA EL CONTENIDO DE LA DIRECCIÓN DE MEMORIA A 4 BYTES DE $S0 // Saca el numero de columnas (que está a 4 bytes), también puedes sustituir 4 por nCol
    la $t4, 8($t0) # SACA EL PRIMER NÚMERO DE LA MATRIZ

    mul $t5, $t1, $t3 # i * ncol
    add $t5, $t5, $t2 # i * ncol + j
    mul $t5, $t5, sizeF # (i * ncol + j) * sizeF
    add $t5, $t5, $t4 # ((i * ncol + j) * sizeF) + Dirección de memoria en la que comienzan los elementos

    s.s $f10, 0($t5) # Cambia el número de la posición indicada por el nuevo almacenado en $f4
    jr $ra
change_elto_fin:



# ------------------------Función para intercambiar dos elementos----------------------
# -----------------------------------PARÁMETROS----------------------------------------
# $a0: Dirección del primer elemento
# $a1: Dirección del segundo elemento
# $f13: Valor del primer elemento
# $f14: Valor del segundo elemento
# -----------------------------------REGISTROS-----------------------------------------
# $ra: Dirección de retorno de función

swap:
    # Cargar los valores de los elementos a intercambiar
    l.s $f13, 0($a0)
    l.s $f14, 0($a1)
    # Intercambiar los elementos
    s.s $f14, 0($a0)
    s.s $f13, 0($a1)

    jr $ra # Retornar
swap_fin:
    

# ------------------Función para intercambiar dos elementos opuestos-------------------
# -----------------------------------PARÁMETROS----------------------------------------
# $a0: Dirección de la matriz de trabajo
# $a1: Fila
# $a2: Columna
# -----------------------------------REGISTROS-----------------------------------------
# $t3: nCol
# $t4: nFil
# $t5: Dirección de los elementos
# $t6: Índice del primer elemento (e1)
# $t7: Índice del segundo elemento (e2)
# $ra: Dirección de retorno de función

intercambia:
    lw $t3, nCol($a0) # Cargar nCol
    lw $t4, nFil($a0) # Cargar nFil
    addu $t5, $a0, elementos # Cargar la dirección de los elementos

    mul $t6, $a1, $t3 # i * ncol
    addu $t6, $t6, $a2 # i * ncol + j
    mul $t6, $t6, sizeF # (i * ncol + j) * sizeF
    addu $t6, $t6, $t5 # ((i * ncol + j) * sizeF) + Dirección de memoria en la que comienzan los elementos

    subu $t7, $t4, $a1 # nFil - i
    subu $t7, $t7, 1 # nFil - i - 1
    mul $t7, $t7, $t3 # (nFil - i - 1) * nCol
    subu $t8, $t3, $a2 # nCol - j
    subu $t8, $t8, 1 # nCol - j - 1
    addu $t7, $t7, $t8 # (nFil - i - 1) * nCol + (nCol - j - 1)
    mul $t7, $t7, sizeF # ((nFil - i - 1) * nCol + (nCol - j - 1)) * sizeF
    addu $t7, $t7, $t5 # (((nFil - i - 1) * nCol + (nCol - j - 1)) * sizeF) + Dirección de memoria en la que comienzan los elementos

    move $a0, $t6 # Pasar la dirección del primer elemento
    move $a1, $t7 # Pasar la dirección del segundo elemento

    subu $sp, $sp, 4 # Reservar espacio en la pila
    sw $ra, 0($sp) # Guardar la dirección de retorno en la pila

    jal swap # Llamar a la función swap

    lw $ra, 0($sp) # Recuperar la dirección de retorno de la pila
    subu $sp, $sp, -4 # Liberar espacio en la pila

    jr $ra # Retornar
intercambia_fin:
    

# ------------------Función para imprimir el minimo de una matriz----------------------
# -----------------------------------PARÁMETROS----------------------------------------
# $s0: Dirección de la matriz de trabajo
# -----------------------------------REGISTROS-----------------------------------------
# $t1: nCol
# $t2: nFil
# $t3: Dirección de los elementos
# $t4: Fila del valor mínimo
# $t5: Columna del valor mínimo
# $f4: Valor mínimo
# $f6: Elemento actual
# $t7: f (variable del bucle para recorrer las filas)
# $t8: c (variable del bucle para recorrer las columnas)
# $ra: Dirección de retorno de función

find_min:
    lw $t1, nCol($a0) # Cargar nCol
    lw $t2, nFil($a0) # Cargar nFil
    addu $t3, $a0, elementos # Cargar la dirección de los elementos
    l.s $f4, infinito # Cargar infinito en $f4
    li $t4, -1 # Inicializar fmin
    li $t5, -1 # Inicializar cmin

    blez $t1, return_funcion # Si nCol <= 0, retornar
    blez $t2, return_funcion # Si nFil <= 0, retornar

    li $t7, 0 # Inicializar f en 0

for_filas:
    li $t8, 0 # Inicializar c en 0

for_columnas:
    mul $t9, $t7, $t1 # f * nCol
    addu $t9, $t9, $t8 # f * nCol + c
    mul $t9, $t9, sizeF # (f * nCol + c) * sizeF

    addu $t9, $t9, $t3 # ((f * nCol + c) * sizeF) + Dirección de memoria en la que comienzan los elementos
    l.s $f6, 0($t9) # Cargar el elemento en $f6

    c.lt.s $f6, $f4 # Comparar el elemento actual con el mínimo
    bc1f for_columnas_fin # Saltar si el elemento actual no es menor que el mínimo
valor_menor_min:

    mov.s $f4, $f6 # Actualizar el mínimo
    move $t4, $t7 # Actualizar fmin 
    move $t5, $t8 # Actualizar cmin

for_columnas_fin:
    addi $t8, $t8, 1 # c++
    blt $t8, $t1, for_columnas # Bucle para recorrer las columnas

for_filas_fin:
    addi $t7, $t7, 1 # f++
    blt $t7, $t2, for_filas # Bucle para recorrer las filas

return_funcion:
    mov.s $f0, $f4 # Retornar el valor mínimo
    move $v0, $t4 # Retornar la fila del valor mínimo
    move $v1, $t5 # Retornar la columna del valor mínimo

    jr $ra # Retornar
find_min_fin:
    


.text
main:
    # Imprimir mensaje de inicio del programa
    li $v0, 4
    la $a0, str_titulo
    syscall

    la $s0, mat1  # Matriz de trabajo por defecto

while_true:
    move $a0, $s0  # Pasar la dirección de la matriz de trabajo
    # Llamar a la función print_mat
    jal print_mat

    # Imprimir menú de opciones
    li $v0, 4
    la $a0, str_menu
    syscall

    # Leer opción del usuario
    li $v0, 5
    syscall
    move $t6, $v0  # Guardar la opción en $t6

    # Procesar la opción seleccionada
    beq $t6, 0, exit  # Salir del programa si la opción es 0
    beq $t6, 1, change_matrix  # Cambiar la matriz de trabajo si la opción es 1
	beq $t6, 3, cambiar_elemento # Cambiar un elemento de la matriz si la opción es 3
    beq $t6, 4, cambiar_opuesto # Cambiar un elemento de la matriz si la opción es 3
    beq $t6, 7, encontrar_minimo  # Encontrar el mínimo si la opción es 7

    # Opción incorrecta
    li $v0, 4
    la $a0, str_errorOpc
    syscall

    j while_true  # Volver al inicio del bucle

# -----------------------------OPCIONES--------------------------------
# (0) Terminar el programa
# (1) Cambiar la matriz de trabajo
# (3) Cambiar el valor de un elemento
# (4) Intercambiar un elemento con su opuesto
# (7) Encontrar el minimo
   
exit: # (0) Terminar el programa

    # Salir del programa
	li $v0, 4
    la $a0, str_termina
    syscall

    li $v0, 10
    syscall


change_matrix: # (1) Cambiar la matriz de trabajo
    # Imprimir mensaje para elegir matriz de trabajo
    li $v0, 4
    la $a0, str_elijeMat
    syscall

    # Leer la opción de matriz del usuario
    li $v0, 5
    syscall
    move $t6, $v0  # Guardar la opción en $t6

    # Seleccionar la matriz de trabajo según la opción
    beq $t6, 1, select_mat1
    beq $t6, 2, select_mat2
    beq $t6, 3, select_mat3
    beq $t6, 4, select_mat4
    beq $t6, 5, select_mat5
    beq $t6, 6, select_mat6

    # Opción incorrecta
    li $v0, 4
    la $a0, str_numMatMal
    syscall
    j while_true

select_mat1:
    la $s0, mat1  
    j while_true

select_mat2:
    la $s0, mat2  
    j while_true

select_mat3:
    la $s0, mat3
    j while_true

select_mat4:
    la $s0, mat4
    j while_true

select_mat5:
    la $s0, mat5 
    j while_true

select_mat6:
    la $s0, mat6
    j while_true


cambiar_elemento: # (3) Cambiar el valor de un elemento

	# Pide la fila al usuario
	li $v0, 4
    la $a0, str_indFila
    syscall

	# Leer la fila del elemento a cambiar
    li $v0, 5
    syscall
    move $s1, $v0  # Guardar la fila en $s1

    # Comprobar que la fila está dentro de los límites de la matriz
    lw $t1, 0($s0)  # Cargar nFil
    blt $s1, 0, fila_invalida
    bge $s1, $t1, fila_invalida

    # Continuar con el código si la fila es válida
    j fila_valida

    fila_invalida:
        # Mostrar mensaje de fila inválida
        li $v0, 4
        la $a0, str_errorFil
        syscall
        j while_true

    fila_valida:
        # Pide la columna al usuario
        li $v0, 4
        la $a0, str_indCol
        syscall

        # Leer la columna del elemento a cambiar
        li $v0, 5
        syscall
        move $s2, $v0  # Guardar la columna en $s2

        # Comprobar que la columna está dentro de los límites de la matriz
        lw $t2, 4($s0)  # Cargar nCol
        blt $s2, 0, col_invalida
        bge $s2, $t2, col_invalida

        j col_valida

    col_invalida:

        # Mostrar mensaje de columna inválida
        li $v0, 4
        la $a0, str_errorCol
        syscall
        j while_true

    col_valida:

        # Pide el elemento nuevo
        li $v0, 4
        la $a0, str_nuevoValor
        syscall

        li $v0, 6
        syscall
        mov.s $f4, $f0 

        move    $a0, $s0
        move    $a1, $s1
        move    $a2, $s2
        mov.s   $f12, $f4
	    
	    jal change_elto # LLAMA A LA FUNCIÓN QUE CAMBIA EL ELEMENTO
	    j while_true # VUELVE AL BUCLE

cambiar_opuesto: # (4) Intercambiar un elemento con su opuesto
    # Pide la fila al usuario
	li $v0, 4
    la $a0, str_indFila
    syscall

	# Leer la fila del elemento a cambiar
    li $v0, 5
    syscall
    move $s1, $v0  # Guardar la fila en $s1

    # Comprobar que la fila está dentro de los límites de la matriz
    lw $t1, 0($s0)  # Cargar nFil
    blt $s1, 0, fila_invalida_intercambio
    bge $s1, $t1, fila_invalida_intercambio

    # Continuar con el código si la fila es válida
    j fila_valida_intercambio

    fila_invalida_intercambio:
        # Mostrar mensaje de fila inválida
        li $v0, 4
        la $a0, str_errorFil
        syscall
        j while_true

    fila_valida_intercambio:
        # Pide la columna al usuario
        li $v0, 4
        la $a0, str_indCol
        syscall

        # Leer la columna del elemento a cambiar
        li $v0, 5
        syscall
        move $s2, $v0  # Guardar la columna en $t1

        # Comprobar que la columna está dentro de los límites de la matriz
        lw $t1, 4($s0)  # Cargar nCol
        blt $s2, 0, col_invalida_intercambio
        bge $s2, $t1, col_invalida_intercambio

        j col_valida_intercambio

    col_invalida_intercambio:
        # Mostrar mensaje de columna inválida
        li $v0, 4
        la $a0, str_errorCol
        syscall
        j while_true

    col_valida_intercambio:

        move $a0, $s0 # Pasar la dirección de la matriz de trabajo
        move $a1, $s1 # Pasar la fila
        move $a2, $s2 # Pasar la columna

        addiu $sp, $sp, -4 # Reservar espacio en la pila
        sw $s0, 0($sp)     # Guardar la dirección de retorno en la pila

        jal intercambia

        lw $s0, 0($sp)     # Recuperar la dirección de retorno de la pila
        addiu $sp, $sp, 4 # Liberar espacio en la pila 

        j while_true # VUELVE AL BUCLE

encontrar_minimo: # (7) Encontrar el mínimo

    li.s $f25, 0.0 # Inicializar el valor mínimo
    li $s6, 0 # Inicializar fmin
    li $s7, 0 # Inicializar cmin
    move $a0, $s0 # Pasar la dirección de la matriz de trabajo

    addiu $sp, $sp, -4 # Reservar espacio en la pila
    sw $s0, 0($sp) # Guardar la matriz en la pila

    jal find_min # Llamar a la función find_min

    lw $s0, 0($sp) # Recuperar la matriz de la pila
    addiu $sp, $sp, 4 # Liberar espacio en la pila

    mov.s $f25, $f0 # Guardar el valor mínimo en $f25
    move $s6, $v0 # Guardar la fila del valor mínimo en $s6
    move $s7, $v1 # Guardar la columna del valor mínimo en $s7

    li $v0, 4 # Imprimir mensaje de valor mínimo
    la $a0, str_valMin
    syscall

    li $v0, 1 # Imprimir la fila del valor mínimo
    move  $a0, $s6
    syscall

    li $v0, 11 # Imprimir ","
    li $a0, 44
    syscall

    li $v0, 1 # Imprimir la columna del valor mínimo
    move $a0, $s7
    syscall

    li $v0, 4 # Imprimir mensaje de valor mínimo
    la $a0, str_conValor
    syscall

    li $v0, 2
    mov.s $f12, $f25 # Imprimir el valor mínimo
    syscall

    j while_true # VUELVE AL BUCLE
        