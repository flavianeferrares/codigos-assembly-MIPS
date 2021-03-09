.data
	Numerog: .asciiz "Informe o valor de g: " # Cria Label
	Numeroh: .asciiz "Informe o valor de h: " # Cria Label
	Numeroi: .asciiz "Informe o valor de i: " # Cria Label
	Numeroj: .asciiz "Informe o valor de j: " #Cria Label
	
	Resultado: .asciiz "O resultado de if(i = j) f = g + h else f = g - h e: "

.text
	# Etapa para ler os valores
	# $t0 = g
	# $t1 = h
	# $t2 = i
	# $t3 = j
	
	li $v0, 4		# carrega o serviço
	la $a0, Numerog 	# carrega o endereço da label
	syscall 		# chamada do systema
	
	li $v0, 5		# ler o numero inteiro
	syscall 
	
	move $t0, $v0		# move $v0 para $t0
	
	li $v0, 4		# carrega o serviço 
	la $a0, Numeroh		# carrega o endereço da label
	syscall 		# chamada do systema
	
	li $v0, 5		# ler o numero inteiro
	syscall 
	
	move $t1, $v0		# move $v0 para $t1
	
	li $v0, 4 		# carrega o serviço
	la $a0, Numeroi		# carrega o endereço da label
	syscall			# chamada do systema
	
	li $v0, 5		# ler o numero inteiro
	syscall 
	
	move $t2, $v0		# move $v0 para $t2
	
	li $v0, 4 		# carrega o serviço
	la $a0, Numeroj		# carrega o endereço da label
	syscall 
	
	li $v0, 5		# ler o numero inteiro
	syscall 
	
	move $t3, $v0		# move $v0 para $t3
	
	# Etapa para calculo
	# $t0 = g
	# $t1 = h
	# $t2 = i
	# $t3 = j
	
	bne $t2, $t3, Else 
	add $t4, $t0, $t1
	j Exit			# pula para Exit:
	Else: sub $t4, $t0, $t1
	Exit: 
	
	# Etapa para exibir o resultado de if( i==j ) f = g + h else f = g - h
	
	li $v0, 4		# carrega o serviço
	la $a0, Resultado	# carrega o endereço da label
	syscall			# chamada do sistema
	
	li $v0, 1 		# carrega o serviço
	move $a0, $t4		# move de $t4 para $a0
	syscall 		# chamada do sistema
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
	  
	   
	    
	      