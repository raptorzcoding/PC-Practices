# // Autor: Pablo García de los Reyes
# // Fecha última modificación: 30/04/2024

sizeD = 8
LF = 10
SPACE = 32

    .data
n1:     .word 10
v1:     .double 10.5, 19.5, 7.25, -76.25, 5.75, 4.5, 4.25, 3.5, -1.5, -2.0
n2:     .word 5
v2:     .double 5.5, 44.5, 24.25, -2.5, 2.5
cad1:   .asciiz "\nPrincipio de computadores. ME1. Normalizando vector ...\n"
cad2:   .asciiz "\nNuevo max: "
cad3:   .asciiz "\nResultado ...\n"

    .text
##########################################################################    
printvec: # imprime un vector de doubles por consola separados por espacio
        # $a0 direccion de memoria del vector
        # $a1 numero de elementos del vector
        addi $sp,-12
        sw $ra,0($sp)
        sw $s0,4($sp)
        sw $s1,8($sp)
 
        bnez $a1,pv_nozero
            li $v0,11
            li $a0,10
            syscall
            j printvec_f
        pv_nozero:
            move $s0,$a0
            move $s1,$a1
            l.d $f12,0($s0)
            li $v0,3
            syscall
            li $a0,32
            li $v0,11
            syscall
            add $a0,$s0,8
            add $a1,$s1,-1
            jal printvec
        printvec_f:
            lw $ra,0($sp)
            lw $s0,4($sp)
            lw $s1,8($sp)
            addi $sp,12
            jr $ra
##########################################################################

# double maxvect(double *v, const int n) {
#     double max = 0.0;
#     for (int i = 0 ; i < n ; i++) {
#         double elto = fabs(v[i]);
#         if (elto > max) {
#             max = elto;
#             std::cout << "\nNuevo max: " << max;
#         }
#     }
#     return(max);
# }
# $s5 = v  //  $s6 = n
# $f20 = max // $f22 = elto
maxvect:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	move $s5, $a0 # $s5 = v
	move $s6, $a1 # $s6 = n
	li.d $f20, 0.0 # max = 0.0
	li $s0, 0 # i = 0
	for_max: # for (int i = 0 ; i < n ; i++) {
		mul $t1, $s0, sizeD
		add $t1, $t1, $s5
		l.d $f6, 0($t1) # v[i]
		abs.d $f22, $f6 # elto = fabs(v[i])
		
		c.le.d $f22, $f20 # if (elto > max)
		bc1t fin_for_max
		
		if:
			mov.d $f20, $f22 # max = elto;
			
			li $v0, 4
			la $a0, cad2
			syscall # std::cout << "\nNuevo max: "
			
			li $v0, 3
			mov.d $f12, $f20
			syscall # << max;
	fin_for_max:
		addi $s0, 1 # i++
		blt $s0, $s6, for_max # i < n?
	return:
		mov.d $f0, $f20 # return(max)
		lw $ra,0($sp)
		addi $sp,$sp,4 
		jr $ra # retornar funcion
maxvect_fin:

# void normaliza (double *v, const int n) {
#     double cociente = maxvect(v,n);
#     if (cociente == 0) return;
#     for (int i = 0 ; i < n ; i++) {
#          v[i] = v[i] / cociente;
#     }
#     return;
# }
# $s1 = v  //  $s2 = n
# $f4 = v[i] // $s3 = i
normaliza:
	move $s1, $a0 # $s1 = v
	move $s2, $a1 # $s2 = n
	# PUSH
	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	jal maxvect # maxvect(v,n)
	
	li.d $f4, 0.0 # constante 0
	c.eq.d $f0, $f4 # cociente == 0
	bc1t return_normaliza # return;
	
	li $s3, 0 # i = 0
	
	for_normaliza: # for (int i = 0 ; i < n ; i++) {
		mul $t0, $s3, sizeD
		add $t0, $t0, $s1
		l.d $f4, 0($t0) # v[i]
		
		div.d $f4. $f4, $f0 # v[i] / cociente
		s.d $f4, 0($t0) # v[i] = v[i] / cociente
	fin_for_normaliza:
		addi $s3, 1 # i++
		blt $s3, $s2, for_normaliza # i < n
	return_normaliza:
	# POP
	lw $ra,0($sp)
	addi $sp,$sp,4 
	
	jr $ra # retornar funcion
fin_normaliza:
  
# int main(void) {
#     std::cout << "\nPrincipio de computadores. ME1. Normalizando vector ...\n";
#     printvec(v1,n1);  
#     normaliza(v1,n1); 
#     std::cout << "\nResultado ...\n";
#     printvec(v1,n1);
#     std::cout << "\nPrincipio de computadores. ME1. Normalizando vector ...\n";
#     printvec(v2,n2);
#     normaliza(v2,n2);     
#     std::cout << "\nResultado ...\n";
#     printvec(v2,n2);   
#     return(0);
# }

main:
	li $v0, 4
	la $a0, cad1
	syscall #     std::cout << "\nPrincipio de computadores. ME1. Normalizando vector ...\n";
	
	la $a0, v1
	lw $a1, n1
	
	jal printvec #     printvec(v1,n1);  
	
	la $a0, v1
	lw $a1, n1
	
	jal normaliza #     normaliza(v1,n1); 
	
	li $v0, 4
	la $a0, cad3 #     std::cout << "\nResultado ...\n";
	syscall
	
	la $a0, v1
	lw $a1, n1
	
	jal printvec #     printvec(v1,n1);
	
	
	li $v0, 4
	la $a0, cad1
	syscall #     std::cout << "\nPrincipio de computadores. ME1. Normalizando vector ...\n";
	
	la $a0, v2
	lw $a1, n2
	
	jal printvec #     printvec(v2,n2);
	
	la $a0, v2
	lw $a1, n2
	
	jal normaliza #     normaliza(v2,n2);     
	
	li $v0, 4
	la $a0, cad3 #     std::cout << "\nResultado ...\n";
	syscall
	
	la $a0, v2
	lw $a1, n2
	
	jal printvec #     printvec(v2,n2);   
	
	li $v0, 10
	syscall #     return(0);
