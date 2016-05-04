; Hangman - jogo da forca


; ------- TABELA DE CORES -------
; adicione ao caracter para Selecionar a cor correspondente

; 0 branco							0000 0000
; 256 marrom						0001 0000
; 512 verde							0010 0000
; 768 oliva							0011 0000
; 1024 azul marinho					0100 0000
; 1280 roxo							0101 0000
; 1536 teal							0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima							1010 0000
; 2816 amarelo						1011 0000
; 3072 azul							1100 0000
; 3328 rosa							1101 0000
; 3584 aqua							1110 0000
; 3840 branco						1111 0000



jmp main
;---- declaracao de variaveis
hit : var #1 
missed : var #1 
word : var #41
wordsize : var #1
char : var #1
trylist : var #26
trylistsize: var #1

; /   /
;0---< 
; \   \
; DED

digitword   : string "Digite a palavra : "
blankline   : string "|                                      |"
digitchar   : string "Digite uma letra: "
goodbye		: string "          GOUDI BAY MODAFOQUER          "
invalidchar : string "Letra repetida. Tente Novamente"
;---------------------- Desenho da tela ------------------
S1L1  : string " -------------------------------------- "
S1L2  : string "|                                      |"
S1L3  : string "|    ======|                           |"
S1L4  : string "|    TT    (                           |"
S1L5  : string "|    TT                                |"
S1L6  : string "|    TT                                |"
S1L7  : string "|    TT                                |"
S1L8  : string "|    TT===^^^===TT                     |"
S1L9  : string "|    TT         TT                     |"
S1L10 : string "|                                      |"
S1L11 : string "|                                      |"
S1L12 : string "|                                      |"
S1L13 : string "|                                      |"
S1L14 : string "|                                      |"
S1L15 : string "|                                      |"
S1L16 : string "|                                      |"
S1L17 : string "|                                      |"
S1L18 : string "|                                      |"
S1L19 : string "|                                      |"
S1L20 : string "|                                      |"
S1L21 : string "|                                      |"
S1L22 : string "|                                      |"
S1L23 : string "|                                      |"
S1L24 : string "|                                      |"
S1L25 : string "|                                      |"
S1L26 : string "|                                      |"
S1L27 : string "|                                      |"
S1L28 : string "|                                      |"
S1L29 : string "|                                      |"
S1L30 : string " -------------------------------------- "
S1L30 : string "                                        "

;---------------------- Desenho da tela ------------------

S2L1  : string " -------------------------------------- "
S2L2  : string "|                                      |"
S2L3  : string "|    ======|                           |"
S2L4  : string "|    TT    |                           |"
S2L5  : string "|    TT    |                           |"
S2L6  : string "|    TT    0                           |"
S2L7  : string "|    TT   /|\\                          |"
S2L8  : string "|    TT===/^\\===TT                     |"
S2L9  : string "|    TT         TT                     |"
S2L10 : string "|                                      |"
S2L11 : string "|              DED                     |"
S2L12 : string "|     DESEJA JOGAR NOVAMENTE?(y/N)     |"
S2L13 : string "|          INB4:catchuga               |"
S2L14 : string "|                                      |"
S2L15 : string "|                                      |"
S2L16 : string "|                                      |"
S2L17 : string "|                                      |"
S2L18 : string "|A PALAVRA ERA:                        |"
S2L19 : string "|                                      |"
S2L20 : string "|                                      |"
S2L21 : string "|                                      |"
S2L22 : string "|                                      |"
S2L23 : string "|                                      |"
S2L24 : string "|                                      |"
S2L25 : string "|                                      |"
S2L26 : string "|                                      |"
S2L27 : string "|                                      |"
S2L28 : string "|                                      |"
S2L29 : string "|                                      |"
S2L30 : string " -------------------------------------- "


