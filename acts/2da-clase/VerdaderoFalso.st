!classDefinition: #Falso category: 'VerdaderoFalso'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'VerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: 'VerdaderoFalso'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'operaciones' stamp: 'tp 8/17/2023 21:03:00'!
no
	^ Verdadero ! !

!Falso class methodsFor: 'operaciones' stamp: 'tp 8/17/2023 21:08:01'!
o: unBooleano
	^ unBooleano! !

!Falso class methodsFor: 'operaciones' stamp: 'tp 8/17/2023 21:06:02'!
y: unBooleano
	^ Falso! !


!Falso class methodsFor: 'evaluaciones' stamp: 'tp 8/17/2023 21:22:48'!
siEsFalso: aClosure 
	^aClosure value! !

!Falso class methodsFor: 'evaluaciones' stamp: 'tp 8/17/2023 21:23:51'!
siEsVerdadero: aClosure
	^self! !


!classDefinition: #Verdadero category: 'VerdaderoFalso'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'VerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: 'VerdaderoFalso'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'operaciones' stamp: 'tp 8/17/2023 21:01:28'!
no
	^ Falso ! !

!Verdadero class methodsFor: 'operaciones' stamp: 'tp 8/17/2023 21:07:12'!
o: unBooleano
	^ Verdadero! !

!Verdadero class methodsFor: 'operaciones' stamp: 'tp 8/17/2023 21:04:32'!
y: unBooleano
	^ unBooleano ! !


!Verdadero class methodsFor: 'evaluaciones' stamp: 'tp 8/17/2023 21:25:59'!
siEsFalso: aClosure 
	^self! !

!Verdadero class methodsFor: 'evaluaciones' stamp: 'tp 8/17/2023 21:11:12'!
siEsVerdadero: aClosure
	aClosure value! !


!classDefinition: #VerdaderoFalsoTest category: 'VerdaderoFalso'!
DenotativeObject subclass: #VerdaderoFalsoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'VerdaderoFalso'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VerdaderoFalsoTest class' category: 'VerdaderoFalso'!
VerdaderoFalsoTest class
	instanceVariableNames: ''!

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:02:27'!
test01noVerdaderoFalso
	Assert that: Verdadero no isEqualTo: Falso! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:02:27'!
test02noFalsoVerdadero
	Assert that: Falso no isEqualTo: Verdadero ! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:04:04'!
test03VerdaderoYFalso
	Assert  that: (Verdadero y:Falso) isEqualTo: Falso! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:05:01'!
test04VerdaderoYVerdadero
	Assert  that: (Verdadero y:Verdadero) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:06:11'!
test05FalsoYVerdadero
	Assert  that: (Falso y: Verdadero ) isEqualTo: Falso! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:06:52'!
test06VerdaderoOFalso
	Assert  that: (Verdadero o: Falso ) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:07:42'!
test07FalsoOVerdadero
	Assert  that: (Falso o: Verdadero) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:12:29'!
test08SiEsVerdaderoVerdadero
	Assert  that: (Verdadero siEsVerdadero: [Falso no] ) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:22:12'!
test09SiEsFalsoFalso
	Assert  that: (Falso siEsFalso: [Falso no] ) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:25:44'!
test101SiEsFalsoVerdadero
	Assert  that: (Verdadero siEsFalso: [Verdadero no] ) isEqualTo: Verdadero! !

!VerdaderoFalsoTest class methodsFor: 'tests' stamp: 'tp 8/17/2023 21:23:32'!
test10SiEsVerdaderoFalso
	Assert  that: (Falso siEsVerdadero: [Falso no] ) isEqualTo: Falso! !
