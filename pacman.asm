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

S1L1 	: string "cccccccccccccccccccccccccccccccccccccccc"
S1L2 	: string "c PAC MAN        VER ALPHA             c"
S1L3 	: string "cbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbc"
S1L4 	: string "c                                      c"
S1L5 	: string "c  cbbbbbbbbbcbbbbbbbbbbbbbcbbbbbbbbc  c"
S1L6 	: string "c  e........*c.............c*.......e  c"
S1L7 	: string "c  e.bbbbbbb...bbbbfgbbbbb...bbbbbb.e  c"
S1L8 	: string "c  e*........c.....hi......c.......*e  c"
S1L9 	: string "c  cccccc.cbbcbbbb.hi.bbbbbcbc.cbbbbc  c"
S1L10 	: string "c       e.e..................e.e       c"
S1L1 	: string "cbbbbbbbc.c.cbbbbbb--bbbbbbc.c.cbbbbbbbc"
S1L2 	: string "c       ....e              e....       c"
S1L3 	: string "cbbbbbbc.cc.e              e.cc.cbbbbbbc"
S1L4 	: string "c      e.ee.cbbbbbbbbbbbbbbc.ee.e      c"
S1L5 	: string "c      e.cc*................*cc.e      c"
S1L6 	: string "c  cbbbc....bbbbbbbfgbbbbbbb....cbbbc  c"
S1L7 	: string "c  e.....cc........hi........cc.....e  c"
S1L8 	: string "c  e.bbbbccbbbbbbb.hi.bbbbbbbccbbbb.e  c"
S1L9 	: string "c  e*..............................*e  c"
S1L20 	: string "c  cbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbc  c"
S1L1 	: string "c                                      c"
S1L2 	: string "cbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbc"
S1L3 	: string "c                                      c"
S1L4 	: string "c   SCORE:                             c"
S1L5 	: string "c                                      c"
S1L6 	: string "c                                      c"
S1L7 	: string "c                                      c"
S1L8 	: string "cccccccccccccccccccccccccccccccccccccccc"
S1L9 	: string "                                        "
S1L30 	: string "                                        "

;---- declaracao de variaveis
last_pos: var #1
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
	
	loadn r0, #615
	store pos_b, r0
	
	loadn r0, #000
	store seed, r0
	store pos, r0

	call ClearScreen	; Limpa a Tela
	loadn r1, #S1L1 ; tela inicial
	loadn r2, #0 ; cor da tela
	loadn r0, #0; Posicao na tela onde a mensagem sera' escrita
	call PrintScreen

	loop:

		loadn r1, #10
		mod r1, r0, r1
		loadn r2, #000
		cmp r1, r2
		ceq move_paqueman

		loadn r1, #10
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
	loadn r5, #'a' ;pac man
	store pacman, r5
	jmp break;

	switch_S:
	loadn r3, #1159
	cmp r3, r2
	jel break;

	loadn r3, #40
	add r2, r2, r3
	loadn r5, #'s' ;pac man
	store pacman, r5

	jmp break;

	switch_D:
	loadn r3, #40
	mod r4, r2, r3
	loadn r3, #39
	cmp r4, r3
	jeq break;
	
	loadn r5, #'d' ;pac man
	store pacman, r5
	inc r2
	jmp break;

	switch_W:
	loadn r3, #39
	cmp r2, r3
	jel break;

	loadn r3, #40
	sub r2, r2, r3
	loadn r5, #'w' ;pac man
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
	store last_pos, r2
	outchar r1, r2	
	call ReadMove
	call IS_VALID_POS
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
	
	load r0, pos_b ; carrega a posessaum do paqueman
	store last_pos, r0
	

	;aqui tenho que procurar uma pos aleatoria
	call getRandMove
	;aqui ja mudei a pos do fantasma
	
	call IS_VALID_POS_B

	load r0, last_pos ; carrega a posessaum do paqueman
	loadn r1, #' '
	outchar r1, r0	

	loadn r2, #'q' ;carrega o caractere do pac man
	loadn r1, #2304 ; cor

	load r0, pos_b ; carrega a posessaum do paqueman
	add r2, r2, r1 ;deixa o pac man amarelo
	outchar r2, r0 ; impreme paqueman

	pop r2
	pop r1
	pop r0
	rts
	
