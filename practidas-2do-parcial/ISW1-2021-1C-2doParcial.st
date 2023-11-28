!classDefinition: #CartaDeTrucoTest category: 'ISW1-2021-1C-2doParcial'!
TestCase subclass: #CartaDeTrucoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test01SonIgualesConMismoPaloYNumero

	self assert: (CartaDeTruco bastoCon: 1) = (CartaDeTruco bastoCon: 1) 

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test02SonDistintasConDistintoPalo

	self deny: (CartaDeTruco bastoCon: 1) = (CartaDeTruco oroCon: 1) 

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test03SonDistintasConNumeroAunqueIgualPalo

	self deny: (CartaDeTruco bastoCon: 1) = (CartaDeTruco bastoCon: 2) 

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test04CartasIgualesTienenElMismoHash

	self assert: (CartaDeTruco bastoCon: 1) hash equals: (CartaDeTruco bastoCon: 1) hash

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test05UnaCartaEsDistintaACualquierObjetoQueNoSeaCarta

	self deny: (CartaDeTruco bastoCon: 1) = 1! !


!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test07NoHayCartaDeTrucoConNumeroOcho

	self 
		should: [ CartaDeTruco oroCon: 8 ]
		raise: Error
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test08NoHayCartaDeTrucoConNumeroNueve

	self 
		should: [ CartaDeTruco oroCon: 9 ]
		raise: Error
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:12'!
test09LosPalosDeLaCartaDeTrucoSonBastoOroEspadaYCopa

	self 
		should: [ CartaDeTruco palo: #otro numero: 1 ]
		raise: Error
		withMessageText: CartaDeTruco paloInvalidoErrorDescription! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test10NoSePuedeCrearCartaConNumeroMenorAUno

	self 
		should: [ CartaDeTruco espadaCon: 0 ]
		raise: Error 
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription ! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test11NoSePuedeCrearCartaConNumeroMayorADoce

	self 
		should: [ CartaDeTruco espadaCon: 13 ]
		raise: Error 
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription ! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test12ElNumeroDeLaCartaDebeSerEntero

	self 
		should: [ CartaDeTruco espadaCon: 1.1 ]
		raise: Error 
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription ! !


!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 10:55:30'!
test13LaTablaDeValoresEsCorrecta

	self assert: (CartaDeTruco anchoDeEspada mataA: CartaDeTruco anchoDeBasto).
	self assert: (CartaDeTruco anchoDeBasto mataA: CartaDeTruco sieteDeEspada).
	self assert: (CartaDeTruco sieteDeEspada mataA: CartaDeTruco sieteDeOro).
	self assert: (CartaDeTruco sieteDeOro mataA: (CartaDeTruco espadaCon: 3)).
	self assert: ((CartaDeTruco espadaCon: 3) empardaCon: (CartaDeTruco oroCon: 3)).
	self assert: ((CartaDeTruco espadaCon: 3) mataA: (CartaDeTruco espadaCon: 2)).
	self assert: ((CartaDeTruco espadaCon: 2) empardaCon: (CartaDeTruco oroCon: 2)).
	self assert: ((CartaDeTruco espadaCon: 2) mataA: (CartaDeTruco oroCon: 1)).
	self assert: ((CartaDeTruco oroCon: 1) empardaCon: (CartaDeTruco copaCon: 1)).
	self assert: ((CartaDeTruco oroCon: 1) mataA: (CartaDeTruco espadaCon: 12)).
	self assert: ((CartaDeTruco espadaCon: 12) empardaCon: (CartaDeTruco oroCon: 12)).
	self assert: ((CartaDeTruco espadaCon: 12) mataA: (CartaDeTruco espadaCon: 11)).
	self assert: ((CartaDeTruco espadaCon: 11) empardaCon: (CartaDeTruco oroCon: 11)).
	self assert: ((CartaDeTruco espadaCon: 11) mataA: (CartaDeTruco espadaCon: 10)).
	self assert: ((CartaDeTruco espadaCon: 10) empardaCon: (CartaDeTruco oroCon: 10)).
	self assert: ((CartaDeTruco espadaCon: 10) mataA: (CartaDeTruco copaCon: 7)).
	self assert: ((CartaDeTruco copaCon: 7) empardaCon: (CartaDeTruco bastoCon: 7)).
	self assert: ((CartaDeTruco copaCon: 7) mataA: (CartaDeTruco espadaCon: 6)).
	self assert: ((CartaDeTruco espadaCon: 6) empardaCon: (CartaDeTruco oroCon: 6)).
	self assert: ((CartaDeTruco espadaCon: 6) mataA: (CartaDeTruco espadaCon: 5)).
	self assert: ((CartaDeTruco espadaCon: 5) empardaCon: (CartaDeTruco oroCon: 5)).
	self assert: ((CartaDeTruco espadaCon: 5) mataA: (CartaDeTruco espadaCon: 4)).
	self assert: ((CartaDeTruco espadaCon: 4) empardaCon: (CartaDeTruco oroCon: 4)).

	{ 3. 2. 12. 11. 10. 6. 5. 4 } do: [ :unNumero |
		CartaDeTruco palos do: [ :unPalo | 
			self assert: ((CartaDeTruco espadaCon: unNumero) empardaCon: (CartaDeTruco palo: unPalo numero: unNumero)) ]]
	! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 10:49:51'!
test14HayCartasQueNoSonPardas

	self deny: (CartaDeTruco anchoDeEspada empardaCon: CartaDeTruco anchoDeBasto)! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 10:49:59'!
test15HayCartasQuePierdenConOtras

	self deny: (CartaDeTruco anchoDeBasto mataA: CartaDeTruco anchoDeEspada)! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:53:21'!
test16SieteDeCopasYDeBastoEsSieteFalso

	self assert: (CartaDeTruco copaCon: 7) esSieteFalso.
	self assert: (CartaDeTruco bastoCon: 7) esSieteFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:54:57'!
test17SieteDeOroYDeEspadaNoSonSieteFalso

	self deny: (CartaDeTruco sieteDeOro) esSieteFalso.
	self deny: (CartaDeTruco sieteDeEspada) esSieteFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:55:53'!
test18AnchoDeOroYDeCopaSonAnchoFalsos

	self assert: (CartaDeTruco oroCon: 1) esAnchoFalso.
	self assert: (CartaDeTruco copaCon: 1) esAnchoFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:56:28'!
test19AnchoDeEspadaYDeBastosNoSonAnchoFalsos

	self deny: (CartaDeTruco anchoDeEspada) esAnchoFalso.
	self deny: (CartaDeTruco anchoDeBasto) esAnchoFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 11:58:24'!
test20FallaBuscandoValorDeCartaInválida

	"Creo una carta de manera inválida para probar la correctitud del la tabla de valores - Hernan"
	self 
		should: [ CartaDeTruco new initializePalo: #invalido numero: 1; valor ]
		raise: Error 
		withMessageText: CartaDeTruco tablaDeValoresIncorrectaOCartaInvalidaErrorDescription! !


!classDefinition: #RondaDeTrucoTest category: 'ISW1-2021-1C-2doParcial'!
TestCase subclass: #RondaDeTrucoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!RondaDeTrucoTest methodsFor: 'cartas' stamp: 'tp 11/27/2023 19:36:26'!
conjuntoDeCuatroCartas

	^ OrderedCollection 
		with: CartaDeTruco anchoDeEspada 
		with: CartaDeTruco anchoDeBasto
		with: (CartaDeTruco espadaCon: 7)
		with: (CartaDeTruco oroCon: 7)! !

!RondaDeTrucoTest methodsFor: 'cartas' stamp: 'tp 11/27/2023 19:36:52'!
conjuntoDeDosCartas

	^ OrderedCollection 
		with: CartaDeTruco anchoDeEspada
		with: (CartaDeTruco oroCon: 7)! !

!RondaDeTrucoTest methodsFor: 'cartas' stamp: 'tp 11/27/2023 20:11:21'!
conjuntoDeTresCartas

	^OrderedCollection 
		with: (CartaDeTruco espadaCon: 1)
		with: (CartaDeTruco espadaCon: 2)
		with: (CartaDeTruco espadaCon: 3).! !

!RondaDeTrucoTest methodsFor: 'cartas' stamp: 'tp 11/27/2023 19:56:24'!
conjuntoDeTresCartasIguales

	^ OrderedCollection
		with: (CartaDeTruco oroCon: 1)
		with: (CartaDeTruco oroCon: 1)
		with: (CartaDeTruco oroCon: 1)! !

!RondaDeTrucoTest methodsFor: 'cartas' stamp: 'tp 11/27/2023 19:36:35'!
otroConjuntoDeCuatroCartas

	^ OrderedCollection 
		with: (CartaDeTruco espadaCon: 6) 
		with: (CartaDeTruco espadaCon: 5)
		with: (CartaDeTruco espadaCon: 4)
		with: (CartaDeTruco espadaCon: 3)! !

!RondaDeTrucoTest methodsFor: 'cartas' stamp: 'tp 11/27/2023 19:37:00'!
otroConjuntoDeDosCartas

	^ OrderedCollection 
		with: (CartaDeTruco espadaCon: 6)
		with: (CartaDeTruco espadaCon: 3)! !

!RondaDeTrucoTest methodsFor: 'cartas' stamp: 'tp 11/27/2023 21:21:46'!
otroConjuntoDeTresCartas

	^OrderedCollection 
		with: (CartaDeTruco oroCon: 1)
		with: (CartaDeTruco anchoDeBasto)
		with: (CartaDeTruco oroCon: 3).! !

!RondaDeTrucoTest methodsFor: 'cartas' stamp: 'tp 11/27/2023 19:57:47'!
otroConjuntoDeTresCartasIguales

	^ OrderedCollection 
		with: (CartaDeTruco espadaCon: 1)
		with: (CartaDeTruco espadaCon: 1)
		with: (CartaDeTruco espadaCon: 1)! !


!RondaDeTrucoTest methodsFor: 'assertions' stamp: 'tp 11/27/2023 20:38:01'!
deberiaFallarConCartasParaMano: cartasDeLaMano yCartasParaPie: cartasDelPie asertando: bloqueDeAsersion

	| rondaDeTruco mano pie |
	
	mano := self mano.
	pie := self pie.
	
	self 
		should: [rondaDeTruco := RondaDeTruco conMano: mano pie: pie cartasDeLaMano: cartasDeLaMano cartasDelPie: cartasDelPie.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError |
			bloqueDeAsersion value: anError ]
	
	
	! !


!RondaDeTrucoTest methodsFor: 'jugadores' stamp: 'tp 11/27/2023 20:40:07'!
assertNoSeJuegaPrimerEnfrentamientoConMano: mano pie: pie conCarta: cartaMano cartaPie: cartaPie asertando: bloqueDeAsersion

	| rondaDeTruco unPie unaMano |
	
	unPie := self pie.
	unaMano := self mano.
	rondaDeTruco := RondaDeTruco 
		conMano: unaMano pie: unPie 
		cartasDeLaMano: self conjuntoDeTresCartas 
		cartasDelPie: self otroConjuntoDeTresCartas.
		
	self
		should: [rondaDeTruco 
			juegaMano: mano con: cartaMano
			juegaPie: pie con: cartaPie]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError |
			bloqueDeAsersion value: anError value: rondaDeTruco ]
	! !

!RondaDeTrucoTest methodsFor: 'jugadores' stamp: 'tp 11/27/2023 20:38:01'!
mano

	^ 'mano'! !

!RondaDeTrucoTest methodsFor: 'jugadores' stamp: 'tp 11/27/2023 20:37:55'!
pie

	^ 'pie'! !


!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 19:40:48'!
test02CadaJugadorNoDebeTenerMasDeTresCartas

	self
		deberiaFallarConCartasParaMano: self conjuntoDeCuatroCartas
		yCartasParaPie: self otroConjuntoDeCuatroCartas 
		asertando: [:anError |
			self assert: anError messageText equals: RondaDeTruco cantidadDeCartasRepartidasIncorrecta ].
! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 19:41:20'!
test03CadaJugadorNoDebeTenerMenosDeTresCartas

	self
		deberiaFallarConCartasParaMano: self conjuntoDeDosCartas
		yCartasParaPie: self otroConjuntoDeDosCartas 
		asertando: [:anError |
			self assert: anError messageText equals: RondaDeTruco cantidadDeCartasRepartidasIncorrecta ].! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 19:46:22'!
test04CadaJugadorNoDebeTenerCartasEnComun

	self
		deberiaFallarConCartasParaMano: self conjuntoDeTresCartas
		yCartasParaPie: self conjuntoDeTresCartas
		asertando: [:anError |
			self assert: anError messageText equals: RondaDeTruco descripcionDeRepartidaConMasDeUnMazo ].! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 19:58:04'!
test05CadaJugadorNoDebeTenerCartasRepetidas

	self
		deberiaFallarConCartasParaMano: self conjuntoDeTresCartasIguales
		yCartasParaPie: self otroConjuntoDeTresCartasIguales
		asertando: [:anError |
			self assert: anError messageText equals: RondaDeTruco descripcionDeRepartidaConMasDeUnMazo ].! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 21:08:33'!
test06NoPuedeEmpezarElPrimerEnfrentamientoElPie
	
	self
		assertNoSeJuegaPrimerEnfrentamientoConMano: self pie 
		pie: self mano 
		conCarta: self otroConjuntoDeTresCartas anyOne 
		cartaPie: self conjuntoDeTresCartas anyOne 
		asertando: [:anError :rondaDeTruco |
			self assert: anError messageText equals: rondaDeTruco elEnfrentamientoDebeSerIniciadoPorLaMano.
			self assert: rondaDeTruco puntajeJugador1 equals: 0.
			self assert: rondaDeTruco puntajeJugador2 equals: 0.]! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 21:08:33'!
test07CadaJugadorDebeJugarConCartaEnMano
	
	self
		assertNoSeJuegaPrimerEnfrentamientoConMano: self mano 
		pie: self pie 
		conCarta: CartaDeTruco anchoDeBasto
		cartaPie: CartaDeTruco anchoDeBasto
		asertando: [:anError :rondaDeTruco |
			self assert: anError messageText equals: rondaDeTruco noSePuedeJugarConCartaQueNoSetTiene.
			self assert: rondaDeTruco puntajeJugador1 equals: 0.
			self assert: rondaDeTruco puntajeJugador2 equals: 0.]! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 21:08:33'!
test08ElPieDebeSerElCorrectoAjugar
	
	self
		assertNoSeJuegaPrimerEnfrentamientoConMano: self mano
		pie: 'pie2' 
		conCarta: self conjuntoDeTresCartas anyOne
		cartaPie: self otroConjuntoDeTresCartas anyOne
		asertando: [:anError :rondaDeTruco |
			self assert: anError messageText equals: rondaDeTruco debeJugarElPieCorrecto.
			self assert: rondaDeTruco puntajeJugador1 equals: 0.
			self assert: rondaDeTruco puntajeJugador2 equals: 0.]! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 21:08:33'!
test09SumaPuntoElPieEnCasoDeMatarALaMano

	| mano pie rondaDeTruco |
	
	mano := self mano.
	pie := self pie.
	
	rondaDeTruco := RondaDeTruco 
		conMano: mano pie: pie 
		cartasDeLaMano: self conjuntoDeTresCartas 
		cartasDelPie: self otroConjuntoDeTresCartas.
		
	rondaDeTruco 
		juegaMano: mano con: (CartaDeTruco espadaCon: 2) 
		juegaPie: pie con: (CartaDeTruco oroCon: 3).
		
	self assert: rondaDeTruco puntajeJugador2 equals: 1.
	self assert: rondaDeTruco puntajeJugador1 equals: 0.! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 21:08:33'!
test10SumaPuntoLaManoEnCasoDeMatarAlPie

	| mano pie rondaDeTruco |
	
	mano := self mano.
	pie := self pie.
	
	rondaDeTruco := RondaDeTruco 
		conMano: mano pie: pie 
		cartasDeLaMano: self conjuntoDeTresCartas 
		cartasDelPie: self otroConjuntoDeTresCartas.
		
	rondaDeTruco 
		juegaMano: mano con: (CartaDeTruco espadaCon: 1) 
		juegaPie: pie con: (CartaDeTruco oroCon: 3).
		
	self assert: rondaDeTruco puntajeJugador2 equals: 0.
	self assert: rondaDeTruco puntajeJugador1 equals: 1.! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 21:22:02'!
test11LaManoSeMantieneLuegoDeGanar

	| mano pie rondaDeTruco |
	
	mano := self mano.
	pie := self pie.
	
	rondaDeTruco := RondaDeTruco 
		conMano: mano pie: pie 
		cartasDeLaMano: self conjuntoDeTresCartas 
		cartasDelPie: self otroConjuntoDeTresCartas.
		
	rondaDeTruco 
		juegaMano: mano con: (CartaDeTruco espadaCon: 1) 
		juegaPie: pie con: (CartaDeTruco oroCon: 3).
	
	rondaDeTruco 
		juegaMano: mano con: (CartaDeTruco espadaCon: 3) 
		juegaPie: pie con: (CartaDeTruco oroCon: 1).
		
	self assert: rondaDeTruco puntajeJugador2 equals: 0.
	self assert: rondaDeTruco puntajeJugador1 equals: 2.! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 21:15:53'!
test12LaManoNoSeMantieneLuegoDePerder

	| mano pie rondaDeTruco |
	
	mano := self mano.
	pie := self pie.
	
	rondaDeTruco := RondaDeTruco 
		conMano: mano pie: pie 
		cartasDeLaMano: self conjuntoDeTresCartas 
		cartasDelPie: self otroConjuntoDeTresCartas.
		
	rondaDeTruco 
		juegaMano: mano con: (CartaDeTruco espadaCon: 2) 
		juegaPie: pie con: (CartaDeTruco oroCon: 3).
	
	self
		should: [rondaDeTruco 
			juegaMano: mano con: (CartaDeTruco espadaCon: 3) 
			juegaPie: pie con: (CartaDeTruco oroCon: 2).] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError|
			self assert: anError messageText equals: rondaDeTruco elEnfrentamientoDebeSerIniciadoPorLaMano.
			self assert: rondaDeTruco puntajeJugador2 equals: 1.
			self assert: rondaDeTruco puntajeJugador1 equals: 0.].! !