S3L1  : string " -------------------------------------- "
S3L2  : string "|                                      |"
S3L3  : string "|    ======|         VALEU PARSEIRO    |"
S3L4  : string "|    TT                                |"
S3L5  : string "|    TT                                |"
S3L6  : string "|    TT                                |"
S3L7  : string "|    TT                 \\0/            |"
S3L8  : string "|    TT===^^^===TT       |             |"
S3L9  : string "|    TT         TT      /^\\            |"
S3L10 : string "|                                      |"
S3L11 : string "|           YOU UIN MODAFOQUER         |"
S3L12 : string "|     U UANNA PRAY AGAIN??(y/N)        |"
S3L13 : string "|          INB4:catchuga               |"
S3L14 : string "|                                      |"
S3L15 : string "|                                      |"
S3L16 : string "|                                      |"
S3L17 : string "|                                      |"
S3L18 : string "|A PALAVRA ERA:                        |"
S3L19 : string "|                                      |"
S3L20 : string "|                                      |"
S3L21 : string "|                                      |"
S3L22 : string "|                                      |"
S3L23 : string "|                                      |"
S3L24 : string "|                                      |"
S3L25 : string "|                                      |"
S3L26 : string "|                                      |"
S3L27 : string "|                                      |"
S3L28 : string "|                                      |"
S3L29 : string "|                  CATCHUGA            |"
S3L30 : string " -------------------------------------- "


catchugal1  : string " CATCHUGA CATCHUGA CATCHUGA CATCHUGA CAT"
catchugal2  : string "CHUGA CATCHUGA CATCHUGA  CATCHUGA CATCHU"
catchugal3  : string "GA CATCHUGA CATCHUGA  CATCHUGA CATCHUGA "
catchugal4  : string "CATCHUGA CATCHUGA CATCHUGA CATCHUGA CATC"
catchugal5  : string "HUGA CATCHUGA CATCHUGA CATCHUGA CATCHUGA"
catchugal6  : string " CATCHUGA CATCHUGA CATCHUGA CATCHUGA CAT"
catchugal7  : string "CHUGA CATCHUGA CATCHUGA  CATCHUGA CATCHU"
catchugal8  : string "GA CATCHUGA CATCHUGA  CATCHUGA CATCHUGA "
catchugal8  : string "CATCHUGA CATCHUGA CATCHUGA CATCHUGA CATC"
catchugal9  : string "HUGA CATCHUGA CATCHUGA CATCHUGA CATCHUGA"
catchugal10 : string " CATCHUGA CATCHUGA CATCHUGA CATCHUGA CAT"
catchugal11 : string "CHUGA CATCHUGA CATCHUGA  CATCHUGA CATCHU"
catchugal12 : string "GA CATCHUGA CATCHUGA  CATCHUGA CATCHUGA "
catchugal13 : string "CATCHUGA CATCHUGA CATCHUGA CATCHUGA CATC"
catchugal14 : string "HUGA CATCHUGA CATCHUGA CATCHUGA CATCHUGA"
catchugal15 : string " CATCHUGA CATCHUGA CATCHUGA CATCHUGA CAT"
catchugal16 : string "CHUGA CATCHUGA CATCHUGA  CATCHUGA CATCHU"
catchugal17 : string "GA CATCHUGA CATCHUGA  CATCHUGA CATCHUGA "
catchugal18 : string "CATCHUGA CATCHUGA CATCHUGA CATCHUGA CATC"
catchugal19 : string "HUGA CATCHUGA CATCHUGA CATCHUGA CATCHUGA"
catchugal20 : string " CATCHUGA CATCHUGA CATCHUGA CATCHUGA CAT"
catchugal21 : string "CHUGA CATCHUGA CATCHUGA  CATCHUGA CATCHU"
catchugal22 : string "GA CATCHUGA CATCHUGA  CATCHUGA CATCHUGA "
catchugal23 : string "CATCHUGA CATCHUGA CATCHUGA CATCHUGA CATC"
catchugal24 : string "HUGA CATCHUGA CATCHUGA CATCHUGA CATCHUGA"
catchugal25 : string " CATCHUGA CATCHUGA CATCHUGA CATCHUGA CAT"
catchugal26 : string "CHUGA CATCHUGA CATCHUGA  CATCHUGA CATCHU"
catchugal27 : string "GA CATCHUGA CATCHUGA  CATCHUGA CATCHUGA "
catchugal28 : string "CATCHUGA CATCHUGA CATCHUGA CATCHUGA CATC"
catchugal29 : string "HUGA CATCHUGA CATCHUGA CATCHUGA CATCHUGA"
catchugal30 : string " CATCHUGA CATCHUGA CATCHUGA CATCHUGA CAT"

