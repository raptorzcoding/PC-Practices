# Autor: Pablo Garcia de los Reyes
# Fecha: 05/02/2024
# PR2
# /*
# Introducir dos números enteros por consola. Mostrar los números del rango que va 
# desde el menor al mayor con paso 1, normalizados como flotantes entre cero y uno. 
# Por ejemplo, si se introduce 0 y 5 deberá producir 0, 0.2, 0.4, 0.6, 0.8, 1.
# */

# #include<iostream>
# int main(void) {
#     int min,max,distancia;
#     float normalizado;  

#     std::cout << "Normalizar un rango de enteros a flotantes entre 0 y 1. \nIntroduzca los límites del rango [min,max].\n";
#     do {
#         std::cout << "Introduzca límite inferior del rango (min): ";
#         std::cin >> min;
#         std::cout << "Introduzca límite superior del rango (max): ";
#         std::cin >> max;
#         if (max <= min)
#             std::cout << "Error. min tiene que ser menor estrictamente que max.\n";
#     } while (max <= min);
#     int i;
#     for (i = min ; i <= max ; i++) {
#         normalizado = float((i - min)) / float((max - min));
#         std::cout << "Normalizado(" << i << ") = " << normalizado << std::endl;
#     }
#     std::cout << "\nFIN DEL PROGRAMA.\n";

# Tabla de valores
# $s0 = min = 2
# $s1 = max = 4
# $s2 = i



    .data 
titulo: .asciiz "Normalizar un rango de enteros a flotantes entre 0 y 1. \nIntroduzca los límites del rango [min,max].\n"
cadmin: .asciiz "\nIntroduzca límite inferior del rango (min): "
cadmax: .asciiz "\nIntroduzca límite superior del rango (max): "
caderr: .asciiz "\nError. min tiene que ser menor estrictamente que max.\n"
cadfin: .asciiz "\nFIN DEL PROGRAMA.\n"
cadnor: .asciiz "\nNormalizado("
cadigu: .asciiz ") = "
cadlin: .asciiz "\n"

    .text
main:
    
    li $v0, 4
    la $a0, titulo
    syscall
do:
    # Sacar cadena por pantalla
    li $v0, 4
    la $a0, cadmin
    syscall
    # Pedir limite inferior
    li $v0, 5
    syscall
    move $s0, $v0
    # Sacar cadena por pantalla
    li $v0, 4
    la $a0, cadmax
    syscall
    # Pedir limite superior
    li $v0, 5
    syscall
    move $s1, $v0
    
    ble $s1, $s0, if
    b condicion
if:
    
    li $v0, 4
    la $a0, caderr
    syscall
    b do
    
condicion:

    move $s2, $s0 # i = min
for:
    bgt $s2, $s1, fin
    
    mtc1 $s0,$f20
    cvt.s.w $f21, $f20 # $f21 = min
    
    mtc1 $s1,$f20
    cvt.s.w $f22, $f20 # $f22 = max
    
    mtc1 $s2,$f20
    cvt.s.w $f23, $f20 # $f23 = i
    
    sub.s $f24, $f23, $f21 # resta 1
    
    sub.s $f25, $f22, $f21 # resta 2
    
    div.s $f26, $f24, $f25 # normalizado = resta 1 / resta 2
    
    li $v0, 4
    la $a0, cadnor
    syscall
    
    li $v0, 2
    mov.s $f12, $f23
    syscall
    
    li $v0, 4
    la $a0, cadigu
    syscall
    
    li $v0, 2
    mov.s $f12, $f26
    syscall
    
    li $v0, 4
    la $a0, cadlin
    syscall
    
    addi $s2, 1
    b for
fin:
    li $v0, 4
    la $a0, cadfin
    syscall
    
    li $v0, 10
    syscall
