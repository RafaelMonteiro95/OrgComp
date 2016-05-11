; PAQUEMAN - JOGO DE COMER OUTRAS PARADA

;lista de umeros aleatorios
rand : var #100
static rand + #0, #46
static rand + #1, #24
static rand + #2, #91
static rand + #3, #22
static rand + #4, #91
static rand + #5, #8
static rand + #6, #80
static rand + #7, #12
static rand + #8, #17
static rand + #9, #53
static rand + #10, #50
static rand + #11, #58
static rand + #12, #85
static rand + #13, #17
static rand + #14, #23
static rand + #15, #70
static rand + #16, #18
static rand + #17, #49
static rand + #18, #89
static rand + #19, #0
static rand + #20, #45
static rand + #21, #81
static rand + #22, #77
static rand + #23, #51
static rand + #24, #39
static rand + #25, #60
static rand + #26, #55
static rand + #27, #77
static rand + #28, #55
static rand + #29, #8
static rand + #30, #68
static rand + #31, #35
static rand + #32, #33
static rand + #33, #93
static rand + #34, #88
static rand + #35, #58
static rand + #36, #4
static rand + #37, #72
static rand + #38, #4
static rand + #39, #21
static rand + #40, #59
static rand + #41, #54
static rand + #42, #13
static rand + #43, #47
static rand + #44, #5
static rand + #45, #68
static rand + #46, #52
static rand + #47, #23
static rand + #48, #51
static rand + #49, #44
static rand + #50, #55
static rand + #51, #96
static rand + #52, #60
static rand + #53, #35
static rand + #54, #51
static rand + #55, #2
static rand + #56, #29
static rand + #57, #40
static rand + #58, #79
static rand + #59, #18
static rand + #60, #48
static rand + #61, #50
static rand + #62, #54
static rand + #63, #81
static rand + #64, #78
static rand + #65, #76
static rand + #66, #73
static rand + #67, #82
static rand + #68, #82
static rand + #69, #77
static rand + #70, #38
static rand + #71, #76
static rand + #72, #65
static rand + #73, #51
static rand + #74, #26
static rand + #75, #71
static rand + #76, #53
static rand + #77, #12
static rand + #78, #28
static rand + #79, #8
static rand + #80, #88
static rand + #81, #17
static rand + #82, #7
static rand + #83, #51
static rand + #84, #52
static rand + #85, #89
static rand + #86, #84
static rand + #87, #82
static rand + #88, #32
static rand + #89, #66
static rand + #90, #3
static rand + #91, #81
static rand + #92, #50
static rand + #93, #88
static rand + #94, #96
static rand + #95, #31
static rand + #96, #2
static rand + #97, #73
static rand + #98, #48
static rand + #99, #84

;---- declaracao de variaveis
pos 	: var #1
pacman 	: var #1
pos_b	: var #1
seed 	: var #1
rnum 	: var #1
;---- Inicio do Programa Principal -----

jmp main
main:
	;incializando variaveis
	loadn r2, #'$' ;pac man
	store pacman, r2
	
	loadn r0, #800
	store pos_b, r0
	
	loadn r0, #000
	store seed, r0
	store pos, r0
	call ClearScreen

	loop:

		loadn r1, #10
		mod r1, r0, r1
		loadn r2, #000
		cmp r1, r2
		ceq move_paqueman

		loadn r1, #20
		mod r1, r0, r1
		loadn r2, #000
		cmp r1, r2
		ceq move_blinkydu
				
		
		call Delay ; LIGA PARA O DELAY
				
		inc r0	
		jmp loop
	halt

	
;---- Fim do Programa Principal -----
	
;---- Inicio das Subrotinas -----

Delay:
						;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	push r0
	push r1
	
	loadn r1, #5  ; a
   	Delay_volta2:				; contador de tempo quebrado em duas partes (dois loops de decremento)
	loadn r0, #3000	; b
   	Delay_volta: 
	dec r0					; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	jnz Delay_volta	
	dec r1
	jnz Delay_volta2
	
	pop R1
	pop R0
	
	rts							;return

