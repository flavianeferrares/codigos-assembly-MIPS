#Algoritmo Inserton Sort em MIPS
.data
	space:		.asciiz " "
	line:		.asciiz	"\n"
	colonsp:	.asciiz ": "	# .asciiz armazena a string no segmento de dados e adiciona terminador nulo
	array:		.word	0 :10	# .word armazena os valores listados como palavras de 32 bits
	size:           .word 	5	

	info_param_string:			.asciiz	"Insira 10 valores a serem ordenados: "
	info_receber_valores_loop_string:	.asciiz	"Insira cada valor: "
	receber_valores_loop_interno_string:	.asciiz	"Insira valor#"
	sorted_array_string:			.asciiz "Ordenação:"


.text

.globl	main  					# .glob1 habilita referência a outros arquivos
main:

params_info:					# Informa ao usuario para inserir 10 valores 
	li	$v0, 4				# carrega o serviço print string
	la	$a0, info_param_string		# carrega o endereço da label
	syscall					# chamada de sistema

params:						# Define size com o tamanho a ser percorrido pelo array
	li	$t3, 10				# $t3 = 10
	la	$t0, size			# carrega endereço da label
	sw	$t3, 0($t0)			# armazena o valor 10 em size

info_receber_valores_loop: 				# realiza a impressão de mensagem a o usuario
	li	$v0, 4					# carrega o serviço print string
	la	$a0, info_receber_valores_loop_string	# carrega o endereço da label
	li	$v0, 4					# carrega o serviço de print string
	la	$a0, line				# carrega o endereço da label
	syscall						# chamada de sistema

prep_receber_valores_loop:				# realiza a preparação de todas as variais necessarias para inserção de valores no array
	la	$t0, array				# Carrega endereço base do array no registrador $t0
	lw	$t1, size				# carrega para $t1 o conteúdo de size = 10
	li	$t2, 0					# Atribuição direta $t2 = 0

recebe_valores_loop:
	bge	$t2, $t1, receber_valores_fim 			#  ir para reber_valores_fim  if $t2 for >= $t1
	li	$v0, 4						#  carrega o serviço de print string
	la	$a0, receber_valores_loop_interno_string	# carrega o endereço da label
	syscall							# chamada de sistema
	li	$v0, 1						# carrega serviço de print int
	addi	$a0, $t2, 1				# receber_valores_loop_interno_string = $t2 + 1				
	syscall						# chamada de sistema
	li	$v0, 4					# carrega o serviço de print string
	la	$a0, colonsp				# carrega o endereço da label
	syscall						# chamada de sistema 

	li	$v0, 5					# carrega serviço de ler inteiro
	syscall						# chamada de sistema
	sw	$v0, 0($t0)				# armazena o conteúdo de $v0  no array

	addi	$t0, $t0, 4				# $t0 = $t0 + 4
	addi	$t2, $t2, 1				# $t2 = $t2 + 1
	j	recebe_valores_loop			# vá para recebe_valores_loop 

receber_valores_fim:
	jal	print			# desvia para print e salva no registrador $ra
sort_prep:
	la	$t0, array		# Carrega endereço base do array no registrador $t0
	lw	$t1, size		# carrega para $t1 o conteúdo de size
	li	$t2, 1			# Atribuição direta $t2 = 1

sort_xloop:
	la	$t0, array			# Carrega endereço base do array no registrador $t0
	bge	$t2, $t1, sort_xloop_end	#  ir para sort_xloop_end  if $t2 for >= $t1
	move	$t3, $t2			# $t3 recebe $t2

sort_iloop:
	la	$t0, array			# carrega endereço da label
	mul	$t5, $t3, 4			# $t5 = $t3 * 4
	add	$t0, $t0, $t5			# soma $t0 = $t0 + $t5
	ble	$t3, $zero, sort_iloop_end
	lw	$t7, 0($t0)			# $t7 recebe array[0]
	lw	$t6, -4($t0)
	bge	$t7, $t6, sort_iloop_end
	lw	$t4, 0($t0)			# $t4 recebe array[0]
	sw	$t6, 0($t0)			# armazena $t6 em array[0]
	sw	$t4, -4($t0)
	subi	$t3, $t3, 1			#$t3 = $t3 - 1
	j	sort_iloop			# vá para sort_iloop

sort_iloop_end:
	addi	$t2, $t2, 1			# $t2 = $t2 + 1
	j	sort_xloop			# vá para sort_xloop

sort_xloop_end:
	li	$v0, 4				# carrega o serviço print string
	la	$a0, sorted_array_string	# carrega o endereço da label
	syscall					# chamada de sistema
	li	$v0, 4				# carrega o serviço print string
	la	$a0, line			# carrega o endereço da label
	syscall					# chamada de sistema
	jal	print				# chama print
exit:
	li	$v0, 10				# termina execução 
	syscall					# chamada de sistema

print:

prep_print_loop:
	la	$t0, array		# carrega endereço da label
	lw	$t1, size		# carrega para $t1 o conteúdo de size
	li	$t2, 0			# Atribuição direta $t2 = 0

print_loop:
	bge	$t2, $t1, print_final	#  ir para print_final  if $t2 for >= $t1
	li	$v0, 1			# carrega o serviço print int
	lw	$a0, 0($t0)		# $a0 recebe array[0]
	syscall				# chamada de sistema
	li	$v0, 4			# carrega o serviço print string
	la	$a0, space		# carrega o endereço da label
	syscall				# chamada de sistema
	addi	$t0, $t0, 4		# $t0 = $t0 + 4
	addi	$t2, $t2, 1		# $t2 = $t2 + 1
	j	print_loop		# vá para print_loop

print_final:
	li	$v0, 4			# carrega o serviço print string
	la	$a0, line		# carrega o endereço da label
	syscall				# chamada de sistema
	jr	$ra			# retorna para quem chamou	