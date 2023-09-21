!classDefinition: #TestDePerforación category: 'ISW1-2023-1C-Parcial-1'!
TestCase subclass: #TestDePerforación
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!TestDePerforación methodsFor: 'asserciones' stamp: 'tp 9/21/2023 15:29:32'!
enSuelo: unSueloAExcavar laCantidadDeCapasDe: unaClaseDeCapaDeSuelo deberiaSer: unaCantidadDeCapasDeSuelo

	| excavadora |
	
	excavadora := Perforadora sobreSuelo: unSueloAExcavar .
	
	self assert: 
		unaCantidadDeCapasDeSuelo equals: (excavadora contarCapas: unaClaseDeCapaDeSuelo new).

	! !

!TestDePerforación methodsFor: 'asserciones' stamp: 'tp 9/21/2023 15:34:25'!
enSuelo: unSueloAExcavar laProfundidadHastaLaPrimeraCapaDe: unaClaseDeCapaDeSuelo deberiaSer: unaCantidadDeCapasDeSuelo

	| excavadora |
	
	excavadora := Perforadora sobreSuelo: unSueloAExcavar .
	
	self assert: 
		unaCantidadDeCapasDeSuelo equals: (excavadora calcularProfundidadDelSueloHasta: unaClaseDeCapaDeSuelo new).

	! !


!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:19:16'!
test01CuandoExcavaSueloArenosoConMechaSoftRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConArenaTierraYConcretoDeResistencia5 .
	
	excavadora := self 
				excavadoraConMechaSoftSobre: sueloAExcavar 
				hacer: [:unaExcavadora | unaExcavadora darGolpeDeTaladro].
	
	self assert: self unaCapaDeSueloTierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:19:40'!
test02CuandoExcavaSueloTierraConMechaSoftNoModificaElSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConTierraYConcretoDeResistencia5 .
	
	excavadora := excavadora := self 
				excavadoraConMechaSoftSobre: sueloAExcavar 
				hacer: [:unaExcavadora | unaExcavadora darGolpeDeTaladro].
	
	self assert: self unaCapaDeSueloTierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:20:14'!
test03CuandoExcavaConcretoConMechaSoftSeRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConConcretoDeResistencia5YTierra .
	
	excavadora := excavadora := self 
				excavadoraConMechaSoftSobre: sueloAExcavar 
				hacer: [:unused].
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:20:40'!
test04CuandoExcavaSueloArenosoConMechaWidiaRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConArenaTierraYConcretoDeResistencia5 .
	
	excavadora := self 
				excavadoraConMechaWidiaSobre: sueloAExcavar 
				hacer: [:unaExcavadora | unaExcavadora darGolpeDeTaladro].
	
	self assert: self unaCapaDeSueloTierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:22:07'!
test05CuandoExcavaSueloTierraConMechaWidiaEnDosImpactosTransformaLaCapaEnArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConTierraYConcretoDeResistencia5 .
	
	excavadora := self 
				excavadoraConMechaWidiaSobre: sueloAExcavar 
				hacer: [:unaExcavadora | unaExcavadora darGolpeDeTaladro; darGolpeDeTaladro ].	
	
	self assert: self unaCapaDeSueloArenoso equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:22:26'!
test06CuandoExcavaSueloConcretoConMechaWidiaEnTresImpactosRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConConcretoDeResistencia5YTierra .
	
	excavadora := self 
				excavadoraConMechaWidiaSobre: sueloAExcavar 
				hacer: [:unaExcavadora | unaExcavadora darGolpeDeTaladro; darGolpeDeTaladro ].	
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:22:56'!
test07CuandoExcavaSueloArenosoConMechaDiamanteRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConArenaTierraYConcretoDeResistencia5 .
	
	excavadora := self 
				excavadoraConMechaDiamanteSobre: sueloAExcavar 
				hacer: [:unused].	
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota ].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:23:17'!
test08CuandoExcavaSueloTierraConMechaDiamanteRemueveCapa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConTierraYConcretoDeResistencia5 .
	
	excavadora := self 
				excavadoraConMechaDiamanteSobre: sueloAExcavar 
				hacer: [:unaExcavadora | unaExcavadora darGolpeDeTaladro].
	
	self assert: (self unaCapaDeSueloConcretoConResistencia5) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:23:45'!
test09CuandoExcavaSueloConcretoConMechaDiamanteBajaUnDecimoDeResistencia

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConConcretoDeResistencia5YTierra .
	
	excavadora := self 
				excavadoraConMechaDiamanteSobre: sueloAExcavar 
				hacer: [:unaExcavadora | unaExcavadora darGolpeDeTaladro; darGolpeDeTaladro ].
	
	self assert: (self unaCapaDeSueloConcretoConResistencia4) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 16:30:14'!
