!classDefinition: #I category: 'Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'Auxiliares' stamp: 'tp 8/28/2023 12:19:14'!
esMayorA: aNaturalNumber
	
	^ False
! !

!I class methodsFor: 'Auxiliares' stamp: 'tp 8/28/2023 13:05:34'!
esMenorA: aNaturalNumber
	
	^ True
! !

!I class methodsFor: 'Auxiliares' stamp: 'tp 8/28/2023 11:48:06'!
multiplicateA: aNaturalNumber

	^ aNaturalNumber! !


!I class methodsFor: 'Operadores' stamp: 'tp 8/28/2023 11:39:13'!
* aNaturalNumber

	^ aNaturalNumber! !

!I class methodsFor: 'Operadores' stamp: 'ma 8/24/2023 21:02:24'!
+ aNaturalNumber

	^aNaturalNumber next! !

!I class methodsFor: 'Operadores' stamp: 'tp 8/28/2023 12:12:54'!
< aNaturalNumber
	
	^ aNaturalNumber esMayorA: self
! !

!I class methodsFor: 'Operadores' stamp: 'ma 8/24/2023 20:31:38'!
next
	^II! !


!classDefinition: #II category: 'Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Peano'!
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


!II class methodsFor: 'Operaciones' stamp: 'tp 8/28/2023 11:41:14'!
* aNaturalNumber

	^ aNaturalNumber  multiplicateA: self! !

!II class methodsFor: 'Operaciones' stamp: 'ma 8/24/2023 21:16:51'!
+ aNaturalNumber
	^ self previous + aNaturalNumber next! !

!II class methodsFor: 'Operaciones' stamp: 'ma 8/24/2023 21:41:21'!
- aNaturalNumber
        
	aNaturalNumber = I ifTrue: [^self previous].
	^ self previous - aNaturalNumber previous 
	! !

!II class methodsFor: 'Operaciones' stamp: 'tp 8/28/2023 12:14:21'!
< aNaturalNumber

	^ aNaturalNumber esMayorA: self previous! !

!II class methodsFor: 'Operaciones' stamp: 'ma 8/24/2023 21:19:45'!
next
	next ifNotNil: [^next].
	next:= self cloneNamed: self name, 'I'.
	next previous: self.
	^next.! !

!II class methodsFor: 'Operaciones' stamp: 'ma 8/24/2023 21:21:58'!
previous
	^previous! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'tp 8/28/2023 13:27:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := I.! !

II initializeAfterFileIn!