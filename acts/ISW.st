!classDefinition: #XXX category: 'ISW'!
Object subclass: #XXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW'!

!XXX methodsFor: 'as yet unclassified' stamp: 'Pedro 8/31/2023 21:48:33'!
extractVowels

	^'asldbeeasihdbasibdlasd' select: [:char | char isVowel]		! !

!XXX methodsFor: 'as yet unclassified' stamp: 'Pedro 8/31/2023 21:24:20'!
findDoubles

        | elements |

        elements:= #(1 2 5 6 9).

	^elements collect: [:element | element * 2]! !

!XXX methodsFor: 'as yet unclassified' stamp: 'Pedro 8/31/2023 21:29:53'!
findFirstEven

        | elements |

        elements:= #(1 2 5 6 9).

	^elements detect: [:element | element even] "no es polimorfico, no devuelve de la misma clase
										ademas puede no encontrar"! !

!XXX methodsFor: 'as yet unclassified' stamp: 'Pedro 8/31/2023 21:36:09'!
findFirstEvenWithoutMatching

        | elements |

        elements:= #(1  5  9).

	^elements detect: [:element | element even] ifNone: [self error: 'no hay pares']! !

!XXX methodsFor: 'as yet unclassified' stamp: 'Pedro 8/31/2023 21:36:56'!
findFirstEvenWithoutMatchingReturnString

        | elements |

        elements:= #(1  5  9).

	^elements detect: [:element | element even] ifNone: ['no hay pares']! !

!XXX methodsFor: 'as yet unclassified' stamp: 'Pedro 8/31/2023 20:50:21'!
findOddsPart0

        | elements index odds |

        elements:= #(1 2 5 6 9).

        odds := OrderedCollection new.
        index := 1.

        [index <= elements size]
        whileTrue: [
                ((elements at: index) odd) ifTrue: [odds add: (elements at: index)].
                index := index +1.
                ].
        ^odds! !

!XXX methodsFor: 'as yet unclassified' stamp: 'Pedro 8/31/2023 21:06:26'!
findOddsPart1

        | elements odds |

        elements:= #(1 2 5 6 9).

        odds := OrderedCollection new.

	elements do: [:unEntero | unEntero odd ifTrue: [odds add: unEntero]].
	
        ^odds! !

!XXX methodsFor: 'as yet unclassified' stamp: 'Pedro 8/31/2023 21:15:13'!
findOddsPart2

        | elements |

        elements:= #(1 2 5 6 9).

	^elements select: [:element | element odd]! !

!XXX methodsFor: 'as yet unclassified' stamp: 'Pedro 8/31/2023 21:46:37'!
sumElementsInjecting

        | elements |

        elements:= #(1  5  9).

	^elements inject: 0 into: [:sum :element | sum + element] "devuelve el resultado de la ultima inyeccion, no necesita   tener elementos "					! !