test10CuandoRemueveLaCapaYHayPiedrasLasRecolectaEnSuContainer

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			self unaCapaDeSueloArenoso.
			SueloDePiedras con: 'Mica'.
			SueloDePiedras con: 'Marmol'
			} .
	
	excavadora := excavadora := self 
				excavadoraConMechaSoftSobre: sueloAExcavar 
				hacer: [:unaExcavadora | unaExcavadora darGolpeDeTaladro].
	
	self assert: {	SueloDePiedras con: 'Mica'.			SueloDePiedras con: 'Marmol'} equals: excavadora elementsInContainer
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:24:39'!
test11CuandoRemueveLaCapaYNoHayNadaNoRecogeNada

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConCapaArenoso .
	
	excavadora := excavadora := self 
				excavadoraConMechaSoftSobre: sueloAExcavar 
				hacer: [:unaExcavadora | unaExcavadora darGolpeDeTaladro].
	
	self assert: excavadora elementsInContainer isEmpty
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 14:56:40'!
test12NoPuedePerforarSinMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloConCapaArenoso .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
		
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'No puede perforar' equals: unError messageText.
			self assert: (CapaDeSueloArenoso new) equals: excavadora capaDeSueloInmediata ].	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:36:17'!
test13PuedeCalcularProfundidadDelSuelo

	| excavadora sueloAExcavar |
	
	"se puede hacer como los de abajo, me aburrí"
	
	sueloAExcavar := self sueloDe3CapasConDiferentesAlturas .
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 42 equals: excavadora calcularProfundidadDelSuelo.

	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:31:37'!
test14PuedeContarLasCapasDeTipoArenoso

	| sueloAExcavar |
	
	sueloAExcavar := self sueloDe4CapasConDiferentesAlturas.
	
	self
		enSuelo: sueloAExcavar 
		laCantidadDeCapasDe: CapaDeSueloArenoso 
		deberiaSer: 2. 

	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:31:59'!
test15PuedeContarLasCapasDeTipoTierra
	
	| sueloAExcavar |
	
	sueloAExcavar := self sueloDe4CapasConDiferentesAlturas.
	
	self
		enSuelo: sueloAExcavar 
		laCantidadDeCapasDe: CapaDeSueloTierra 
		deberiaSer: 1. 

	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:32:27'!
test16PuedeContarLasCapasDeTipoConcreto
	
	| sueloAExcavar |
	
	sueloAExcavar := self sueloDe4CapasConDiferentesAlturas.
	
	self
		enSuelo: sueloAExcavar 
		laCantidadDeCapasDe: CapaDeSueloConcreto 
		deberiaSer: 1. 

	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:35:06'!
test17PuedeCalcularProfundidadHastaPrimerCapaDeTipoArenoso

	| sueloAExcavar |
	
	sueloAExcavar := self sueloDe4CapasConDiferentesAlturas.
	
	self 
		enSuelo: sueloAExcavar 
		laProfundidadHastaLaPrimeraCapaDe: CapaDeSueloArenoso 
		deberiaSer: 0

	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:35:36'!
test18PuedeCalcularProfundidadHastaPrimerCapaDeTipoTierra
	
	| sueloAExcavar |
	
	sueloAExcavar := self sueloDe4CapasConDiferentesAlturas.
	
	self 
		enSuelo: sueloAExcavar 
		laProfundidadHastaLaPrimeraCapaDe: CapaDeSueloTierra 
		deberiaSer: 2

	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 15:35:55'!
test19PuedeCalcularProfundidadHastaPrimerCapaDeTipoConcreto

	| sueloAExcavar |
	
	sueloAExcavar := self sueloDe4CapasConDiferentesAlturas.
	
	self 
		enSuelo: sueloAExcavar 
		laProfundidadHastaLaPrimeraCapaDe: CapaDeSueloConcreto 
		deberiaSer: 42

	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 16:35:12'!
test20NoSePuedenTenerDosCapasPerforablesContiguas

	| sueloAExcavar |
	
	sueloAExcavar := {
			self unaCapaDeSueloArenoso.
			self unaCapaDeSueloArenoso.
			} .
	
	self should: [Perforadora sobreSuelo: sueloAExcavar]
		raise: Error
		withExceptionDo: [:unError |
			self assert: Perforadora capasContiguasIgualesErrorDescription equals: unError messageText.].

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'tp 9/21/2023 16:35:50'!
test21NoSePuedenTenerDosCapasDePiedrasContiguas

	| sueloAExcavar |
	
	sueloAExcavar := {
			SueloDePiedras con: 'Mica'.
			SueloDePiedras con: 'Mica'
			} .
	
	self should: [Perforadora sobreSuelo: sueloAExcavar]
		raise: Error
		withExceptionDo: [:unError |
			self assert: Perforadora capasContiguasIgualesErrorDescription equals: unError messageText.].

	
	! !