!RondaDeTrucoTest methodsFor: 'tests' stamp: 'tp 11/27/2023 21:20:53'!
test13ElJugador2SumaDosPuntosLuegoDeGanarDosEnfrentamientos

	| mano pie rondaDeTruco |
	
	mano := self mano.
	pie := self pie.
	
	rondaDeTruco := RondaDeTruco 
		conMano: mano pie: pie 
		cartasDeLaMano: self conjuntoDeTresCartas 
		cartasDelPie: self otroConjuntoDeTresCartas.
		
	rondaDeTruco 
		juegaMano: mano con: (CartaDeTruco espadaCon: 2) 
		juegaPie: pie con: (CartaDeTruco oroCon: 3).
		
	rondaDeTruco 
		juegaMano: pie con: (CartaDeTruco anchoDeBasto ) 
		juegaPie: mano con: (CartaDeTruco espadaCon:3).
			
	self assert: rondaDeTruco puntajeJugador2 equals: 2.
	self assert: rondaDeTruco puntajeJugador1 equals: 0.! !


!classDefinition: #CartaDeTruco category: 'ISW1-2021-1C-2doParcial'!
Object subclass: #CartaDeTruco
	instanceVariableNames: 'palo numero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!CartaDeTruco methodsFor: 'initialization' stamp: 'HAW 7/3/2021 15:27:51'!
