loadn r1, #10
	r1 = 10;
numeros em um registrador
	
load r1, label
	esse cara serve para acessar o conteudo de variaveis de um byte

loadi r1, r2
	serve para acessar o conteudo de vetores ou var de mais de 1 byte	
	para isso ele precisa de um ponteiro para o vetor, para isso
	para isso é necessario inicializar o ponteiro com o endereço
	para isso é necessario colocar um numero(endereço) dentro do registrador
	para isso voce precisa do loadn r2, #end = #vetor
	
	add r3, r2, i
	loadi r1, r3     r1 <- vetor(i)
	