!TestDePerforación methodsFor: 'suelos' stamp: 'tp 9/21/2023 14:52:21'!
sueloConArenaTierraYConcretoDeResistencia5

	^ {
			self unaCapaDeSueloArenoso.
			self unaCapaDeSueloTierra.
			self unaCapaDeSueloConcretoConResistencia5 }! !

!TestDePerforación methodsFor: 'suelos' stamp: 'tp 9/21/2023 14:56:40'!
sueloConCapaArenoso

	^ {
			self unaCapaDeSueloArenoso.
			}! !

!TestDePerforación methodsFor: 'suelos' stamp: 'tp 9/21/2023 14:53:56'!
sueloConConcretoDeResistencia5YTierra

	^ {
			self unaCapaDeSueloConcretoConResistencia5.
			self unaCapaDeSueloTierra.}! !

!TestDePerforación methodsFor: 'suelos' stamp: 'tp 9/21/2023 14:53:06'!
sueloConTierraYConcretoDeResistencia5

	^ {
			self unaCapaDeSueloTierra.
			self unaCapaDeSueloConcretoConResistencia5 }! !

!TestDePerforación methodsFor: 'suelos' stamp: 'tp 9/21/2023 15:25:56'!
sueloDe3CapasConDiferentesAlturas

	^ { self unaCapaDeSueloArenoso setAltura: 2. self unaCapaDeSueloTierra setAltura: 40. self unaCapaDeSueloArenoso}! !

!TestDePerforación methodsFor: 'suelos' stamp: 'tp 9/21/2023 14:57:36'!
sueloDe4CapasConDiferentesAlturas

	^ { self unaCapaDeSueloArenoso setAltura: 2. self unaCapaDeSueloTierra setAltura: 40. self unaCapaDeSueloArenoso. self unaCapaDeSueloConcretoConResistencia10 }! !


!TestDePerforación methodsFor: 'excavadoras con mechas' stamp: 'tp 9/21/2023 15:21:14'!
excavadoraConMechaDiamanteSobre: unSueloAExcavar hacer: unBloqueDeAcciones

	| excavadora |
	
	excavadora := Perforadora sobreSuelo: unSueloAExcavar .
	
	excavadora ponerMechaDiamante.
	
	unBloqueDeAcciones value: excavadora.
	
	^ excavadora
	
	! !

!TestDePerforación methodsFor: 'excavadoras con mechas' stamp: 'tp 9/21/2023 15:16:30'!
excavadoraConMechaSoftSobre: unSueloAExcavar hacer: unBloqueDeAcciones

	| excavadora |
	
	excavadora := Perforadora sobreSuelo: unSueloAExcavar .
	
	excavadora ponerMechaSoft.
	
	unBloqueDeAcciones value: excavadora.
	
	^ excavadora
	
	! !

!TestDePerforación methodsFor: 'excavadoras con mechas' stamp: 'tp 9/21/2023 15:21:19'!
excavadoraConMechaWidiaSobre: unSueloAExcavar hacer: unBloqueDeAcciones

	| excavadora |
	
	excavadora := Perforadora sobreSuelo: unSueloAExcavar .
	
	excavadora ponerMechaWidia .
	
	unBloqueDeAcciones value: excavadora.
	
	^ excavadora
	
	! !


!TestDePerforación methodsFor: 'capas de suelo' stamp: 'tp 9/20/2023 16:18:20'!
unaCapaDeSueloArenoso

	^ CapaDeSueloArenoso new! !

!TestDePerforación methodsFor: 'capas de suelo' stamp: 'tp 9/20/2023 16:18:35'!
unaCapaDeSueloConcretoConResistencia10

	^ CapaDeSueloConcreto conResistencia: 10! !

!TestDePerforación methodsFor: 'capas de suelo' stamp: 'tp 9/20/2023 16:20:08'!
unaCapaDeSueloConcretoConResistencia4

	^ CapaDeSueloConcreto conResistencia: 4! !

!TestDePerforación methodsFor: 'capas de suelo' stamp: 'tp 9/20/2023 16:18:45'!
unaCapaDeSueloConcretoConResistencia5

	^ CapaDeSueloConcreto conResistencia: 5! !

!TestDePerforación methodsFor: 'capas de suelo' stamp: 'tp 9/20/2023 16:18:52'!
unaCapaDeSueloTierra

	^ CapaDeSueloTierra new! !


!classDefinition: #CapaDeSuelo category: 'ISW1-2023-1C-Parcial-1'!
Object subclass: #CapaDeSuelo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!


