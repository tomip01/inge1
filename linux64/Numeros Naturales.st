!classDefinition: #I category: 'Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'Auxiliares' stamp: 'tp 8/29/2023 00:04:54'!
esMayorA: aNaturalNumber
	
	^ false
! !

!I class methodsFor: 'Auxiliares' stamp: 'tp 8/29/2023 00:16:22'!
esMenorA: aNaturalNumber
	aNaturalNumber = I ifTrue: [^false].
	^ true
! !

!I class methodsFor: 'Auxiliares' stamp: 'tp 8/28/2023 11:48:06'!
multiplicateA: aNaturalNumber

	^ aNaturalNumber! !

!I class methodsFor: 'Auxiliares' stamp: 'tp 8/28/2023 21:51:47'!
restateA: aNaturalNumber

	^ aNaturalNumber previous! !


!I class methodsFor: 'Operadores' stamp: 'tp 8/28/2023 11:39:13'!
* aNaturalNumber

	^ aNaturalNumber! !

!I class methodsFor: 'Operadores' stamp: 'ma 8/24/2023 21:02:24'!
+ aNaturalNumber

	^aNaturalNumber next! !

!I class methodsFor: 'Operadores' stamp: 'tp 8/28/2023 21:43:47'!
- aNaturalNumber

	^ self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'Operadores' stamp: 'tp 8/28/2023 21:46:36'!
/ aNaturalNumber
	aNaturalNumber = I  ifTrue: [ ^ I]. 
	^ self error:  self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.! !

!I class methodsFor: 'Operadores' stamp: 'tp 8/28/2023 12:12:54'!
< aNaturalNumber
	
	^ aNaturalNumber esMayorA: self
! !

!I class methodsFor: 'Operadores' stamp: 'ma 8/24/2023 20:31:38'!
next
	^II! !


!I class methodsFor: 'errores' stamp: 'tp 8/28/2023 21:46:55'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor'! !

!I class methodsFor: 'errores' stamp: 'tp 8/28/2023 21:44:10'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^ 'No se puede tener numeros negativos en los naturales'! !


!classDefinition: #II category: 'Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'Auxiliares' stamp: 'tp 8/28/2023 13:08:38'!
esMayorA: aNaturalNumber

	^ aNaturalNumber esMenorA: self previous! !

!II class methodsFor: 'Auxiliares' stamp: 'tp 8/28/2023 13:07:14'!
esMenorA: aNaturalNumber

	^ aNaturalNumber esMayorA: self previous! !

!II class methodsFor: 'Auxiliares' stamp: 'tp 8/28/2023 11:46:18'!
multiplicateA: aNaturalNumber

	^ (aNaturalNumber * self previous) + aNaturalNumber! !

!II class methodsFor: 'Auxiliares' stamp: 'ma 8/24/2023 21:26:29'!
previous: aNaturalNumber
	previous:= aNaturalNumber! !

!II class methodsFor: 'Auxiliares' stamp: 'tp 8/28/2023 21:48:41'!
restateA: aNaturalNumber

	^aNaturalNumber previous - self previous ! !


!II class methodsFor: 'Operaciones' stamp: 'tp 8/28/2023 11:41:14'!
* aNaturalNumber

	^ aNaturalNumber  multiplicateA: self! !

!II class methodsFor: 'Operaciones' stamp: 'ma 8/24/2023 21:16:51'!
+ aNaturalNumber
	^ self previous + aNaturalNumber next! !

!II class methodsFor: 'Operaciones' stamp: 'tp 8/28/2023 21:48:02'!
- aNaturalNumber
        
	^ aNaturalNumber  restateA: self.
	! !

!II class methodsFor: 'Operaciones' stamp: 'tp 8/28/2023 22:00:17'!
/ aNaturalNumber
	self < aNaturalNumber ifTrue: [^self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	self = aNaturalNumber ifTrue: [^I].
	^ I + ((self-aNaturalNumber) / aNaturalNumber)! !

!II class methodsFor: 'Operaciones' stamp: 'tp 8/28/2023 12:14:21'!
< aNaturalNumber

	^ aNaturalNumber esMayorA: self previous! !

!II class methodsFor: 'Operaciones' stamp: 'tp 8/28/2023 23:56:37'!
next
	next ifNotNil: [^next].
	next:= II createChildNamed: self name, 'I'.
	next previous: self.
	^next.! !

!II class methodsFor: 'Operaciones' stamp: 'ma 8/24/2023 21:21:58'!
previous
	^previous! !


!II class methodsFor: 'errores' stamp: 'tp 8/28/2023 23:58:06'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un numero mayor al actual'! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'tp 8/29/2023 00:17:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Numeros Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'tp 8/29/2023 00:17:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Numeros Naturales'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Numeros Naturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: '--** private fileout/in **--' stamp: 'tp 8/29/2023 00:17:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!