;---- Inicio do Programa Principal -----

main:
	loadn r0, #0		; Posicao na tela onde a mensagem sera' escrita
	store trylistsize, r0
	store wordsize, r0
	store missed, r0
	store hit, r0

	call ClearScreen	; Limpa a Tela
	loadn r1, #S1L1 ; tela inicial
	loadn r2, #0 ; cor da tela
	loadn r0, #0; Posicao na tela onde a mensagem sera' escrita
	call PrintScreen
	call getline
	call DrawScore
	
	loadn r0, #0
	loadn r3, #0
	
	loop:
		call InputChar
		call Compare
		call EndGame
		cmp r0, r3
	jeq loop

	loadn r0, #721
	loadn r1, #word
	loadn r2, #0	
	call Imprimestr
	
	call getchar
	load r3, char
	loadn r0, #'y'
	cmp r0, r3
	jeq main
	
	loadn r0, #'Y'
	cmp r0, r3
	jeq main

	call ClearScreen	; Limpa a Tela
	;loadn r1, #catchugal1 ; tela inicial
	;loadn r2, #0 ; cor da tela
	;loadn r0, #0; Posicao na tela onde a mensagem sera' escrita
	;call PrintScreen
	
	loadn r0, #720
	loadn r1, #goodbye
	loadn r2, #0	
	call Imprimestr

	halt
	
;---- Fim do Programa Principal -----
	
;---- Inicio das Subrotinas -----

PrintScreen2:
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

	PrintScreen2_loop:	
		call Imprimestr2
		add r1, r1, r4
		add r0, r0, r5
		cmp r0, r3
		jel PrintScreen2_loop	
		
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
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
;	

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

Imprimestr2:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5 ; protege o r5 na pilha para ser usado na subrotina
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '

ImprimestrLoop2:	
	loadi r4, r1
	cmp r4, r3
	jeq ImprimestrSai2
	cmp r5, r4
	jeq Imprimestr2_skip
	add r4, r2, r4
	outchar r4, r0
	inc r0
	inc r1
	jmp ImprimestrLoop2

Imprimestr2_skip:
	inc r0
	inc r1
	jmp ImprimestrLoop2

ImprimestrSai2:	
	pop r5
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts


printfDigWord:
	push fr
	push r0
	push r1
	push r2
	
	loadn r0, #681
	loadn r1, #digitword
	loadn r2, #0
	call Imprimestr
	pop r2
	pop r1
	pop r0
	pop fr
	rts

getline:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7 ; MEXEU COM R7 MLK
	
	loadn r1, #13; eh 13 porra, valor do enter
	loadn r2, #0 ;	
	loadn r3, #word ; ponteiro para palavra
	loadn r5, #40 ; tamanho maximo da palavra
	loadn r6, #721 ; posicao da tela
	loadn r7, #'*'
	store wordsize, r2
	call printfDigWord

	getline_loop:
		call getchar
		load r0, char ; pega a letra lida
		cmp r0, r1 ; ve se eh 13 memo porra
		jeq getline_RIP	; eh 13 memo porra, vamo derruba as arvore de leitura
		add r4, r3, r2 ; incrementa posicao de acesso na string
		storei r4, r0 ; armazena
		inc r2 ; incrementa a posicao
		store wordsize, r2 ; armazena na palavra
		outchar r7, r6 ; imprime palavra lida
		inc r6 ; incrementa contador da palavra lida
		cmp r2, r5 ; verifica se nao da seg fault
		jne getline_loop ; AGAIN MODAFOQUER
	
	getline_RIP:
		loadn r0, #0 ; barra zero
		add r4, r3, r2
		storei r4, r0