!CapaDeSuelo methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:32:19'!
esArenoso
	^self subclassResponsibility ! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:32:15'!
esConcreto
	^self subclassResponsibility ! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:32:09'!
esTierra

	^ self subclassResponsibility ! !


!CapaDeSuelo methodsFor: 'comparing' stamp: 'tp 9/20/2023 15:30:03'!
= unaCapaDeSuelo

	^ self subclassResponsibility ! !

!CapaDeSuelo methodsFor: 'comparing' stamp: 'tp 9/20/2023 16:38:38'!
hash

	^ self subclassResponsibility ! !


!CapaDeSuelo methodsFor: 'accessing' stamp: 'tp 9/20/2023 15:25:42'!
altura

	^ self subclassResponsibility ! !


!CapaDeSuelo methodsFor: 'scan' stamp: 'tp 9/20/2023 15:25:26'!
scan

	^ self subclassResponsibility ! !


!CapaDeSuelo methodsFor: 'setters' stamp: 'tp 9/20/2023 15:25:16'!
setAltura: unaAltura

	^ self subclassResponsibility ! !


!CapaDeSuelo methodsFor: 'excavation' stamp: 'tp 9/20/2023 15:43:46'!
darGolpeDeTaladroCon: unTaladro

	^ self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSuelo class' category: 'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo class
	instanceVariableNames: ''!

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:02:32'!
arenoso

	^self new initializeArenoso! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'ARM 5/5/2023 18:01:35'!
concretoConResistencia: resistencia 

	^self new initializeConcretoConResistencia: resistencia ! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:03:15'!
tierra

	^self new initializeTierra! !


!classDefinition: #SueloDePiedras category: 'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #SueloDePiedras
	instanceVariableNames: 'piedras'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!SueloDePiedras methodsFor: 'accessing' stamp: 'tp 9/21/2023 16:06:08'!
piedras

	^ piedras! !


!SueloDePiedras methodsFor: 'comparing' stamp: 'tp 9/21/2023 16:05:47'!
= otraCapaDeSuelo

	^ (otraCapaDeSuelo isKindOf: self class) and: [piedras = otraCapaDeSuelo piedras]! !


!SueloDePiedras methodsFor: 'initialization' stamp: 'tp 9/21/2023 16:03:09'!
initializeCon: unTipoDePiedras

	piedras := unTipoDePiedras 

	! !


!SueloDePiedras methodsFor: 'as yet unclassified' stamp: 'tp 9/21/2023 16:28:31'!
alSerPerforadaPor: unaExcavadora

	^ unaExcavadora sueloAPerforarDePiedras! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SueloDePiedras class' category: 'ISW1-2023-1C-Parcial-1'!
SueloDePiedras class
	instanceVariableNames: ''!

!SueloDePiedras class methodsFor: 'instance creation' stamp: 'tp 9/21/2023 16:06:58'!
con: unTipoDePiedras

	 ^ self new initializeCon: unTipoDePiedras ! !


!classDefinition: #SueloPerforable category: 'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #SueloPerforable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!SueloPerforable methodsFor: 'as yet unclassified' stamp: 'tp 9/21/2023 16:28:26'!
alSerPerforadaPor: unaExcavadora

	" debería agregar otras funciones a la clase abstract, con subclassResponsability, etc, queda por hacer "

	^ unaExcavadora sueloAPerforarPerforable! !


!classDefinition: #CapaDeSueloArenoso category: 'ISW1-2023-1C-Parcial-1'!
SueloPerforable subclass: #CapaDeSueloArenoso
	instanceVariableNames: 'altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSueloArenoso methodsFor: 'initialization' stamp: 'tp 9/20/2023 15:13:39'!
initialize

	altura := 0! !


!CapaDeSueloArenoso methodsFor: 'setters' stamp: 'tp 9/20/2023 15:17:28'!
setAltura: unaAltura

	altura := unaAltura ! !


!CapaDeSueloArenoso methodsFor: 'scan' stamp: 'tp 9/20/2023 15:21:30'!
scan
	
	^ 7! !


!CapaDeSueloArenoso methodsFor: 'accessing' stamp: 'tp 9/20/2023 15:22:22'!
altura

	^ altura! !


!CapaDeSueloArenoso methodsFor: 'comparing' stamp: 'tp 9/20/2023 15:28:54'!
= unaCapaDeSuelo

	^ unaCapaDeSuelo isKindOf: self class! !


!CapaDeSueloArenoso methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:31:34'!
esArenoso

	^ true! !

!CapaDeSueloArenoso methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:31:43'!
esConcreto

	^ false! !

!CapaDeSueloArenoso methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:31:52'!
esTierra

	^ false! !