ReadMove:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	
	inchar r0

	load r2, pos

	loadn r1, #'a'
	cmp r0, r1
	jeq switch_A

	loadn r1, #'s'
	cmp r0, r1
	jeq switch_S
		
	loadn r1, #'d'
	cmp r0, r1
	jeq switch_D

	loadn r1, #'w'
	cmp r0, r1
	jeq switch_W

	jmp break;
	
	switch_A:
	loadn r3, #40
	mod r4, r2, r3
	loadn r3, #0
	cmp r4, r3
	jeq break;

	dec r2
	loadn r5, #'A' ;pac man
	store pacman, r5
	jmp break;

	switch_S:
	loadn r3, #1159
	cmp r3, r2
	jel break;

	loadn r3, #40
	add r2, r2, r3
	loadn r5, #'S' ;pac man
	store pacman, r5

	jmp break;

	switch_D:
	loadn r3, #40
	mod r4, r2, r3
	loadn r3, #39
	cmp r4, r3
	loadn r5, #'$' ;pac man
	store pacman, r5
	jeq break;
	
	inc r2
	jmp break;

	switch_W:
	loadn r3, #39
	cmp r2, r3
	jel break;

	loadn r3, #40
	sub r2, r2, r3
	loadn r5, #'W' ;pac man
	store pacman, r5

	jmp break;
		
	break:
	store pos, r2

	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
	
ClearScreen:
	push fr ; protege registrador de frags
	push r0 ; contador para percorrer a tela 
	push r1 ; valor do espaco em branco
	loadn r0, #1200 ; tamanho da tela
	loadn r1, #' ' ; espaco em branco
		
		ClearScreen_loop: ; de 1200 ate 0
		dec r0 ; decrementa contador
		outchar r1, r0 ; imprime espaco em branco
		jnz ClearScreen_loop ; jump se zero

	pop r1 ; 
	pop r0 ; 
	pop fr ; 
	rts
	
	
move_paqueman:
	push r0
	push r1
	push r2
	
	loadn r1, #' '
	load r2, pos
	outchar r1, r2	
	call ReadMove

	load r0, pos ; carrega a posessaum do paqueman
	load r2, pacman ;carrega o caractere do pac man
	loadn r1, #2816 ; cor

	add r2, r2, r1 ;deixa o pac man amarelo
	outchar r2, r0 ; impreme paqueman
	

	pop r2
	pop r1
	pop r0
	rts
	
move_blinkydu:
	push r0
	push r1
	push r2
	
	loadn r1, #' '
	load r0, pos_b ; carrega a posessaum do paqueman
	outchar r1, r0	
	
	loadn r2, #'q' ;carrega o caractere do pac man
	loadn r1, #2304 ; cor
	
	;aqui tenho que procurar uma pos aleatoria
	call getRandMove
	;aqui ja mudei a pos do fantasma
	
	store pos_b, r0
	add r2, r2, r1 ;deixa o pac man amarelo
	outchar r2, r0 ; impreme paqueman

	pop r2
	pop r1
	pop r0
	rts
	
getRandMove:
	push r0
	push r1

	call getRandNum
	load r0, nrum
	loadn r1, #4
	mod r0, r0, r1
	 
	loadn r1, #0
	cmp r0, r1
	jeq SWITCH_0
	
	loadn r1, #1
	cmp r0, r1
	jeq SWITCH_1
	
	loadn r1, #2
	cmp r0, r1
	jeq SWITCH_2
	
	loadn r1, #3
	cmp r0, r1
	jeq SWITCH_3
	
	
	SWTCH_MOVE_END:
	pop r1
	pop r0
	rts
	
getRandNum:
	push fr
	push r0;
	push r1;
	push r2;
	loadn r2, #100
	
	
	load r1, seed ; read i
	loadn r0, #rand ; read vector
	add r0, r0, r1 ; r0 = vector[i]
	
	inc r1 ;i++
	cmp r1, r2 ;if (i < 100)
	jle getRandNum_
	loadn r1, #0 ;if (i >= 100), i = 0
	store seed, r1
	
	getRandNum_:
	loadi r1, r0
	store rnum, r1

	pop r2
	pop r1;
	pop r0;
	pop fr
	rts