;	loadn r0, #320
;	loadn r1, #word
;	loadn r2, #0
;	call Imprimestr

	pop r7 ; VC SABE O Q ACONTECE
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts	
	
getchar:
	push fr
	push r0
	push r1
	
	loadn r1, #255
	
	getchar_loop:
		inchar r0
		cmp r0, r1
		jeq getchar_loop
		
	store char, r0
	
	getchar_loop2:
		inchar r0
		cmp r0, r1
		jne getchar_loop2
	
	pop r1
	pop r0
	pop fr
	rts
	
	
	
DrawScore:
	push fr
	push r0;
	push r1;
	push r2;
	push r3
	push r4

	loadn r0, #680
	loadn r1, #blankline
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #720
	loadn r1, #blankline
	loadn r2, #0
	
	call Imprimestr
	
	loadn r0, #'_'
	loadn r1, #721
	load r3, wordsize
	add r4, r1, r3
	DrawScore_loop:
		outchar r0, r1 ; outchar no _ na pos r1
		inc r1 ; incrementa dela
		cmp r1, r4
		jne DrawScore_loop
	
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts
	
	
InputChar:
	push fr
	push r0; Posicao na tela da mensagem
	push r1; Mensagem a ser impressa
	push r2; cor, aux
	push r3; TryList
	push r4; TryList[i]
	push r5; TryListSize	
	push r6; i
	push r7; letra
	


	loadn r0, #801
	loadn r1, #digitchar
	loadn r2, #0
	call Imprimestr

	InputChar_in:
		
		call getchar
		
		loadn r0, #800
		loadn r1, #blankline
		loadn r2, #0
		call Imprimestr

		; verifica palavra na trylsit
		loadn r3, #trylist ; end trylist
		load r5, trylistsize ; qnt trylist
		loadn r6, #0 ; i = 0
		load r7, char
		loadn r2, #0 ; aux = 0

	InputChar_Checktrylist:
		; verificando se ja foi digitada	
		cmp r6, r5
		jeq InputChar_End
		
		add r2, r3, r6 ; aux = trylist+i
		loadi r4, r2 ; r4 = Trylist[i]
		
		cmp r4, r7 ;Trylist[i] == char?
		jeq InputChar_Repeated
		
		inc r6 ; i++
		cmp r6, r5 ;; i==trylistsize ?
		jle InputChar_Checktrylist ; se i <= size, jump
		
		jmp InputChar_End ; verificou a lista inteira sem encontrar repeticao
		
	InputChar_Repeated:
	loadn r0, #801
	loadn r1, #invalidchar
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #841
	loadn r1, #trylist
	loadn r2, #0
	call Imprimestr
	
	jmp InputChar_in
	
	InputChar_End:
	; armazena letra na trylist
	add r0, r3, r5 ; r0 pos
	store char, r7
	storei r0, r7 ; trylist[r0] = r7

	; coloca barra zero
	inc r0 ; incrementa o i
	loadn r2, #0 ; armazena barra zero
	storei r0, r2 ; trylist[r0] = r2
	
	; aumenta tamanho da trylist
	inc r5
	store trylistsize, r5
	
	loadn r0, #800
	loadn r1, #blankline
	loadn r2, #0
	call Imprimestr
	
	loadn r0, #840
	loadn r1, #blankline
	loadn r2, #0
	call Imprimestr

	
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	
	rts
	
	
