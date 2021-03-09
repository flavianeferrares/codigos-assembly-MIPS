.data
	
	Hello: .asciiz "Hello Word!" #Cria uma label
	
.text
	
	li $v0, 4   	#carrega o serviço
	la $a0, Hello 	#carrega o endereço de label
	syscall
	