!CapaDeSueloArenoso methodsFor: 'excavation' stamp: 'tp 9/20/2023 15:43:08'!
darGolpeDeTaladroCon: unTaladro

	^ unTaladro darGolpeDeTaladroEnArenoso ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSueloArenoso class' category: 'ISW1-2023-1C-Parcial-1'!
CapaDeSueloArenoso class
	instanceVariableNames: ''!

!CapaDeSueloArenoso class methodsFor: 'scan' stamp: 'tp 9/20/2023 16:24:25'!
scan 

	^ 7! !


!classDefinition: #CapaDeSueloConcreto category: 'ISW1-2023-1C-Parcial-1'!
SueloPerforable subclass: #CapaDeSueloConcreto
	instanceVariableNames: 'altura resistencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSueloConcreto methodsFor: 'initialization' stamp: 'tp 9/20/2023 15:15:41'!
initializeConResistencia: unaResistencia

	altura := 0.
	resistencia := unaResistencia! !


!CapaDeSueloConcreto methodsFor: 'setters' stamp: 'tp 9/20/2023 15:17:34'!
setAltura: unaAltura

	altura := unaAltura ! !


!CapaDeSueloConcreto methodsFor: 'scan' stamp: 'tp 9/20/2023 15:21:11'!
scan
	
	^ 50! !


!CapaDeSueloConcreto methodsFor: 'bajar resistencia' stamp: 'tp 9/20/2023 15:20:14'!
bajaUnDecimoDeResistencia

	resistencia := resistencia - 1! !

!CapaDeSueloConcreto methodsFor: 'bajar resistencia' stamp: 'tp 9/20/2023 15:20:55'!
sinResistencia

	^ resistencia = 0! !


!CapaDeSueloConcreto methodsFor: 'accessing' stamp: 'tp 9/20/2023 15:22:16'!
altura

	^ altura! !

!CapaDeSueloConcreto methodsFor: 'accessing' stamp: 'tp 9/20/2023 15:26:45'!
resistencia

	^ resistencia ! !


!CapaDeSueloConcreto methodsFor: 'comparing' stamp: 'tp 9/20/2023 15:29:39'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class) and: [resistencia = unaCapaDeSuelo resistencia]! !


!CapaDeSueloConcreto methodsFor: 'excavation' stamp: 'tp 9/20/2023 15:43:20'!
darGolpeDeTaladroCon: unTaladro

	^ unTaladro darGolpeDeTaladroEnConcreto ! !


!CapaDeSueloConcreto methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:31:10'!
esArenoso

	^ false! !

!CapaDeSueloConcreto methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:31:22'!
esConcreto

	^ true! !

!CapaDeSueloConcreto methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:31:13'!
esTierra

	^ false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSueloConcreto class' category: 'ISW1-2023-1C-Parcial-1'!
CapaDeSueloConcreto class
	instanceVariableNames: ''!

!CapaDeSueloConcreto class methodsFor: 'instance creation' stamp: 'tp 9/20/2023 15:14:52'!
conResistencia: unaResistencia

	^ self new initializeConResistencia: unaResistencia! !


!classDefinition: #CapaDeSueloTierra category: 'ISW1-2023-1C-Parcial-1'!
SueloPerforable subclass: #CapaDeSueloTierra
	instanceVariableNames: 'altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSueloTierra methodsFor: 'initialization' stamp: 'tp 9/20/2023 16:33:39'!
initialize

	altura:=0! !


!CapaDeSueloTierra methodsFor: 'setters' stamp: 'tp 9/20/2023 15:17:50'!
setAltura: unaAltura

	altura := unaAltura! !


!CapaDeSueloTierra methodsFor: 'accessing' stamp: 'tp 9/20/2023 15:22:10'!
altura

	^ altura! !


!CapaDeSueloTierra methodsFor: 'comparing' stamp: 'tp 9/20/2023 15:28:42'!
= unaCapaDeSuelo

	^unaCapaDeSuelo isKindOf: self class! !


!CapaDeSueloTierra methodsFor: 'scan' stamp: 'tp 9/20/2023 15:21:39'!
scan
	
	^ 10! !


!CapaDeSueloTierra methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:30:46'!
esArenoso
	
	^ false! !

!CapaDeSueloTierra methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:30:55'!
esConcreto
	
	^ false! !

!CapaDeSueloTierra methodsFor: 'tipo' stamp: 'tp 9/20/2023 15:30:33'!
esTierra
	
	^ true! !


!CapaDeSueloTierra methodsFor: 'excavation' stamp: 'tp 9/20/2023 15:43:37'!
darGolpeDeTaladroCon: unTaladro

	^ unTaladro darGolpeDeTaladroEnTierra ! !