getRandMove:
	push r0
	push r1
	push r2
	push r3
	push r4
	
	call getRandNum
	load r0, rnum	
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
	
	jmp SWITCH_MOVE_END
	
	SWITCH_0:
	load r1, pos_b
	loadn r2, #40
	add r1, r1, r2

	loadn r3, #1159
	cmp r3, r1
	jel SWITCH_MOVE_END;

	store pos_b, r1
	jmp SWITCH_MOVE_END

	SWITCH_1:
	load r1, pos_b
	loadn r2, #40
	sub r1, r1, r2
	
	loadn r3, #39
	cmp r1, r3
	jel SWITCH_MOVE_END;

	store pos_b, r1
	jmp SWITCH_MOVE_END

	SWITCH_2:
	load r1, pos_b
	inc r1	
	loadn r3, #40
	mod r4, r1, r3
	loadn r3, #39
	cmp r4, r3

	jeq SWITCH_MOVE_END;
	
	store pos_b, r1
	jmp SWITCH_MOVE_END

	SWITCH_3:
	load r1, pos_b
	
	loadn r3, #40
	mod r4, r1, r3
	loadn r3, #0
	cmp r4, r3
	jeq SWITCH_MOVE_END
	
	dec r1
	store pos_b, r1
	jmp SWITCH_MOVE_END
	
	
	SWITCH_MOVE_END:
	pop r3
	pop r4
	pop r2
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
	store seed, r1
	cmp r1, r2 ;if (i < 100)
	jle getRandNum_
	loadn r1, #0 ;if (i >= 100), i = 0
	store seed, r1
	
	getRandNum_:
	loadi r1, r0
	load r2, pos
	add r1, r1, r2
	inc r1
	store rnum, r1

	pop r2
	pop r1;
	pop r0;
	pop fr
	rts
	
	
Imprimestr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

ImprimestrLoop:	
	loadi r4, r1
	cmp r4, r3
	jeq ImprimestrSai
	add r4, r2, r4
	outchar r4, r0
	inc r0
	inc r1
	jmp ImprimestrLoop
	
ImprimestrSai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts

PrintScreen:
	push fr ; protege registrador de frags
	push r0 ; contador
	push r1 ; endereco da mensagem
	push r2 ; cor da mensagem
	push r3 ;
	push r4 ;
	push r5 ;
	
	loadn r0, #0 ; contador
	loadn r3, #1199 ; tamanho da tela
	loadn r4, #41 ; incremento da memoria
	loadn r5, #40 ; incremento do contador

	PrintScreen_loop:	
		call Imprimestr
		add r1, r1, r4
		add r0, r0, r5
		cmp r0, r3
		jel PrintScreen_loop	
		
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts

IS_VALID_POS:
	push fr
	push r0
	push r1
	
	; fazendo pos apontar para a posicao certa
	load r0, pos
	loadn r1, #40
	div r1, r0, r1
	add r0, r1, r0
	; r1 recebe ponteiro
	loadn r1, #S1L1
	; r1 aponta para posicao certa
	add r1, r1, r0
	; r1 contem o caracter valido
	; S1L1[POS] == ' '
	loadi r1, r1
	loadn r2, #' ' 
	cmp r1, r2
	jeq IS_VALID_POS_N
		;pos = last_pos;
		load r0, last_pos
		store pos, r0

	IS_VALID_POS_N:

	pop r1
	pop r0
	pop fr
	rts
	
	
	
IS_VALID_POS_B:
	push fr
	push r0
	push r1
	
	; fazendo pos apontar para a posicao certa
	load r0, pos_b
	loadn r1, #40
	div r1, r0, r1
	add r0, r1, r0
	; r1 recebe ponteiro
	loadn r1, #S1L1
	; r1 aponta para posicao certa
	add r1, r1, r0
	; r1 contem o caracter valido
	; S1L1[POS] == ' '
	loadi r1, r1
	loadn r2, #' ' 
	cmp r1, r2
	jeq IS_VALID_POS_N_B
		;pos = last_pos;
		load r0, last_pos
		store pos_b, r0

	IS_VALID_POS_N_B:

	pop r1
	pop r0
	pop fr
	rts