initializePalo: unPalo numero: unNumero 
	
	palo := unPalo.
	numero := unNumero.! !


!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:44:36'!
= unaCarta 
	
	^(unaCarta isKindOf: self class) and: [(unaCarta paloEs: palo) and: [ unaCarta numeroEs: numero ]]! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/5/2021 10:49:51'!
empardaCon: cartaParda

	^self valor = cartaParda valor! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:43:24'!
hash
	
	^palo hash bitXor: numero hash ! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/5/2021 10:49:59'!
mataA: cartaPerdedora

	^self valor < cartaPerdedora valor! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:41:53'!
numeroEs: unNumero

	^numero = unNumero ! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:41:39'!
paloEs: unPalo

	^palo = unPalo ! !


!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:20'!
esAncho

	^ self numeroEs: 1! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:31'!
esAnchoDeBasto
	
	^self esAncho and: [ self esDeBasto ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:41'!
esAnchoDeEspada
	
	^self esAncho and: [ self esDeEspada ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:20'!
esAnchoFalso
	
	^self esAncho and: [ self esDeOro or: [ self esDeCopa ]]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:19:32'!
esCaballo
	
	^self numeroEs: 11! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:25:29'!
esDeBasto
	
	^self paloEs: self basto! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:09'!
esDeCopa
	
	^self paloEs: self copa! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:18'!
esDeEspada
	
	^self paloEs: self espada ! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:35'!
esDeOro
	
	^self paloEs: self oro! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:19:22'!
esRey
	
	^self numeroEs: 12! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:16:57'!
esSiete
	
	^self numeroEs: 7! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:27:00'!
esSieteDeEspadas
	
	^self esSiete and: [ self esDeEspada ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:27:15'!
esSieteDeOro
	
	^self esSiete and: [ self esDeOro ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:09'!
esSieteFalso
	
	^self esSiete and: [ self esDeCopa or: [ self esDeBasto ]]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:19:43'!
esSota
	
	^self numeroEs: 10! !


!CartaDeTruco methodsFor: 'printing' stamp: 'HAW 7/3/2021 15:14:43'!
printOn: aStream

	aStream 
		print: numero;
		nextPutAll: ' de ';
		nextPutAll: 	palo ! !


!CartaDeTruco methodsFor: 'valor' stamp: 'HAW 7/3/2021 14:51:09'!
valor
	
	^self class valorDe: self! !


!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:24:33'!
basto
	
	^self class basto! !

!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:24:44'!
copa

	^ self class copa! !

!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:24:08'!
espada
	
	^self class espada! !

!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:26:27'!
oro

	^ self class oro! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartaDeTruco class' category: 'ISW1-2021-1C-2doParcial'!
CartaDeTruco class
	instanceVariableNames: 'ordenDePrioridad'!

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/4/2021 17:49:37'!
anchoDeBasto
	
	^self bastoCon: 1! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/4/2021 17:49:57'!
anchoDeEspada
	
	^self espadaCon: 1! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:03'!
bastoCon: unNumero

	^self palo: self basto numero: unNumero! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:08'!
copaCon: unNumero

	^self palo: self copa numero: unNumero! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:16'!
espadaCon: unNumero

	^self palo: self espada numero: unNumero ! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:34'!
oroCon: unNumero

	^self palo: self oro numero: unNumero ! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/4/2021 18:06:08'!
palo: unPalo numero: unNumero 
	
	self assertNúmeroEsVálido: unNumero.
	self assertPaloEsVálido: unPalo.
	
	^self new initializePalo: unPalo numero: unNumero ! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 15:12:50'!
sieteDeEspada
	
	^self espadaCon: 7! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 15:17:44'!
sieteDeOro
	
	^self oroCon: 7! !


!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:56:25'!
basto
	
	^#basto! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:57:25'!
copa
	
	^#copa! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:55:44'!
espada
	
	^#espada! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:57:43'!
oro
	
	^#oro! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/4/2021 18:07:36'!
palos

	"No se puede acceder a self en backtick, por eso se usa CartaDeTruco como receiver - Hernan"
	^ `{CartaDeTruco espada. CartaDeTruco basto. CartaDeTruco oro. CartaDeTruco copa }`! !


!CartaDeTruco class methodsFor: 'initialization' stamp: 'HAW 7/5/2021 10:52:07'!
initializeOrdenDePrioridad
	
	"Cuanto más chico sea el índice de la carta en esta colección, más valor tiene - Hernan"
	ordenDePrioridad := OrderedCollection new.
	
	ordenDePrioridad 
		add: [ :carta | carta esAnchoDeEspada ];
		add: [ :carta | carta esAnchoDeBasto ];
		add: [ :carta | carta esSieteDeEspadas ];
		add: [ :carta | carta esSieteDeOro ];
		add: [ :carta | carta numeroEs: 3 ];
		add: [ :carta | carta numeroEs: 2 ];
		add: [ :carta | carta esAnchoFalso ];
		add: [ :carta | carta esRey ];
		add: [ :carta | carta esCaballo ];
		add: [ :carta | carta esSota ];
		add: [ :carta | carta esSieteFalso ];
		add: [ :carta | carta numeroEs: 6 ];
		add: [ :carta | carta numeroEs: 5 ];
		add: [ :carta | carta numeroEs: 4 ];
		yourself.
	
	! !


!CartaDeTruco class methodsFor: 'valor' stamp: 'HAW 7/3/2021 14:54:01'!
ordenDePrioridad
	
	^ordenDePrioridad ifNil: [ self initializeOrdenDePrioridad ] ! !

!CartaDeTruco class methodsFor: 'valor' stamp: 'HAW 7/5/2021 11:58:24'!
valorDe: unaCarta 
	
	self ordenDePrioridad withIndexDo: [ :bloqueDeVerificacion :index |
		(bloqueDeVerificacion value: unaCarta) ifTrue: [ ^index ]].
	
	self error: self tablaDeValoresIncorrectaOCartaInvalidaErrorDescription! !


!CartaDeTruco class methodsFor: 'error descriptions' stamp: 'HAW 7/5/2021 11:58:02'!
numeroDeCartaInvalidoErrorDescription
	
	^'El truco no se puede jugar con ochos ni con nueves'! !

!CartaDeTruco class methodsFor: 'error descriptions' stamp: 'HAW 7/5/2021 11:58:12'!
paloInvalidoErrorDescription
	
	^'Los palos de la carta solo pueden ser espada, basto, oro y copa'! !

!CartaDeTruco class methodsFor: 'error descriptions' stamp: 'HAW 7/5/2021 11:58:24'!
tablaDeValoresIncorrectaOCartaInvalidaErrorDescription
	
	^'Error de programación: Tabla de valores incorrecta o carta inválida'! !


!CartaDeTruco class methodsFor: 'assertions' stamp: 'HAW 7/5/2021 11:58:02'!
assertNúmeroEsVálido: unNumero

	unNumero < 1 ifTrue: [ self error: self numeroDeCartaInvalidoErrorDescription ].
	unNumero > 12 ifTrue: [ self error: self numeroDeCartaInvalidoErrorDescription ].
	(unNumero between: 8 and: 9) ifTrue: [ self error: self numeroDeCartaInvalidoErrorDescription ].
	unNumero isInteger ifFalse: [ self error: self numeroDeCartaInvalidoErrorDescription ]! !

!CartaDeTruco class methodsFor: 'assertions' stamp: 'HAW 7/5/2021 11:58:12'!
assertPaloEsVálido: unPalo

	^ (self palos includes: unPalo) ifFalse: [ self error: self paloInvalidoErrorDescription ]! !


!classDefinition: #JugadorDeTruco category: 'ISW1-2021-1C-2doParcial'!
Object subclass: #JugadorDeTruco
	instanceVariableNames: 'cartas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!


!classDefinition: #RondaDeTruco category: 'ISW1-2021-1C-2doParcial'!
Object subclass: #RondaDeTruco
	instanceVariableNames: 'mano pie cartasJugador1 cartasJugador2 puntajeJugador1 puntajeJugador2 jugador1 jugador2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!RondaDeTruco methodsFor: 'initialization' stamp: 'tp 11/27/2023 21:09:47'!
initializeConMano: unaMano pie: unPie cartasDeLaMano: unasCartasMano cartasDelPie: unasCartasPie   

	mano := unaMano.
	pie := unPie.
	jugador1 := unaMano.
	jugador2 := unPie.
	cartasJugador1 := unasCartasMano.
	cartasJugador2 := unasCartasPie.
	puntajeJugador1 := 0.
	puntajeJugador2 := 0.! !


!RondaDeTruco methodsFor: 'enfrentamientos' stamp: 'tp 11/27/2023 21:04:20'!
assertEsElPieAJugar: pieAJugar

	^ pieAJugar = pie
		ifFalse: [self error: self debeJugarElPieCorrecto ]! !

!RondaDeTruco methodsFor: 'enfrentamientos' stamp: 'tp 11/27/2023 20:46:20'!
assertEsLaManoAJugar: manoAJugar

	^ manoAJugar = mano
		ifFalse: [self error: self elEnfrentamientoDebeSerIniciadoPorLaMano]! !

!RondaDeTruco methodsFor: 'enfrentamientos' stamp: 'tp 11/27/2023 21:09:47'!
assertEstaLaCartaElPie: cartaPie

	^ (cartasJugador2 includes: cartaPie)
		ifFalse: [self error: self noSePuedeJugarConCartaQueNoSetTiene]! !

!RondaDeTruco methodsFor: 'enfrentamientos' stamp: 'tp 11/27/2023 21:09:38'!
assertEstaLaCartaLaMano: cartaMano

	^ (cartasJugador1 includes: cartaMano)
		ifFalse: [self error: self noSePuedeJugarConCartaQueNoSetTiene]! !

!RondaDeTruco methodsFor: 'enfrentamientos' stamp: 'tp 11/27/2023 21:13:50'!
juegaMano: manoAJugar con: cartaMano juegaPie: pieAJugar con: cartaPie 
	
	self assertEsLaManoAJugar: manoAJugar.
	self assertEsElPieAJugar: pieAJugar.
		
	self assertEstaLaCartaLaMano: cartaMano.
	self assertEstaLaCartaElPie: cartaPie.
	
	manoAJugar = pieAJugar ifTrue: [self error: self noPuedeJugarConsigoMismo].
	
	(cartaPie mataA: cartaMano)
		ifTrue: [
			puntajeJugador2 := puntajeJugador2 + 1.
			mano := pieAJugar	.
			pie := manoAJugar	]
		ifFalse: [
			puntajeJugador1 := puntajeJugador1 + 1].
		
		
	
		
	! !


!RondaDeTruco methodsFor: 'error descriptions' stamp: 'tp 11/27/2023 21:02:07'!
debeJugarElPieCorrecto
	
	^'debe jugar el pie correcto'! !

!RondaDeTruco methodsFor: 'error descriptions' stamp: 'tp 11/27/2023 20:23:41'!
elEnfrentamientoDebeSerIniciadoPorLaMano
	
	^ 'el enfrentamiento debe ser iniciado por la mano'! !

!RondaDeTruco methodsFor: 'error descriptions' stamp: 'tp 11/27/2023 20:47:29'!
noPuedeJugarConsigoMismo
	
	^'no puede jugar consigo mismo'! !

!RondaDeTruco methodsFor: 'error descriptions' stamp: 'tp 11/27/2023 20:28:55'!
noSePuedeJugarConCartaQueNoSetTiene
	
	^'no se puede jugar con carta que no se tiene'! !


!RondaDeTruco methodsFor: 'puntajes' stamp: 'tp 11/27/2023 21:08:23'!
puntajeJugador1
	
	^ puntajeJugador1
	! !

!RondaDeTruco methodsFor: 'puntajes' stamp: 'tp 11/27/2023 21:08:33'!
puntajeJugador2
	
	^puntajeJugador2! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RondaDeTruco class' category: 'ISW1-2021-1C-2doParcial'!
RondaDeTruco class
	instanceVariableNames: ''!

!RondaDeTruco class methodsFor: 'instance creation' stamp: 'tp 11/27/2023 20:05:27'!
conMano: mano pie: pie cartasDeLaMano: unasCartasMano cartasDelPie: unasCartasPie   

	self assertCantidadDeCartasCorrectasPara: unasCartasMano mano: unasCartasPie.
	self assertSeUtilizoUnMazoPara: unasCartasMano mano: unasCartasPie.
	
	^self new initializeConMano: mano pie: pie cartasDeLaMano: unasCartasMano cartasDelPie: unasCartasPie ! !


!RondaDeTruco class methodsFor: 'assertions' stamp: 'tp 11/27/2023 19:48:01'!
assertCantidadDeCartasCorrectasPara: pie mano: mano

	self assertTieneCantidadDeCartasCorrectas: mano.
	self assertTieneCantidadDeCartasCorrectas: pie! !

!RondaDeTruco class methodsFor: 'assertions' stamp: 'tp 11/27/2023 20:05:12'!
assertNoHayInterseccionDeCartasCon: mano y: pie

	^ (pie intersection: mano) isEmpty
		ifFalse: [self error: self descripcionDeRepartidaConMasDeUnMazo ]! !

!RondaDeTruco class methodsFor: 'assertions' stamp: 'tp 11/27/2023 20:16:05'!
assertSeUtilizoUnMazoPara: cartasPie mano: cartasMano

	self assertNoHayInterseccionDeCartasCon: cartasMano y: cartasPie.
	
	self noHayCartasRepetidasEnMismoJugador: cartasMano.
	self noHayCartasRepetidasEnMismoJugador: cartasPie.	! !

!RondaDeTruco class methodsFor: 'assertions' stamp: 'tp 11/27/2023 20:05:04'!
assertTieneCantidadDeCartasCorrectas: cartas 
	
	cartas size ~= 3
		ifTrue: [self error: self cantidadDeCartasRepartidasIncorrecta]! !

!RondaDeTruco class methodsFor: 'assertions' stamp: 'tp 11/27/2023 20:15:55'!
noHayCartasRepetidasEnMismoJugador: cartasMano

	^ cartasMano do: [:unaCarta |
		(cartasMano occurrencesOf: unaCarta) = 1
			ifFalse: [self error: self descripcionDeRepartidaConMasDeUnMazo ]]! !


!RondaDeTruco class methodsFor: 'error descriptions' stamp: 'tp 11/27/2023 19:31:55'!
cantidadDeCartasRepartidasIncorrecta
	
	^ 'cantidad de cartas repartidas incorrecta'! !

!RondaDeTruco class methodsFor: 'error descriptions' stamp: 'tp 11/27/2023 19:46:22'!
descripcionDeRepartidaConMasDeUnMazo
	
	^ 'se repartio cartas con mas de un mazo'! !