!classDefinition: #MechaDePerforadora category: 'ISW1-2023-1C-Parcial-1'!
Object subclass: #MechaDePerforadora
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaDePerforadora methodsFor: 'testing' stamp: 'tp 9/21/2023 13:53:02'!
tengoMechaRota

	^ self subclassResponsibility ! !


!MechaDePerforadora methodsFor: 'excavation' stamp: 'tp 9/21/2023 13:57:32'!
darGolpeEnSueloArenosoCon: unaPerforadora

	^ self subclassResponsibility ! !

!MechaDePerforadora methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:10:01'!
darGolpeEnSueloConcretoCon: unaPerforadora

	^ self subclassResponsibility ! !

!MechaDePerforadora methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:19:47'!
darGolpeEnSueloTierraCon: unaPerforadora

	^ self subclassResponsibility ! !


!classDefinition: #MechaDiamante category: 'ISW1-2023-1C-Parcial-1'!
MechaDePerforadora subclass: #MechaDiamante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaDiamante methodsFor: 'testing' stamp: 'tp 9/21/2023 13:53:18'!
tengoMechaRota

	^ false! !


!MechaDiamante methodsFor: 'excavation' stamp: 'tp 9/21/2023 13:58:28'!
darGolpeEnSueloArenosoCon: unaPerforadora

	^ unaPerforadora alDarGolpeSeRompeLaMecha! !

!MechaDiamante methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:12:34'!
darGolpeEnSueloConcretoCon: unaPerforadora

	^ unaPerforadora darGolpeEnSueloConcretoConDiamante! !

!MechaDiamante methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:23:31'!
darGolpeEnSueloTierraCon: unaPerforadora

	^ unaPerforadora alDarGolpeSeAtraviesaLaCapa ! !


!classDefinition: #MechaNoPuesta category: 'ISW1-2023-1C-Parcial-1'!
MechaDePerforadora subclass: #MechaNoPuesta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaNoPuesta methodsFor: 'testing' stamp: 'tp 9/21/2023 13:53:36'!
tengoMechaRota

	^ false! !


!MechaNoPuesta methodsFor: 'excavation' stamp: 'tp 9/21/2023 13:58:48'!
darGolpeEnSueloArenosoCon: unaPerforadora

	^ unaPerforadora ! !

!MechaNoPuesta methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:13:19'!
darGolpeEnSueloConcretoCon: unaPerforadora

	^unaPerforadora ! !

!MechaNoPuesta methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:20:11'!
darGolpeEnSueloTierraCon: unaPerforadora

	^ unaPerforadora ! !


!classDefinition: #MechaRota category: 'ISW1-2023-1C-Parcial-1'!
MechaDePerforadora subclass: #MechaRota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaRota methodsFor: 'testing' stamp: 'tp 9/21/2023 13:53:51'!
tengoMechaRota

	^ true! !


!MechaRota methodsFor: 'excavation' stamp: 'tp 9/21/2023 13:59:02'!
darGolpeEnSueloArenosoCon: unaPerforadora

	^ unaPerforadora ! !

!MechaRota methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:13:34'!
darGolpeEnSueloConcretoCon: unaPerforadora

	^ unaPerforadora ! !

!MechaRota methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:20:18'!
darGolpeEnSueloTierraCon: unaPerforadora

	^ unaPerforadora ! !


!classDefinition: #MechaSoft category: 'ISW1-2023-1C-Parcial-1'!
MechaDePerforadora subclass: #MechaSoft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaSoft methodsFor: 'testing' stamp: 'tp 9/21/2023 13:53:57'!
tengoMechaRota

	^ false! !


!MechaSoft methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:23:31'!
darGolpeEnSueloArenosoCon: unaPerforadora

	^ unaPerforadora alDarGolpeSeAtraviesaLaCapa! !

!MechaSoft methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:13:56'!
darGolpeEnSueloConcretoCon: unaPerforadora

	^ unaPerforadora alDarGolpeSeRompeLaMecha ! !

!MechaSoft methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:21:48'!
darGolpeEnSueloTierraCon: unaPerforadora

	^ unaPerforadora ! !


!classDefinition: #MechaWidia category: 'ISW1-2023-1C-Parcial-1'!
MechaDePerforadora subclass: #MechaWidia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!MechaWidia methodsFor: 'testing' stamp: 'tp 9/21/2023 13:54:04'!
tengoMechaRota

	^ false! !


!MechaWidia methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:23:31'!
darGolpeEnSueloArenosoCon: unaPerforadora

	^ unaPerforadora alDarGolpeSeAtraviesaLaCapa! !

!MechaWidia methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:14:33'!
darGolpeEnSueloConcretoCon: unaPerforadora

	^ unaPerforadora darGolpeEnSueloConcretoConWidia! !

