.data
	
	Hello: .asciiz "Hello Word!" #Cria uma label
	
.text
	
	li $v0, 4   	#carrega o servi�o
	la $a0, Hello 	#carrega o endere�o de label
	syscall
	