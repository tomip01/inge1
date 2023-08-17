!classDefinition: #Bill category: '3eraAct'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3eraAct'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: '3eraAct'!
Bill class
	instanceVariableNames: 'energia'!

!Bill class methodsFor: 'consultas y acciones' stamp: 'tp 8/17/2023 14:28:25'!
camina: unaCantidadDeKilometros
	| energiaGastada|
	energiaGastada := unaCantidadDeKilometros days + 3 days.
	"ver que no sea negativo"
	energia := energia - energiaGastada. 
	! !

!Bill class methodsFor: 'consultas y acciones' stamp: 'tp 8/17/2023 14:17:45'!
come: unaCantidadDeKilosDeCerebro
	energia := 4 days * unaCantidadDeKilosDeCerebro + energia! !

!Bill class methodsFor: 'consultas y acciones' stamp: 'tp 8/17/2023 14:14:49'!
energia
	^energia! !


!Bill class methodsFor: '--** private fileout/in **--' stamp: 'tp 8/17/2023 14:29:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := (Duration seconds: 4147200 nanoSeconds: 0).! !

Bill initializeAfterFileIn!