Compare:
	push fr
	push r0; char
	push r1; 
	push r2; cor
	push r3; flag
	push r4; word
	push r5; word[i]
	push r6; wordsize
	push r7; i


	loadn r2, #0
	loadn r7, #0
	loadn r3, #0

	loadn r4, #word
	load r0, char
	load r6, wordsize
	
	Compare_loop:
		add r2, r4, r7 ;r2  = palavra+i
		loadi r5, r2
		cmp r0, r5 ; se igual acertou
		ceq Compare_hit
		inc r7
		cmp r7, r6
	jel Compare_loop

	
	loadn r2, #0
	cmp r2, r3
	jne Compare_end
	
	load r0, missed
	inc r0
	store missed, r0
	
	Compare_end:
		;preparo o inicio do switch
		load r0, missed
		loadn r1, #1
		
		;comparo o numero de erros
		cmp r0, r1
		;se for igual chamo switch 1
		jeq switch_1
		
		loadn r1, #2
		cmp r0, r1
		;se for igual chamo switch 2
		jeq switch_2
		
		loadn r1, #3
		cmp r0, r1
		;se for igual chamo switch 3
		jeq switch_3
		
		loadn r1, #4
		cmp r0, r1
		;se for igual chamo switch 4
		jeq switch_4
		
		loadn r1, #5
		cmp r0, r1
		;se for igual chamo switch 5
		jeq switch_5
		
		loadn r1, #6
		cmp r0, r1
		;se for igual chamo switch 6
		jeq switch_6
		
		loadn r1, #7
		cmp r0, r1
		;se for igual chamo switch 7
		jeq switch_7
		
		loadn r1, #8
		cmp r0, r1
		;se for igual chamo switch 8
		jeq switch_8
		jmp break
		switch_1:
			loadn r1, #'O'
			loadn r2, #171
			outchar r1, r2
			jmp break
		switch_2:
			loadn r1, #'|'
			loadn r2, #211
			outchar r1, r2
			jmp break
		switch_3:
			loadn r1, #'/'
			loadn r2, #210
			outchar r1, r2
			jmp break
		switch_4:
			loadn r1, #'\\'
			loadn r2, #212
			outchar r1, r2
			jmp break
		switch_5:
			loadn r1, #'^'
			loadn r2, #251
			outchar r1, r2
			jmp break
		switch_6:
			loadn r1, #'/'
			loadn r2, #250
			outchar r1, r2
			jmp break
		switch_7:
			loadn r1, #'\\'
			loadn r2, #252
			outchar r1, r2
			jmp break
		switch_8:
			;call ClearScreen	; Limpa a Tela
			;loadn r1, #S2L1 ; tela inicial
			;loadn r2, #0 ; cor da tela
			;loadn r0, #0; Posicao na tela onde a mensagem sera' escrita
			;call PrintScreen
			jmp break



		
	break:	
	
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	
	rts
	
Compare_hit:
	push fr
	push r0; 
	push r1; 
	push r2; 
	push r7; 
	
	
	load r0, hit
	inc r0
	store hit, r0
	
	loadn r2, #681
	add r2, r2, r7
	load r7, char
	outchar r7, r2		
	inc r3
	
	pop r7
	pop r2
	pop r1
	pop r0
	pop fr
	
	rts
	
	
EndGame:
	push r0
	push r1
	
	loadn r0, #8
	load r1, missed
	cmp r0, r1
	jeq EndGame_ded
	jeq EndGame_uin
	
	load r0, wordsize
	load r1, hit
	cmp r0, r1
	jeq EndGame_uin

	EndGame_end:
	pop r1
	pop r0
	rts


	EndGame_ded:
		call ClearScreen	; Limpa a Tela
		loadn r1, #S2L1 ; tela inicial
		loadn r2, #0 ; cor da tela
		loadn r0, #0; Posicao na tela onde a mensagem sera' escrita
		inc r3
		call PrintScreen			
	jmp EndGame_end

	EndGame_uin:
		call ClearScreen	; Limpa a Tela
		loadn r1, #S3L1 ; tela inicial
		loadn r2, #0 ; cor da tela
		loadn r0, #0; Posicao na tela onde a mensagem sera' escrita
		inc r3
		call PrintScreen				
	jmp EndGame_end