!MechaWidia methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:22:06'!
darGolpeEnSueloTierraCon: unaPerforadora

	^ unaPerforadora darGolpeEnSueloTierraConWidia! !


!classDefinition: #Perforadora category: 'ISW1-2023-1C-Parcial-1'!
Object subclass: #Perforadora
	instanceVariableNames: 'tipoDeSuelo mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Perforadora methodsFor: 'cambiar capa' stamp: 'tp 9/21/2023 16:25:18'!
pasarAProximaCapa
	vecesQueGolpeoCapaActual := 0.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	capasDeSueloDebajo ifEmpty: [^self]. 
	self capaDeSueloInmediata alSerPerforadaPor: self.
	
	
	"(capasDeSueloDebajo first class superclass = CapaDeSuelo) ifFalse:[
			container addAll: capasDeSueloDebajo.
		]"! !

!Perforadora methodsFor: 'cambiar capa' stamp: 'tp 9/20/2023 16:00:37'!
transformarCapaEnArenoso
	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst: CapaDeSueloArenoso new; "CapaDeSuelo arenoso"
			yourself! !


!Perforadora methodsFor: 'excavation' stamp: 'tp 9/20/2023 16:31:01'!
darGolpeDeTaladro
		
	self sinMecha ifTrue: [self error: 'No puede perforar'].

	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.
	
	^capasDeSueloDebajo first darGolpeDeTaladroCon: self.

	
	"self sobreSueloArenoso ifTrue: [
		mechaPuesta = #Soft ifTrue: [ ^self pasarAProximaCapa ].
		mechaPuesta = #Widia ifTrue: [ ^self pasarAProximaCapa ].
		mechaPuesta = #Diamante ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió' ].
		^self].
	
	self sobreSueloTierra ifTrue: [
		mechaPuesta = #Soft ifTrue: [ ^self ].
		mechaPuesta = #Widia ifTrue: [ 
			vecesQueGolpeoCapaActual = 2 ifTrue: [ ^self transformarCapaEnArenoso ].
			^self ].
		mechaPuesta = #Diamante ifTrue: [ ^self pasarAProximaCapa ]].
	
	self sobreSueloConcreto ifTrue: [
		mechaPuesta = #Soft ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió'  ].
		mechaPuesta = #Widia ifTrue: [ 
			vecesQueGolpeoCapaActual = 3 ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió' ].
			^self ].
		mechaPuesta = #Diamante ifTrue: [ 
			vecesQueGolpeoCapaActual even ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
			capasDeSueloDebajo first sinResistencia ifTrue: [ ^self transformarCapaEnArenoso].
			^vecesQueGolpeoCapaActual ]]."
	
	"self error: 'error'"! !

!Perforadora methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:24:13'!
darGolpeDeTaladroEnArenoso

	^ mechaPuesta darGolpeEnSueloArenosoCon: self
! !

!Perforadora methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:30:18'!
darGolpeDeTaladroEnConcreto

	^ mechaPuesta darGolpeEnSueloConcretoCon: self
! !

!Perforadora methodsFor: 'excavation' stamp: 'tp 9/21/2023 14:24:04'!
darGolpeDeTaladroEnTierra

	^ mechaPuesta darGolpeEnSueloTierraCon: self
! !

!Perforadora methodsFor: 'excavation' stamp: 'tp 9/20/2023 16:03:40'!
descripcionErrorAlRomperseLaMecha

	^ self error: 'Se rompió'! !

!Perforadora methodsFor: 'excavation' stamp: 'tp 9/21/2023 16:29:22'!
sueloAPerforarDePiedras

	container addAll: capasDeSueloDebajo! !

!Perforadora methodsFor: 'excavation' stamp: 'tp 9/21/2023 16:27:55'!
sueloAPerforarPerforable! !


!Perforadora methodsFor: 'initialization' stamp: 'tp 9/21/2023 13:54:38'!
initializeSobreSuelo: capasDeSueloAExcavarInicialmente

	capasDeSueloDebajo := capasDeSueloAExcavarInicialmente.
	vecesQueGolpeoCapaActual := 0.
	container := OrderedCollection new.
	mechaPuesta := MechaNoPuesta new! !


!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:17:21'!
capaDeSueloInmediata
	^capasDeSueloDebajo first! !

!Perforadora methodsFor: 'accessing' stamp: 'tp 9/21/2023 13:54:55'!
conMechaRota

	^mechaPuesta tengoMechaRota ! !

!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 21:12:20'!
elementsInContainer
	^container asArray! !

!Perforadora methodsFor: 'accessing' stamp: 'tp 9/21/2023 14:29:02'!
sinMecha

	^mechaPuesta isKindOf: MechaNoPuesta! !


!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:17'!
sobreSueloArenoso
	^capasDeSueloDebajo first esArenoso! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:16:14'!
