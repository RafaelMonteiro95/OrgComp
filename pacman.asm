; PAQUEMAN - JOGO DE COMER OUTRAS PARADA


jmp main
;---- declaracao de variaveis
pos : var #1


;---- Inicio do Programa Principal -----

main:
	call ClearScreen
	
	loadn r0, #000
	store pos, r0
	loadn r1, #' '
	loadn r2, #'$'
	loadn r3, #1200
	loadn r4, #2816
	add r2, r2, r4

	loop:
		load r0, pos
		outchar r2, r0
		call Delay
		outchar r1, r0
		call ReadMove
		;cmp r0, r3
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
	
	inchar r0

	load r2, pos

	loadn r1, #'a'
	cmp r0, r1
	jeq switch_A
	loadn r1, #'A'
	cmp r0, r1
	jeq switch_A

	loadn r1, #'s'
	cmp r0, r1
	jeq switch_S
	loadn r1, #'S'
	cmp r0, r1
	jeq switch_S
		
	loadn r1, #'d'
	cmp r0, r1
	jeq switch_D
	loadn r1, #'D'
	cmp r0, r1
	jeq switch_D

	loadn r1, #'w'
	cmp r0, r1
	jeq switch_W
	loadn r1, #'W'
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
	jmp break;

	switch_S:
	loadn r3, #1159
	cmp r3, r2
	jel break;

	loadn r3, #40
	add r2, r2, r3
	jmp break;

	switch_D:
	loadn r3, #40
	mod r4, r2, r3
	loadn r3, #39
	cmp r4, r3
	jeq break;
	
	inc r2
	jmp break;

	switch_W:
	loadn r3, #39
	cmp r2, r3
	jel break;

	loadn r3, #40
	sub r2, r2, r3
	jmp break;
		
	break:
	store pos, r2
	
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