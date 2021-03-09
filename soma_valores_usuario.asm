.data
	Numero1: .asciiz "Informe o primeiro numero: " # Cria label
	Numero2: .asciiz "Informe o segundo numero: " # Cria Label
	Resultado: .asciiz  "O resultado da soma é: "

.text

	# Etapa para ler dois numeros inteiros
	
	li $v0, 4  		# carrega o serviço
	la $a0, Numero1 	# carrega o endereço da label
	syscall 		# chamada do sistema
	
	li $v0, 5		# Ler o numero inteiro
	syscall  
	
	move $t0,$v0 		# Mover de $v0 para $t0
	
	li $v0, 4 		# carrega o serviço
	la $a0, Numero2 	# carrega o endereço da label
	syscall 		# chamada do sistema
	
	li $v0, 5		# ler numero inteiro
	syscall
	
	move $t1,$v0		# mover de $v0 para t1
	
	# Etapa para somar dois numeros inteiros
	
	add $t2, $t1, $t0      # soma $t2 = $t1 + $t0
	
	# Etapa de exibir resultados da soma
	
	li $v0, 4		# carrega o serviço
	la $a0, Resultado       # carrega o endereço da label
	syscall 
	
	li $v0, 1 		# carrega o serviço
	move $a0,$t2		# move $t2 para $a0
	syscall 		# chamada do sistema  
	
	
	
	
	
	
	
	
	
	