sobreSueloConcreto
	^capasDeSueloDebajo first esConcreto! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:58'!
sobreSueloTierra
	^capasDeSueloDebajo first esTierra! !


!Perforadora methodsFor: 'colocar mecha' stamp: 'tp 9/21/2023 14:25:19'!
ponerMechaDiamante
	mechaPuesta := MechaDiamante new! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'tp 9/21/2023 14:25:28'!
ponerMechaSoft
	mechaPuesta := MechaSoft new! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'tp 9/21/2023 14:25:37'!
ponerMechaWidia
	mechaPuesta := MechaWidia new! !


!Perforadora methodsFor: 'scan' stamp: 'tp 9/21/2023 14:39:23'!
calcularProfundidadDelSuelo
	
	^ capasDeSueloDebajo sum: [:unaCapaDeSuelo | unaCapaDeSuelo altura]
	
	 ! !

!Perforadora methodsFor: 'scan' stamp: 'tp 9/21/2023 14:48:51'!
calcularProfundidadDelSueloHasta: tipoDeCapa
	
	| valorDeLaCapaDeSuelo |
	
	valorDeLaCapaDeSuelo := tipoDeCapa scan.
	
	^ capasDeSueloDebajo 
		inject: 0
		into: [:profundidadAcumulada :unaCapaDeSuelo |
			unaCapaDeSuelo scan = valorDeLaCapaDeSuelo ifTrue: [^profundidadAcumulada ].
			profundidadAcumulada + unaCapaDeSuelo altura
			].
	
	 ! !

!Perforadora methodsFor: 'scan' stamp: 'tp 9/21/2023 14:50:49'!
contarCapas: tipoDeCapa
	
	"Cuenta las capas de tipo tipoDeCapa. Recordar que para identificar cada capa se utiliza el valor de scan que retorna. Por ej. un capa tipo Arenoso retorna 7 al scan"
	
	| valorDeLaCapaDeSuelo |
	
	valorDeLaCapaDeSuelo :=  tipoDeCapa scan.
	
	^ capasDeSueloDebajo count: [:unaCapaDeSuelo | unaCapaDeSuelo scan = valorDeLaCapaDeSuelo ]! !


!Perforadora methodsFor: 'mecha/suelo resultados' stamp: 'tp 9/21/2023 14:23:31'!
alDarGolpeSeAtraviesaLaCapa

	^ self pasarAProximaCapa ! !

!Perforadora methodsFor: 'mecha/suelo resultados' stamp: 'tp 9/21/2023 14:03:46'!
alDarGolpeSeRompeLaMecha

	mechaPuesta := MechaRota new.
	self error: self descripcionErrorAlRomperseLaMecha 
	! !

!Perforadora methodsFor: 'mecha/suelo resultados' stamp: 'tp 9/21/2023 14:16:42'!
darGolpeEnSueloConcretoConDiamante

	vecesQueGolpeoCapaActual even ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
	capasDeSueloDebajo first sinResistencia ifTrue: [ ^self transformarCapaEnArenoso].
	^vecesQueGolpeoCapaActual! !

!Perforadora methodsFor: 'mecha/suelo resultados' stamp: 'tp 9/21/2023 14:17:46'!
darGolpeEnSueloConcretoConWidia

	vecesQueGolpeoCapaActual = 3 ifTrue: [self alDarGolpeSeRompeLaMecha ].
	^ self! !

!Perforadora methodsFor: 'mecha/suelo resultados' stamp: 'tp 9/21/2023 14:22:49'!
darGolpeEnSueloTierraConWidia
	 
	vecesQueGolpeoCapaActual = 2 ifTrue: [ ^self transformarCapaEnArenoso ].
	^self ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Perforadora class' category: 'ISW1-2023-1C-Parcial-1'!
Perforadora class
	instanceVariableNames: ''!

!Perforadora class methodsFor: 'instance creation' stamp: 'tp 9/21/2023 16:10:46'!
sobreSuelo: capasDeSueloAExcavar 
	
	self assertSueloValido: capasDeSueloAExcavar .

	^self new initializeSobreSuelo: capasDeSueloAExcavar ! !


!Perforadora class methodsFor: 'assertions' stamp: 'tp 9/21/2023 16:14:09'!
assertSueloValido: capasDeSueloAExcavar

	capasDeSueloAExcavar 
		withNextDo: [:unaCapa :unaCapaSiguiente |
					unaCapa = unaCapaSiguiente ifTrue: [
							self error: self capasContiguasIgualesErrorDescription
						]
					]! !

!Perforadora class methodsFor: 'assertions' stamp: 'tp 9/21/2023 16:14:34'!
capasContiguasIgualesErrorDescription

	^ 'No puede haber 2 capas contiguas iguales'! !
