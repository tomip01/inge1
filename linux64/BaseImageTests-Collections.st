!classDefinition: #BagTest category: 'BaseImageTests-Collections'!
TestCase subclass: #BagTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!BagTest methodsFor: 'tests' stamp: 'jmv 11/2/2022 15:11:59'!
testProduct

	| bag |	
	bag _ Bag new.
	bag add: 3; add: 4; add: 4; add: 5.
	self assert: (bag product: [ :v | v ]) = 240.
	self assert: (bag product: [ :v | v-1 ]) = 72.! !

!BagTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:00:47'!
testSumIfEmptyEvalsIfEmptyBlockWhenEmpty

	self assert: (Bag new sum: [:each | 1 ] ifEmpty: [ 'empty' ]) equals: 'empty'.! !

!BagTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:00:58'!
testSumIfEmptyEvalsSumBlockForEachElementSumingTheResult

	| bag |
	
	bag := Bag new.
	bag add: 'hello'; add: 'hello'.
	bag add: 'bye'.
	
	self assert: (bag sum: [ :aString | aString = 'hello' ifTrue: [ 2 ] ifFalse: [ -1 ]] ifEmpty: [ self fail ]) equals: 3.! !


!classDefinition: #BinarySearchTest category: 'BaseImageTests-Collections'!
TestCase subclass: #BinarySearchTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!BinarySearchTest methodsFor: 'testing' stamp: 'sqr 5/25/2016 14:36'!
testquickFindFirst

	| collection |
	collection := 1000 to: 2100.
	collection withIndexDo:
		[:eachElement :eachIndex |
			self assert: (collection quickFindFirst: [:one | one >= eachElement]) = eachIndex.
			self assert: (collection quickFindFirst: [:one | one >= (eachElement - 0.5)]) = eachIndex
		].
	self assert: (collection quickFindFirst: [:one | one > 2101]) = 0! !

!BinarySearchTest methodsFor: 'testing' stamp: 'sqr 5/25/2016 14:36'!
testquickFindLast

	| collection |
	collection := 1000 to: 2100.
	collection withIndexDo:
		[:eachElement :eachIndex |
			self assert: (collection quickFindLast: [:one | one <= eachElement]) = eachIndex.
			self assert: (collection quickFindLast: [:one | one <= (eachElement + 0.5)]) = eachIndex
		].
	self assert: (collection quickFindLast: [:one | one < 0]) = 0! !

!BinarySearchTest methodsFor: 'testing' stamp: 'sqr 5/25/2016 14:46'!
testquickIndexOf

	| collection |
	collection := 1000 to: 2100.
	collection withIndexDo:
		[:eachElement :eachIndex |
			self assert: (collection quickIndexOf: eachElement) = eachIndex
		].
	self assert: (collection quickIndexOf: 999) = 0.
	self assert: (collection quickIndexOf: 2101) = 0! !

!BinarySearchTest methodsFor: 'testing' stamp: 'sqr 5/25/2016 15:01'!
testquickIndexOfWithSemistableOrder

	| collection |
	collection := SortedCollection
		sortBlock: [:x :y | x key <= y key].
	1 to: 1000 do: [:each | collection add: each -> each].
	1 to: 50 do: [:each | collection add: 42 -> each].
	self assert: (collection quickIndexOf: 42 -> 6) = 48! !


!classDefinition: #CollectTest category: 'BaseImageTests-Collections'!
TestCase subclass: #CollectTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!CollectTest methodsFor: 'testing' stamp: 'jmv 11/30/2014 11:34'!
testIdentitySet
	"
	CollectTest  new testIdentitySet
	"
	| col result |
	col _ #(1 2 3 1.0 2.0 3.0) asIdentitySet.
	result _ col collect: [ :elem |  elem yourself ].
	self assert: result class = IdentitySet.
	self assert: result = #(1 2 3 1.0 2.0 3.0) asIdentitySet.
	self assert: result = col! !

!CollectTest methodsFor: 'testing' stamp: 'jmv 11/30/2014 10:51'!
testOrderedCollection
	"
	CollectTest  new testOrderedCollection
	"
	| col result |
	col _ #(1 2 3 4 5) asOrderedCollection.
	result _ col collect: [ :elem |  elem * 2 ].
	self assert: result class = OrderedCollection.
	self assert: result = #(2 4 6 8 10) asOrderedCollection! !

!CollectTest methodsFor: 'testing' stamp: 'jmv 11/30/2014 11:34'!
testSet
	"
	CollectTest  new testSet
	"
	| col result |
	col _ #(1 2 3 1.0 2.0 3.0) asSet.
	result _ col collect: [ :elem |  elem yourself ].
	self assert: result class = Set.
	self assert: result = #(1 2 3) asSet.
	self assert: result = col! !

!CollectTest methodsFor: 'testing' stamp: 'jmv 11/30/2014 11:01'!
testSortedCollection
	"
	CollectTest  new testSortedCollection
	"
	| col result |
	col _ #(1 2 3 4 5) asSortedCollection: [ :a :b | a > b ].
	result _ col collect: [ :elem |  elem * 2 ].
	self assert: result class = OrderedCollection.
	self assert: result = #(10 8 6 4 2) asOrderedCollection! !


!classDefinition: #CollectionTest category: 'BaseImageTests-Collections'!
TestCase subclass: #CollectionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!CollectionTest methodsFor: 'groupBy tests' stamp: 'jmv 7/31/2023 12:01:40'!
testGroupByHavingSelectsTheResultOfGroupBy

	| collectionToGroupBy groupedByEven |
	
	collectionToGroupBy := OrderedCollection with: 1 with: 2 with: 3 with: 4 with: 5.
	groupedByEven := collectionToGroupBy groupBy: [ :anInteger | anInteger even ] having: [ :group | group size > 2 ].
	
	self assert: (groupedByEven size) equals: 1.	
	self assert: (collectionToGroupBy select: [ :anInteger | anInteger odd ]) equals: (groupedByEven at: false).! !

!CollectionTest methodsFor: 'groupBy tests' stamp: 'jmv 7/31/2023 12:01:59'!
testGroupByReturnsADictionaryThatGroupsACollectionByThePluggableKey

	| collectionToGroupBy groupedByEven |
	
	collectionToGroupBy := OrderedCollection with: 1 with: 2 with: 3 with: 4 with: 5.
	groupedByEven := collectionToGroupBy groupBy: [ :anInteger | anInteger even ].
	
	self assert: groupedByEven size equals: 2.
	self assert: (collectionToGroupBy select: [ :anInteger | anInteger even ]) equals: (groupedByEven at: true).
	self assert:(collectionToGroupBy select: [ :anInteger | anInteger odd ]) equals: (groupedByEven at: false).! !


!CollectionTest methodsFor: 'average tests' stamp: 'HAW 11/17/2018 11:45:15'!
testAverageFailsWhenTheCollectionIsEmpty

	self 
		should: [ #() average: [ :each | each ] ]
		raise: Error 
		description: Collection emptyCollectionDescription! !

!CollectionTest methodsFor: 'average tests' stamp: 'HAW 11/17/2018 11:45:19'!
testAverageIfEmptyCalculatesItAsUsualWhenTheCollectionIsNotEmpty

	| someNumbers |
	
	someNumbers _ #(1 5).

	self 
		assert: (someNumbers average: [ :each | each ] ifEmpty: [ self fail ])
		equals: someNumbers average! !

!CollectionTest methodsFor: 'average tests' stamp: 'HAW 11/17/2018 11:45:22'!
testAverageIfEmptyEvaluatesEmptyBlockWhenTheCollectionIsEmpty

	| emptyBlock |
	
	emptyBlock _ [ 0 ].

	self 
		assert: (#() average: [ :each | each asInteger ] ifEmpty: emptyBlock)
		equals: emptyBlock value! !

!CollectionTest methodsFor: 'average tests' stamp: 'jmv 1/6/2021 11:57:27'!
testsAverageWorksWithABlock

	self assert: ({ '1' . '2' . '3' } average: [ :each | each asNumber ]) equals: 2! !


!CollectionTest methodsFor: 'as comma separated tests' stamp: 'HAW 3/6/2019 15:11:08'!
assertAsCommaSeparated: aCollection equals: expectedString 
	
	self 
		assert: (String streamContents: [ :stream | aCollection asCommaSeparated: [ :elem | stream print: elem + 1] on: stream ])
		equals: expectedString! !

!CollectionTest methodsFor: 'as comma separated tests' stamp: 'HAW 3/6/2019 15:12:31'!
testAsCommaSeparatedOnWorksAsCommaStringAnd

	self assertAsCommaSeparated: #() equals: ''. 
	self assertAsCommaSeparated: #(1) equals: '2'.
	self assertAsCommaSeparated: #(1 2) equals: '2 and 3'. 
	self assertAsCommaSeparated: #(1 2 3) equals: '2, 3 and 4'.! !

!CollectionTest methodsFor: 'as comma separated tests' stamp: 'HAW 3/6/2019 15:11:51'!
testAsCommaStringAndDoesNotAddAnythingWhenEmpty

	self assert: #() asCommaStringAnd isEmpty ! !

!CollectionTest methodsFor: 'as comma separated tests' stamp: 'HAW 3/6/2019 15:11:59'!
testAsCommaStringAndDoesNotAddAnythingWhenHasOneElement

	self assert: #(1) asCommaStringAnd equals: '1' ! !

!CollectionTest methodsFor: 'as comma separated tests' stamp: 'HAW 3/6/2019 15:12:06'!
testAsCommaStringAndSeparatesWithAndWhenTwoOneElements

	self assert: #(1 2) asCommaStringAnd equals: '1 and 2' ! !

!CollectionTest methodsFor: 'as comma separated tests' stamp: 'HAW 3/6/2019 15:12:21'!
testAsCommaStringAndSeparatesWithCommaButLastOneWithAndWhenMoreThanTwoElements

	self assert: #(1 2 3) asCommaStringAnd equals: '1, 2 and 3' ! !


!CollectionTest methodsFor: 'flatten tests' stamp: 'jmv 7/31/2023 12:02:25'!
testItMaintainsTheSameCollectionSpecies

	self assert: (OrderedCollection with: 1 with: #(2)) flatten equals: (OrderedCollection with: 1 with: 2).! !

!CollectionTest methodsFor: 'flatten tests' stamp: 'jmv 7/31/2023 12:02:53'!
testWhenCollectionContainsASingleLevelOfElementsItReturnsTheSameCollection

	self assert: #(1 2 3) flatten equals: #(1 2 3).! !

!CollectionTest methodsFor: 'flatten tests' stamp: 'jmv 7/31/2023 12:03:14'!
testWhenCollectionContainsMoreThanTwoLevelsltReturnsTheElementsOfAllNestedCollections

	self assert: #(1 #(2 3) #(4 #(5))) flatten equals: #(1 2 3 4 5).! !

!CollectionTest methodsFor: 'flatten tests' stamp: 'jmv 7/31/2023 12:03:38'!
testWhenCollectionContainsStringCollectionsItDoesNotFlattenTheStrings

	self assert: #('string1' #('string2' 'string3')) flatten equals: #('string1' 'string2' 'string3').! !

!CollectionTest methodsFor: 'flatten tests' stamp: 'jmv 7/31/2023 12:03:59'!
testWhenCollectionContainsStringsItReturnsTheSameCollection

	self assert: #('string1' 'string2' 'string3') flatten equals: #('string1' 'string2' 'string3').! !

!CollectionTest methodsFor: 'flatten tests' stamp: 'jmv 7/31/2023 12:04:18'!
testWhenCollectionContainsTwoLevelsOfElementsItReturnsTheElementsOfAllNestedCollections
	
	self assert: #(#(1) #(2 3)) flatten equals: #(1 2 3).! !

!CollectionTest methodsFor: 'flatten tests' stamp: 'jmv 7/31/2023 12:04:27'!
testWhenCollectionIsEmptyItReturnsTheSameCollection

	self assert: #() flatten equals: #().! !


!CollectionTest methodsFor: 'misc tests' stamp: 'jpb 8/2/2019 23:18:50'!
testIsCollection
	self assert: (Bag new is: #Collection).! !

!CollectionTest methodsFor: 'misc tests' stamp: 'jmv 6/12/2019 18:22:57'!
testSetEquality
	self assert: Set new = IdentitySet new.
	self assert: Set new hash = IdentitySet new hash.
	self assert: Dictionary new = IdentityDictionary new.
	self assert: Dictionary new hash = IdentityDictionary new hash.
	self assert: Dictionary new = OrderedDictionary new.
	self assert: Dictionary new hash = OrderedDictionary new hash.
	self assert: IdentityDictionary new = OrderedDictionary new.
	self assert: IdentityDictionary new hash = OrderedDictionary new hash.

	self deny: Set new = Dictionary new! !


!classDefinition: #DictionaryTest category: 'BaseImageTests-Collections'!
TestCase subclass: #DictionaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!DictionaryTest methodsFor: 'tests' stamp: 'jpb 8/2/2019 23:17:49'!
testIsCollection
	self assert: (Dictionary new is: #Collection)! !

!DictionaryTest methodsFor: 'tests' stamp: 'HAW 4/4/2019 08:18:05'!
testKeyNotFoundSignalTheRightMessage

	self 
		should: [ Dictionary new errorKeyNotFound ]
		raise: Error
		withMessageText: Dictionary keyNotFoundErrorDescription ! !


!classDefinition: #IntervalTest category: 'BaseImageTests-Collections'!
TestCase subclass: #IntervalTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!IntervalTest methodsFor: 'testing' stamp: 'jmv 12/18/2018 10:56:31'!
testAt
	"
	IntervalTest new testAt
	"
	self assert: (2 to: 5 by: 2) first = 2.
	self assert: ((2 to: 5 by: 2) at: 1) = 2.
	self assert: ((2 to: 5 by: 2) at: 2) = 4.
	self assert: (2 to: 5 by: 2) last = 4.

	self assert: (0 to: 2.4 by: 0.1) first = 0.
	self assert: ((0 to: 2.4 by: 0.1) at: 1) = 0.
	self assert: (((0 to: 2.4 by: 0.1) at: 2) isWithin: 1 floatsFrom: 0.1).
	self assert: (((0 to: 2.4 by: 0.1) at: 3) isWithin: 1 floatsFrom: 0.2).
	self assert: (((0 to: 2.4 by: 0.1) at: 23) isWithin: 1 floatsFrom: 2.2).
	self assert: ((0 to: 2.4 by: 0.1) at: 24) = 2.3.
	self assert: ((0 to: 2.4 by: 0.1) at: 25) = 2.4.
	self assert: (0 to: 2.4 by: 0.1) last = 2.4.! !

!IntervalTest methodsFor: 'testing' stamp: 'jmv 12/18/2018 10:56:59'!
testFloatInterval
	"
	IntervalTest new testFloatInterval
	"
	
	self assert: (0 to: 2.4 by: 0.1) size = 25.
	self assert: (0 to: 2.4 by: 0.1) first = 0.
	self assert: (0 to: 2.4 by: 0.1) last = 2.4.

	2 to: 200 do: [ :n |
		self assert: (0.0 to: 1.0 count: n) size = n.
		self assert: (0.0 to: 1.0 count: n) first = 0.0.
		self assert: ((0.0 to: 1.0 count: n) last isWithin: 1 floatsFrom: 1.0)].
	2 to: 200 do: [ :n |
		self assert: (1.0 to: 0.0 count: n) size = n.
		self assert: (1.0 to: 0.0 count: n) first = 1.0.
		self assert: ((1.0 to: 0.0 count: n) last isWithin: 1 floatsFrom: 0.0)].! !

!IntervalTest methodsFor: 'testing' stamp: 'HAW 3/17/2019 07:20:11'!
testFloatToByDo
	"
	IntervalTest new testFloatToByDo
	"
	| interval toByDo |

	"See comment at #to:by:do:"
	self shouldFail: [
		interval _ 0 to: 2.4 by: 0.1.
		toByDo _ Array streamContents: [ :strm |
			0 to: 2.4 by: 0.1 do: [ :each |
				strm nextPut: each ]].
		self assert: toByDo size = interval size.
		1 to: toByDo size do: [ :i |
			self assert: (toByDo at: i) = (interval at: i) ]]! !

!IntervalTest methodsFor: 'testing' stamp: 'jmv 3/27/2016 17:18'!
testIntegerInterval
	"
	IntervalTest new testIntegerInterval
	"
	| z |
	self assert: (2 to: 5 by: 2) size = 2.
	self assert: (2 to: 5 by: 2) last = 4.
	z _ 0.
	(2 to: 5 by: 2) do: [ :i | z _ i ].
	self assert: z = 4! !

!IntervalTest methodsFor: 'testing' stamp: 'jmv 4/27/2016 14:29'!
testIntegerToByDo
	"
	IntervalTest new testIntegerToByDo
	"
	| interval toByDo |
	interval _ 2 to: 5 by: 2.
	toByDo _ Array streamContents: [ :strm |
		2 to: 5 by: 2 do: [ :each |
			strm nextPut: each ]].
	self assert: toByDo size = interval size.
	1 to: toByDo size do: [ :i |
		self assert: (toByDo at: i) = (interval at: i) ]! !


!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 11:43:33'!
testDoesNotIncludeNumbersOutsideTheInInterval

	| from1To10 |
	
	from1To10 := 1 to: 10.
	
	self deny: (from1To10 includes: 0).
	self deny: (from1To10 includes: 11)! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 11:35:03'!
testDoesNotIncludeObjectsThatAreNotNumbers

	self deny: ((1 to: 10) includes: $a)! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 11:53:40'!
testDoesNotIncludedNumbersThatAreInRangeButNotReachedByTheStep

	| from1To10By2 |
	
	from1To10By2 := 1 to: 10 by: 2.
	
	self deny: (from1To10By2 includes: 0).
	self deny: (from1To10By2 includes: 2).
	self deny: (from1To10By2 includes: 6).
	self deny: (from1To10By2 includes: 10).! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 11:54:48'!
testDoesNotIncludedNumbersThatAreInRangeButNotReachedByTheStepWithReversedIntervals

	| from10To1ByMinus2 |
	
	from10To1ByMinus2 := 10 to: 1 by: -2.
	
	self deny: (from10To1ByMinus2 includes: 0).
	self deny: (from10To1ByMinus2 includes: 1).
	self deny: (from10To1ByMinus2 includes: 5).
	self deny: (from10To1ByMinus2 includes: 9).! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 11:43:03'!
testIncludedNumbersRespectAStepDifferentToOne

	| from1To10By2 |
	
	from1To10By2 := 1 to: 10 by: 2.
	
	self assert: (from1To10By2 includes: 1).
	self assert: (from1To10By2 includes: 5).
	self assert: (from1To10By2 includes: 9).! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 11:55:55'!
testIncludedNumbersRespectNegativeSteps

	| from10To1ByMinus2 |
	
	from10To1ByMinus2 := 10 to: 1 by: -2.
	
	self assert: (from10To1ByMinus2 includes: 10).
	self assert: (from10To1ByMinus2 includes: 6).
	self assert: (from10To1ByMinus2 includes: 2).! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 11:43:26'!
testIncludesNumbersInsideTheInterval

	| from1To10 |
	
	from1To10 := 1 to: 10.
	
	self assert: (from1To10 includes: 1).
	self assert: (from1To10 includes: 5).
	self assert: (from1To10 includes: 10).! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 11:43:21'!
testIncludesNumbersInsideTheIntervalEvenForReversedIntervals

	| from10To1 |
	
	from10To1 := 10 to: 1 by: -1.
	
	self assert: (from10To1 includes: 1).
	self assert: (from10To1 includes: 5).
	self assert: (from10To1 includes: 10).! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 12:01:44'!
testIntervalWithOneNumberAndNegativeStepBiggerThanOneIncludeOnlyThatNumber

	| from1To1ByMinus2 |
	
	from1To1ByMinus2 := 1 to: 1 by: -2.
	
	self assert: (from1To1ByMinus2 includes: 1).
	self deny: (from1To1ByMinus2 includes: -1).
	self deny: (from1To1ByMinus2 includes: 3).! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 12:01:54'!
testIntervalWithOneNumberAndNegativeStepIncludeOnlyThatNumber

	| from1To1ByMinus1 |
	
	from1To1ByMinus1 := 1 to: 1 by: -1.
	
	self assert: (from1To1ByMinus1 includes: 1).
	self deny: (from1To1ByMinus1 includes: 0).
	self deny: (from1To1ByMinus1 includes: 2).! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 12:00:46'!
testIntervalWithOneNumberAndStepBiggerThanOneIncludesOnlyTheNumber

	| from1To1By2 |
	
	from1To1By2 := 1 to: 1 by: 2.
	
	self assert: (from1To1By2 includes: 1).
	self deny: (from1To1By2 includes: -1).
	self deny: (from1To1By2 includes: 3).! !

!IntervalTest methodsFor: 'test - includes' stamp: 'HAW 5/2/2020 11:59:06'!
testIntervalWithOneNumberIncludesOnlyTheNumber

	| from1To1 |
	
	from1To1 := 1 to: 1.
	
	self assert: (from1To1 includes: 1).
	self deny: (from1To1 includes: 0).
	self deny: (from1To1 includes: 2).! !


!IntervalTest methodsFor: 'tests - includesAll' stamp: 'HAW 6/11/2022 20:08:15'!
testIncludesAllOfFailsWhenFirstNotIncluded

	self deny: ((3 to: 9 by: 2) includesAllOf: (1 to: 9 by: 2))! !

!IntervalTest methodsFor: 'tests - includesAll' stamp: 'HAW 6/11/2022 20:08:18'!
testIncludesAllOfFailsWhenLastNotIncluded

	self deny: ((1 to: 7 by: 2) includesAllOf: (1 to: 9 by: 2))! !

!IntervalTest methodsFor: 'tests - includesAll' stamp: 'HAW 6/11/2022 20:08:21'!
testIncludesAllOfFailsWithOtherTypeOfCollectionWhenElementNotIncluded

	self deny: ((1 to: 9 by: 2) includesAllOf: {1. 3. 5. 6. 7. 9})! !

!IntervalTest methodsFor: 'tests - includesAll' stamp: 'HAW 6/11/2022 20:08:24'!
testIncludesAllOfIntervalWithIncludedFirstLastAndDifferentIncrement

	self assert: ((1 to: 9 by: 2) includesAllOf: (3 to: 7 by: 4))! !

!IntervalTest methodsFor: 'tests - includesAll' stamp: 'HAW 6/11/2022 20:08:27'!
testIncludesAllOfIntervalWithIncludedFirstSameLastAndIncrement

	self assert: ((1 to: 10 by: 2) includesAllOf: (3 to: 10 by: 2))! !

!IntervalTest methodsFor: 'tests - includesAll' stamp: 'HAW 6/11/2022 20:08:29'!
testIncludesAllOfIntervalWithSameFirstIncrementAndIncludedLast

	self assert: ((1 to: 10 by: 2) includesAllOf: (1 to: 7 by: 2))! !

!IntervalTest methodsFor: 'tests - includesAll' stamp: 'HAW 6/11/2022 20:08:32'!
testIncludesAllOfIntervalWithSameFirstLastAndIncrement

	self assert: ((1 to: 10 by: 2) includesAllOf: (1 to: 10 by: 2))! !

!IntervalTest methodsFor: 'tests - includesAll' stamp: 'HAW 6/11/2022 20:08:35'!
testIncludesAllOfOtherTypeOfCollection

	self assert: ((1 to: 9 by: 2) includesAllOf: {1. 3. 5. 7. 9})! !


!classDefinition: #OrderedCollectionTest category: 'BaseImageTests-Collections'!
TestCase subclass: #OrderedCollectionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!OrderedCollectionTest methodsFor: 'tests' stamp: 'jpb 8/2/2019 23:18:24'!
testIsCollection
	self assert: (OrderedCollection new is: #Collection).! !

!OrderedCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:04:53'!
testStreamContentsWorksAsExpected

	| contents |
	
	contents := OrderedCollection streamContents: [ :stream | stream nextPut: 1 ].
	
	self assert: contents equals: (OrderedCollection with: 1).! !

!OrderedCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:05:11'!
testWriteStreamOnOrderedCollectionGrowsAsExpected

	| contents |
	
	contents := OrderedCollection streamContents: [ :stream | 
		1 to: 101 do: [ :aNumber | stream nextPut: aNumber ]].
	
	1 to: 101 do: [ :aNumber | self assert: (contents at: aNumber) equals: aNumber ].! !


!classDefinition: #OrderedDictionaryTest category: 'BaseImageTests-Collections'!
TestCase subclass: #OrderedDictionaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!OrderedDictionaryTest methodsFor: 'tests' stamp: 'jmv 5/25/2018 10:36:59'!
testOrder
	| data dict orderingByCollect orderingByDo orderingBySelect aux desiredOrder |

	"Test that #do:, #select: and #collect: iterate in the correct order"
	dict _ OrderedDictionary new.
	data _ self sampleData.
	desiredOrder _ data collect: [ :pair | pair second ].
	data do: [ :pair |
		dict at: pair first put: pair second ].

	orderingByDo _ Array streamContents: [ :strm | dict do: [ :each | strm nextPut: each ]].
	self assert: orderingByDo = desiredOrder.

	aux _ dict select: [ :each | true ].
	orderingBySelect _ Array streamContents: [ :strm | aux do: [ :each | strm nextPut: each ]].
	self assert: orderingBySelect = desiredOrder.

	aux _ dict collect: [ :each | each yourself ].
	orderingByCollect _ Array streamContents: [ :strm | aux do: [ :each | strm nextPut: each ]].
	self assert: orderingByCollect = desiredOrder.


	"Test that order is correct even if different. Also test alternative way to add stuff to dict."
	dict _ OrderedDictionary new.
	data _ self sampleData reversed.
	desiredOrder _ data collect: [ :pair | pair second ].
	data do: [ :pair |
		dict add: pair first -> pair second ].

	orderingByDo _ Array streamContents: [ :strm | dict do: [ :each | strm nextPut: each ]].
	self assert: orderingByDo = desiredOrder.

	aux _ dict select: [ :each | true ].
	orderingBySelect _ Array streamContents: [ :strm | aux do: [ :each | strm nextPut: each ]].
	self assert: orderingBySelect = desiredOrder.

	aux _ dict collect: [ :each | each yourself ].
	orderingByCollect _ Array streamContents: [ :strm | aux do: [ :each | strm nextPut: each ]].
	self assert: orderingByCollect = desiredOrder.
! !

!OrderedDictionaryTest methodsFor: 'tests' stamp: 'jmv 5/25/2018 10:41:04'!
testRemove
	| data dict dataToRemove desiredOrder orderingByDo |

	"Test that #do:, #select: and #collect: iterate in the correct order"
	dict _ OrderedDictionary new.
	data _ self sampleData.
	dataToRemove _ self sampleData2.

	data do: [ :pair |
		dict at: pair first put: pair second ].
	dataToRemove do: [ :pair |
		dict removeKey: pair first ].

	orderingByDo _ Array streamContents: [ :strm | dict do: [ :each | strm nextPut: each ]].

	desiredOrder _ OrderedCollection new.
	data do: [ :pair | desiredOrder add: pair second ].
	dataToRemove do: [ :pair | desiredOrder remove: pair second ].
	
	self assert: orderingByDo = desiredOrder asArray.! !


!OrderedDictionaryTest methodsFor: 'aux' stamp: 'jmv 5/25/2018 10:16:25'!
sampleData
	^ { {1. 'uno'}. {6. 'seis'}. {8. 'ocho'}. {7. 'siete'}. {2. 'dos'}. {3. 'tres'}. {4. 'cuatro'}. {5. 'cinco'}}! !

!OrderedDictionaryTest methodsFor: 'aux' stamp: 'jmv 5/25/2018 10:16:35'!
sampleData2
	^ { {1. 'uno'}. {8. 'ocho'}. {3. 'tres'}}! !


!classDefinition: #SequenceableCollectionTest category: 'BaseImageTests-Collections'!
TestCase subclass: #SequenceableCollectionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 09:49:41'!
testCombinationsAtATimeDoShouldEvaluateBlockWithEmptyCollection
	
	| combinationWasEmpty |
	
	combinationWasEmpty := false.
	'ab' combinations: 0 atATimeDo: [ :combination | combinationWasEmpty := combination isEmpty ].
	
	self assert: combinationWasEmpty! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:05:29'!
testCombinationsAtATimeDoWorksAsExpected
	
	| combinations |
	 
	combinations := OrderedCollection new.
	'abc' combinations: 2 atATimeDo: [ :combination | combinations add: combination copy].
	
	self assert: combinations size equals: 3.
	self assert: (combinations includes: #($a $b)).
	self assert: (combinations includes: #($a $c)).
	self assert: (combinations includes: #($b $c)).! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:05:44'!
testDoSeparatedByDoesNotValueSeparatedBlockForCollectionsOfOneElement

	| collectionToTraverse traversedElements |

	collectionToTraverse := OrderedCollection with: 1.
	traversedElements := OrderedCollection new.
	self shouldntFail: [ collectionToTraverse do: [ :anElement | traversedElements add: anElement ] separatedBy: [ self fail ] ].

	self assert: traversedElements equals: collectionToTraverse.! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:06:00'!
testDoSeparatedByDoesNotValueSeparatedBlockOnLastElement

	| collectionToTraverse traversedElements |

	collectionToTraverse := OrderedCollection with: 1 with: 2.
	traversedElements := OrderedCollection new.

	self shouldntFail: [ collectionToTraverse do: [ :anElement | traversedElements add: anElement ] separatedBy: [ traversedElements add: $-] ].

	self assert: traversedElements equals: (OrderedCollection with: 1 with: $- with: 2).! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'HAW 3/17/2019 06:29:27'!
testDoSeparatedByDoesNothingForEmptyCollection

	self shouldntFail: [ #() do: [ :anElement | self fail ] separatedBy: [ self fail ] ]! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:06:15'!
testFirstAvailableReturnsAllObjectsWhenRequestedMoreThanTheSize

	self assert: (#(10 20 30) firstAvailable: 4) equals:  #(10 20 30).! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:06:30'!
testFirstAvailableReturnsAllObjectsWhenRequestedTheReceiversSize

	self assert: (#(10 20 30) firstAvailable: 3) equals: #(10 20 30).! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:06:45'!
testFirstAvailableReturnsTheFirstRequestedObjectsWhenTheyAreAvailable

	self assert: (#(10 20 30) firstAvailable: 2) equals: #(10 20).! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:06:59'!
testLastAvailableReturnsAllObjectsWhenRequestedMoreThanTheSize

	self assert: (#(10 20 30) lastAvailable: 4) equals: #(10 20 30).! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:07:16'!
testLastAvailableReturnsAllObjectsWhenRequestedTheReceiversSize

	self assert: (#(10 20 30) lastAvailable: 3) equals: #(10 20 30).! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:07:34'!
testLastAvailableReturnsTheLastRequestedObjectsWhenTheyAreAvailable

	self assert: (#(10 20 30) lastAvailable: 2) equals: #(20 30).! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:07:58'!
testWithIndexDoSeparatedByDoesNotValueSeparatedBlockForCollectionsOfOneElement

	| collectionToTraverse traversedElements |

	collectionToTraverse := OrderedCollection with: $a.
	traversedElements := OrderedCollection new.

	self shouldntFail: [ collectionToTraverse withIndexDo: [ :anElement :index | traversedElements add: anElement  -> index ] separatedBy: [ self fail ] ].

	self assert: traversedElements size equals: 1.
	self assert: traversedElements first equals: $a->1.! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:08:54'!
testWithIndexDoSeparatedByDoesNotValueSeparatedBlockOnLastElement

	| collectionToTraverse traversedElements |

	collectionToTraverse := OrderedCollection with: $a with: $b.
	traversedElements := OrderedCollection new.

	collectionToTraverse
		withIndexDo: [ :anElement :index | traversedElements add: anElement  -> index ]
		separatedBy: [ traversedElements add: $-].

	self assert: traversedElements size equals: 3.
	self assert: traversedElements first equals: $a->1.
	self assert: traversedElements second equals: $-.
	self assert: traversedElements third equals: $b->2.! !

!SequenceableCollectionTest methodsFor: 'tests' stamp: 'HAW 3/17/2019 06:30:18'!
testWithIndexDoSeparatedByDoesNothingForEmptyCollection

	self shouldntFail: [ #() withIndexDo: [ :anElement :index | self fail ] separatedBy: [ self fail ] ]! !


!classDefinition: #TextTest category: 'BaseImageTests-Collections'!
TestCase subclass: #TextTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!TextTest methodsFor: 'testing' stamp: 'jpb 8/2/2019 23:40:53'!
testIsText
	self assert: (Text new is: #Text).! !


!classDefinition: #WeakIdentitySetTest category: 'BaseImageTests-Collections'!
TestCase subclass: #WeakIdentitySetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections'!

!WeakIdentitySetTest methodsFor: 'testing' stamp: 'jmv 8/24/2012 08:24'!
test
	"
	(also tests WeakSet a bit)
	WeakIdentitySetTest new test
	"
	| ary1 ary2 count w wi |
	ary1 _ { 3@4 . 4@5 }.
	ary2 _ { 13@4 . 14@5 }.
	w _ WeakSet new.
	w addAll: ary1.
	wi _ WeakIdentitySet new.
	wi addAll: ary2.
	
	self assert: w size = 2.
	count _ 0.
	w do: [ :each |
		count _ count + 1.
		self assert: each class == Point ].
	self assert: count = 2.
	self assert: (w includes: ary1 first).
	self assert: (w includes: ary1 second).
	self assert: (w includes: 3@4).
	self assert: (w includes: 4@5).

	self assert: wi size = 2.
	count _ 0.
	wi do: [ :each |
		count _ count + 1.
		self assert: each class == Point ].
	self assert: count = 2.
	self assert: (wi includes: ary2 first).
	self assert: (wi includes: ary2 second).
	self deny: (wi includes: 13@4).
	self deny: (wi includes: 14@5).

	"Now make one element in each disappear"
	ary1 at: 1 put: 9.
	ary2 at: 1 put: 99.
	Smalltalk garbageCollect.

	"A little weird, but yes, elements that disappeared are still counted, but NOT iterated!!"
	self assert: w size = 2.
	count _ 0.
	w do: [ :each |
		count _ count + 1 ].
	self assert: count = 1.
	self deny: (w includes: ary1 first).
	self assert: (w includes: ary1 second).

	self assert: wi size = 2. 	"A little weird, but yes, elements that disappeared are still counted"
	count _ 0.
	wi do: [ :each |
		count _ count + 1 ].
	self assert: count = 1.
	self deny: (wi includes: ary2 first).
	self assert: (wi includes: ary2 second).! !
!classDefinition: #ArrayTest category: 'BaseImageTests-Collections-Arrayed'!
TestCase subclass: #ArrayTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections-Arrayed'!

!ArrayTest methodsFor: 'test - insert:ShiftingRight:' stamp: 'HAW 12/20/2018 14:41:00'!
testCanNotInsertShiftingRightWhenInsertionPointIsBiggerThanSize

	| arrayToInsertTo invalidIndex |
	
	arrayToInsertTo := #(1 2 3) copy.
	invalidIndex := arrayToInsertTo size + 1.
	
	self 
		should: [ arrayToInsertTo insert: 0 shiftingRightAt: invalidIndex ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: (Object errorDescriptionForSubcriptBounds: invalidIndex).
			self assert: arrayToInsertTo equals: #(1 2 3) ].! !

!ArrayTest methodsFor: 'test - insert:ShiftingRight:' stamp: 'HAW 12/20/2018 14:39:47'!
testCanNotInsertShiftingRightWhenInsertionPointIsLessThanOne

	| arrayToInsertTo invalidIndex |
	
	arrayToInsertTo := #(1 2 3) copy.
	invalidIndex := 0.
	
	self 
		should: [ arrayToInsertTo insert: 0 shiftingRightAt: invalidIndex ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: (Object errorDescriptionForSubcriptBounds: invalidIndex).
			self assert: arrayToInsertTo equals: #(1 2 3) ].! !

!ArrayTest methodsFor: 'test - insert:ShiftingRight:' stamp: 'HAW 12/20/2018 14:27:08'!
testInsertShiftingRightLoosesLastElementAndKeepsPreviousOnes

	self assert: (#(1 3 4 5) copy insert: 2 shiftingRightAt: 2) equals: #(1 2 3 4)! !

!ArrayTest methodsFor: 'test - insert:ShiftingRight:' stamp: 'HAW 12/20/2018 14:27:21'!
testInsertShiftingRightReplacesElementWhenSizeIsOne

	self assert: (#(1) copy insert: 2 shiftingRightAt: 1) equals: #(2)! !

!ArrayTest methodsFor: 'test - insert:ShiftingRight:' stamp: 'HAW 12/20/2018 14:28:20'!
testInsertShiftingRightReplacesLastElementWhenInsertingAtLastIndex

	self assert: (#(1 3 4 5) copy insert: 2 shiftingRightAt: 4) equals: #(1 3 4 2)! !


!ArrayTest methodsFor: 'test - testing' stamp: 'jpb 8/2/2019 22:59:46'!
testIsArray
	self assert: (#(1 2 3) is: #Array).
	self assert: (#() is: #Array).! !

!ArrayTest methodsFor: 'test - testing' stamp: 'jpb 8/2/2019 23:09:00'!
testIsCollection
	self assert: (#(1 2 3) is: #Collection).
	self assert: (#() is: #Collection).! !


!ArrayTest methodsFor: 'test - accessing' stamp: 'jmv 7/31/2023 12:09:15'!
testAntepenultimateIfAbsentReturnsAntepenultimateIfExists

	self assert: (#(1 2 3) antepenultimateIfAbsent: [ self fail ]) equals: 1.! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'jmv 7/31/2023 12:09:26'!
testAntepenultimateIfAbsentValuesIfAbsentBlockWhenNoAntepenultimate

	self assert: (#(1 2) antepenultimateIfAbsent: [ 0 ]) equals: 0.! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'jmv 7/31/2023 12:09:35'!
testAntepenultimateReturnsAntepenultimateIfExists

	self assert: #(1 2 3) antepenultimate equals: 1.! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'HAW 5/3/2020 00:49:10'!
testAntepenultimateSignalsErrorWhenCollectionIsNotBigEnough

	self
		should: [ #(1 2) antepenultimate ]
		raise: Error
		withMessageText: Collection collectionTooSmallDescription! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'jmv 7/31/2023 12:10:37'!
testLastIfEmptyReturnsLastWhenExist

	self assert: (#(1) lastIfEmpty: [ self fail ]) equals: 1.! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'jmv 7/31/2023 12:10:53'!
testLastIfEmptyValuesEmptyBlockWhenEmpty

	self assert: (#() lastIfEmpty: [ 1 ]) equals: 1.! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'HAW 5/4/2020 00:43:47'!
testLastSignalsErrorWhenEmpty

	self
		should: [ #() last ]
		raise: Error
		withMessageText: Collection emptyCollectionDescription! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'jmv 7/31/2023 12:11:01'!
testPenultimateIfAbsentReturnsPenultimateIfExists

	self assert: (#(2 3) penultimateIfAbsent: [ self fail ]) equals: 2.! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'jmv 7/31/2023 12:11:17'!
testPenultimateIfAbsentValuesIfAbsentBlockWhenNoPenultimate

	self assert: (#(1) penultimateIfAbsent: [ 2 ]) equals: 2.! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'jmv 7/31/2023 12:11:24'!
testPenultimateReturnsPenultimateIfExists

	self assert: #(2 3) penultimate equals: 2.! !

!ArrayTest methodsFor: 'test - accessing' stamp: 'HAW 5/3/2020 00:43:44'!
testPenultimateSignalsErrorWhenCollectionIsNotBigEnough

	self
		should: [ #(1) penultimate ]
		raise: Error
		withMessageText: Collection collectionTooSmallDescription! !


!classDefinition: #Float32ArrayTest category: 'BaseImageTests-Collections-Arrayed'!
TestCase subclass: #Float32ArrayTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections-Arrayed'!

!Float32ArrayTest methodsFor: 'Tests' stamp: 'jmv 9/3/2020 18:39:55'!
testIsType
	self assert: (#[1.2 2.4 3.6 ] is: #Collection).
	self assert: (#[1.2 2.4 3.6] asFloat32Array is: #Float32Array).! !

!Float32ArrayTest methodsFor: 'Tests' stamp: 'jmv 9/3/2020 18:39:53'!
testZeroArrayDividend

	self assert: #[1.2 2.4 0.0 ] asFloat32Array / #[1.2 1.2 1.2 ] asFloat32Array = #[1.0 2.0 0.0 ] asFloat32Array ! !

!Float32ArrayTest methodsFor: 'Tests' stamp: 'jmv 9/3/2020 18:40:16'!
testZeroArrayDivisor

	"Test implicit exception"
	self should: [ #[1.2 2.4 3.6 ] asFloat32Array / #[1.0 1.0 0.0 ] asFloat32Array] raise: ZeroDivide.

	"Test explicit alternative value"
	self assert: (#[1.0 2.0 3.141592 0.0] asFloat32Array divideBy: #[1.0 1.0 0.0 0.0 ] asFloat32Array ifDivisorZero: -100 ifBothZero: -200) = 
		#[1.0 2.0 -100.0 -200.0 ] asFloat32Array.

	"Test explicit exceptions"
	self should: [
		#[1.0 2.0 3.141592] asFloat32Array
			divideBy: #[1.0 1.0 0.0] 
			ifDivisorZero: [ZeroDivide signal ]
			ifBothZero: [DomainError signal ]]
		raise: ZeroDivide.
	self should: [
		#[0.0 2.0 3.141592] asFloat32Array
			divideBy: #[0.0 1.0 1.0] 
			ifDivisorZero: [ZeroDivide signal ]
			ifBothZero: [DomainError signal ]]
		raise: DomainError.

	"Test non local returns in blocks"
	self assert: self divideByArrayOne = #[0.0 2.0 3.141592] asFloat32Array.
	self assert: self divideByArrayZero = #divisionByZero.
	self assert: self divideByArrayIndeterminate = #indeterminateResult.! !

!Float32ArrayTest methodsFor: 'Tests' stamp: 'jmv 9/3/2020 18:39:33'!
testZeroDividend

	self assert: #[1.2 2.4 3.6 0.0 ] asFloat32Array / 1.2 = #[1.0 2.0 3.0 0.0 ] asFloat32Array ! !

!Float32ArrayTest methodsFor: 'Tests' stamp: 'jmv 9/3/2020 18:39:30'!
testZeroDivisor

	"Test implicit exception"
	self should: [ #[1.2 2.4 3.6 ] asFloat32Array / 0.0] raise: ZeroDivide.

	"Test explicit alternative value"
	self assert: (#[1.0 2.0 3.141592 0.0] asFloat32Array divideBy: 0.0 ifDivisorZero: -100 ifBothZero: -200) = 
		#[-100.0 -100.0 -100.0 -200.0 ] asFloat32Array.

	"Test explicit exceptions"
	self should: [
		#[1.0 2.0 3.141592] asFloat32Array
			divideBy: 0.0
			ifDivisorZero: [ZeroDivide signal ]
			ifBothZero: [DomainError signal ]]
		raise: ZeroDivide.
	self should: [
		#[0.0 2.0 3.141592] asFloat32Array
			divideBy: 0.0
			ifDivisorZero: [ZeroDivide signal ]
			ifBothZero: [DomainError signal ]]
		raise: DomainError.

	"Test non local returns in blocks"
	self assert: self divideByScalarOne = #[0.0 2.0 3.141592] asFloat32Array.
	self assert: self divideByScalarZero = #divisionByZero.
	self assert: self divideByScalarIndeterminate = #indeterminateResult.! !


!Float32ArrayTest methodsFor: 'Aux' stamp: 'jmv 9/3/2020 18:40:09'!
divideByArrayIndeterminate
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[0.0 2.0 3.141592] asFloat32Array
		divideBy: #[0.0 2.0 3.141592] asFloat32Array
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float32ArrayTest methodsFor: 'Aux' stamp: 'jmv 9/3/2020 18:40:13'!
divideByArrayOne
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[0.0 2.0 3.141592] asFloat32Array
		divideBy: #[1.0 1.0 1.0] asFloat32Array
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float32ArrayTest methodsFor: 'Aux' stamp: 'jmv 9/3/2020 18:40:03'!
divideByArrayZero
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[1.0 2.0 3.141592] asFloat32Array
		divideBy: #[0.0 2.0 3.141592] asFloat32Array
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float32ArrayTest methodsFor: 'Aux' stamp: 'jmv 9/3/2020 18:40:00'!
divideByScalarIndeterminate
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[0.0 2.0 3.141592] asFloat32Array
		divideBy: 0.0
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float32ArrayTest methodsFor: 'Aux' stamp: 'jmv 9/3/2020 18:39:00'!
divideByScalarOne
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[0.0 2.0 3.141592] asFloat32Array
		divideBy: 1.0
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float32ArrayTest methodsFor: 'Aux' stamp: 'jmv 9/3/2020 18:39:02'!
divideByScalarZero
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[1.0 2.0 3.141592] asFloat32Array
		divideBy: 0.0
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !


!classDefinition: #Float64ArrayTest category: 'BaseImageTests-Collections-Arrayed'!
TestCase subclass: #Float64ArrayTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections-Arrayed'!

!Float64ArrayTest methodsFor: 'Tests' stamp: 'jpb 8/2/2019 23:07:59'!
testIsCollection
	self assert: (#[1.0 2.0 3.141592 0.0] is: #Collection).
	self assert: (#[-100.0 -100.0 -100.0 -200.0 ] is: #Collection).! !

!Float64ArrayTest methodsFor: 'Tests' stamp: 'jmv 7/9/2018 09:38:50'!
testZeroArrayDividend

	self assert: #[1.2 2.4 0.0 ] / #[1.2 1.2 1.2 ] = #[1.0 2.0 0.0 ] ! !

!Float64ArrayTest methodsFor: 'Tests' stamp: 'jmv 7/9/2018 09:51:49'!
testZeroArrayDivisor

	"Test implicit exception"
	self should: [ #[1.2 2.4 3.6 ] / #[1.0 1.0 0.0 ]] raise: ZeroDivide.

	"Test explicit alternative value"
	self assert: (#[1.0 2.0 3.141592 0.0] copy divideBy: #[1.0 1.0 0.0 0.0 ] ifDivisorZero: -100 ifBothZero: -200) = 
		#[1.0 2.0 -100.0 -200.0 ].

	"Test explicit exceptions"
	self should: [
		#[1.0 2.0 3.141592] copy
			divideBy: #[1.0 1.0 0.0] 
			ifDivisorZero: [ZeroDivide signal ]
			ifBothZero: [DomainError signal ]]
		raise: ZeroDivide.
	self should: [
		#[0.0 2.0 3.141592] copy
			divideBy: #[0.0 1.0 1.0] 
			ifDivisorZero: [ZeroDivide signal ]
			ifBothZero: [DomainError signal ]]
		raise: DomainError.

	"Test non local returns in blocks"
	self assert: self divideByArrayOne = #[0.0 2.0 3.141592].
	self assert: self divideByArrayZero = #divisionByZero.
	self assert: self divideByArrayIndeterminate = #indeterminateResult.! !

!Float64ArrayTest methodsFor: 'Tests' stamp: 'jmv 7/9/2018 09:39:14'!
testZeroDividend

	self assert: #[1.2 2.4 3.6 0.0 ] / 1.2 = #[1.0 2.0 3.0 0.0 ] ! !

!Float64ArrayTest methodsFor: 'Tests' stamp: 'jmv 7/9/2018 09:53:42'!
testZeroDivisor

	"Test implicit exception"
	| |
	self should: [ #[1.2 2.4 3.6 ] / 0.0] raise: ZeroDivide.

	"Test explicit alternative value"
	self assert: (#[1.0 2.0 3.141592 0.0] copy divideBy: 0.0 ifDivisorZero: -100 ifBothZero: -200) = 
		#[-100.0 -100.0 -100.0 -200.0 ].

	"Test explicit exceptions"
	self should: [
		#[1.0 2.0 3.141592] copy
			divideBy: 0.0
			ifDivisorZero: [ZeroDivide signal ]
			ifBothZero: [DomainError signal ]]
		raise: ZeroDivide.
	self should: [
		#[0.0 2.0 3.141592] copy
			divideBy: 0.0
			ifDivisorZero: [ZeroDivide signal ]
			ifBothZero: [DomainError signal ]]
		raise: DomainError.

	"Test non local returns in blocks"
	self assert: self divideByScalarOne = #[0.0 2.0 3.141592].
	self assert: self divideByScalarZero = #divisionByZero.
	self assert: self divideByScalarIndeterminate = #indeterminateResult.! !


!Float64ArrayTest methodsFor: 'Aux' stamp: 'jmv 7/9/2018 09:52:51'!
divideByArrayIndeterminate
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[0.0 2.0 3.141592] copy
		divideBy: #[0.0 2.0 3.141592]
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float64ArrayTest methodsFor: 'Aux' stamp: 'jmv 7/9/2018 09:52:56'!
divideByArrayOne
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[0.0 2.0 3.141592] copy
		divideBy: #[1.0 1.0 1.0]
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float64ArrayTest methodsFor: 'Aux' stamp: 'jmv 7/9/2018 09:53:05'!
divideByArrayZero
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[1.0 2.0 3.141592] copy
		divideBy: #[0.0 2.0 3.141592]
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float64ArrayTest methodsFor: 'Aux' stamp: 'jmv 7/9/2018 09:38:35'!
divideByScalarIndeterminate
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[0.0 2.0 3.141592]
		divideBy: 0.0
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float64ArrayTest methodsFor: 'Aux' stamp: 'jmv 7/9/2018 09:38:39'!
divideByScalarOne
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[0.0 2.0 3.141592]
		divideBy: 1.0
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !

!Float64ArrayTest methodsFor: 'Aux' stamp: 'jmv 7/9/2018 09:38:43'!
divideByScalarZero
	"An example for testing. Uses a method to test behavior of non-local return."
	^#[1.0 2.0 3.141592]
		divideBy: 0.0
		ifDivisorZero: [^ #divisionByZero]
		ifBothZero: [^ #indeterminateResult]! !


!Float64ArrayTest methodsFor: 'as yet unclassified' stamp: 'jmv 7/30/2020 21:58:18'!
testSum
	| a |
	self assert: ({0.0. 1.0. Float pi. Float e} asFloat64Array + 1) = ({0.0+1. 1.0+1. Float pi+1. Float e+1} asFloat64Array).
	a _ {0.0. 1.0. Float pi. Float e} asFloat64Array.
	self assert: (a + a) = (a * 2 )! !
!classDefinition: #ReadStreamTest category: 'BaseImageTests-Collections-Streams'!
TestCase subclass: #ReadStreamTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections-Streams'!

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 10:21:47'!
testUpTo1ShortRecords
	". this test ensures the upTo: delim method behaves as specified by the ANSI standard:
	Delimiter is considered a separator (and therefore not required for the last chunk)."
	| stream |
	stream _ ReadStream on: 'record-1Xrecord-2Xrecord-incomplete'. 
	self assert:  ((stream upTo: $X) =  'record-1').
	self assert:  ((stream upTo: $X) =  'record-2').
	self assert:  ((stream upTo: $X) =  'record-incomplete').
	self assert:  ((stream upTo: $X) =  '').
	". the stream has been all consumed" 
	self assert:  (stream position = 35). ! !

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 10:55:33'!
testUpTo3LongUnterminatedRecord
	"Long input, no delimiter found, expected to return all the data chunk up to the end of file. "
	| longString stream read |
	longString _ (1 to: 100)
		inject: ''
		into: [ :prev :each |
			prev , 'A lot of stuff, needs over 2000 chars!! ' ].
	stream _ ReadStream on: longString.
	read _ stream upTo: $X.
	self assert: read = longString.! !

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 10:54:11'!
testUpTo4LongUnterminatedRecord
	"Big chunk, not delimiter found, expected return all the chunk  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 5000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i >= 3000 ifTrue: [ strm nextPut: $b ]]].
	stream _ ReadStream on: stuff.
	read _ stream upTo: $X.
	self assert: read size = 5000.! !

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 10:58:48'!
testUpTo5TerminatedAndUnterminatedLongRecords
	"Two big chunks, one delimiter in the middle, expected to return 
      the first time a big chunk, the second time the second block up to EOF.  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 6000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i = 3000 ifTrue: [ strm nextPut: $X ].
				i > 3000 ifTrue: [ strm nextPut: $b ]]].
	stream _ ReadStream on: stuff.
	" first scan, the delimiter is found but not printed.  "
	read _ stream upTo: $X.
	self assert: read size = 2999.
	self assert: (read at: 1) = $a.
	" second scan. the delimiter is not found, all second chunk is returned  "
	read _ stream upTo: $X.
	self assert: read size = 3000.
	self assert: (read at: 1) = $b.! !

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 10:59:51'!
testUpTo6TerminatedLongRecords
	"Two big chunks, one delimiter in the middle, one at the end. expected to return 
      two big chunks in two read, delimiters excluded.  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 6000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i = 3000 ifTrue: [ strm nextPut: $X ].
				((Interval
					from: 3001
					to: 5999) includes: i) ifTrue: [ strm nextPut: $b ].
				i = 6000 ifTrue: [ strm nextPut: $X ]]].
	stream _ ReadStream on: stuff.
	" first scan, delimiter is found, return all the block delimiter excluded "
	read _ stream upTo: $X.
	self assert: read size = 2999.
	self assert: (read at: 1) = $a.
	" second scan, return chunk, delimiter excluded.  "
	read _ stream upTo: $X.
	self assert: read size = 2999.
	self assert: (read at: 1) = $b.! !

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:00:52'!
testUpToTerminator1ShortRecords
	"
	. Read a file stream up to 'delim' in a strict way. 
	. If delim is found returns everything up to the first occurrence of 'delim' included.
	. if delim is not found returns nil and set the FileStream position where it was before
	the call was made. This ensures if another process writes into the file another delim
	limited token we will fully read it on next upTo call.
	This means Delimiter is a Terminator: a chunk is only considered well formed if it ends with it.
	"
	| stream |
	stream _ ReadStream on: 'record-1Xrecord-2Xrecord-incomplete'. 
	self assert:  ((stream upTo: $X delimiterIsTerminator: true) =  'record-1X').
	self assert:  ((stream upTo: $X delimiterIsTerminator: true) =  'record-2X').
	self assert:  ((stream upTo: $X delimiterIsTerminator: true) =  nil).
	". we are not at the end of the stream, but just after the last delim was found.
	we are ready to receive other delim limitated tokens. if they get written.
	"
	self assert:  (stream position = 18).! !

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:01:38'!
testUpToTerminator3LongUnterminatedRecord
	"Long input, no delimiter found, expected to return nil. "
	| longString stream read |
	longString _ (1 to: 100)
		inject: ''
		into: [ :prev :each |
			prev , 'A lot of stuff, needs over 2000 chars!! ' ].
	stream _ ReadStream on: longString.
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read = nil.! !

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:02:04'!
testUpToTerminator4LongUnterminatedRecord
	"Big chunk, not delimiter found, expected return nil  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 5000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i >= 3000 ifTrue: [ strm nextPut: $b ]]].
	stream _ ReadStream on: stuff.
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read = nil.! !

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:02:36'!
testUpToTerminator5TerminatedAndUnterminatedLongRecords
	"Two big chunks, one delimiter in the middle, expected to return 
      the first time a big chunk, the second time nil.  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 6000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i = 3000 ifTrue: [ strm nextPut: $X ].
				i > 3000 ifTrue: [ strm nextPut: $b ]]].
	stream _ ReadStream on: stuff.
	" first scan, delimiter is found, return all the block delimiter included "
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read size = 3000.
	self assert: (read at: 1) = $a.
	" second scan, delimiter not found, returns nil  "
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read = nil.! !

!ReadStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:03:06'!
testUpToTerminator6TerminatedLongRecords
	"Two big chunks, one delimiter in the middle, one at the end expected to return 
      two big chunks in two read, delimiters included.  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 6000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i = 3000 ifTrue: [ strm nextPut: $X ].
				((Interval
					from: 3001
					to: 5999) includes: i) ifTrue: [ strm nextPut: $b ].
				i = 6000 ifTrue: [ strm nextPut: $X ]]].
	stream _ ReadStream on: stuff.
	" first scan, delimiter is found, return all the block delimiter included "
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read size = 3000.
	self assert: (read at: 1) = $a.
	" second scan, delimiter found, return chunk, delimiter included   "
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read size = 3000.
	self assert: (read at: 1) = $b.! !


!classDefinition: #ReadWriteStreamTest category: 'BaseImageTests-Collections-Streams'!
TestCase subclass: #ReadWriteStreamTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections-Streams'!

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:06:39'!
testUpTo1ShortRecords
	". this test ensures the upTo: delim method behaves as specified by the ANSI standard:
	Delimiter is considered a separator (and therefore not required for the last chunk)."
	| stream |
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: 'record-1Xrecord-2Xrecord-incomplete'.
	stream position: 0.
	self assert:  ((stream upTo: $X) =  'record-1').
	self assert:  ((stream upTo: $X) =  'record-2').
	self assert:  ((stream upTo: $X) =  'record-incomplete').
	self assert:  ((stream upTo: $X) =  '').
	". the stream has been all consumed" 
	self assert:  (stream position = 35). ! !

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:07:32'!
testUpTo3LongUnterminatedRecord
	"Long input, no delimiter found, expected to return all the data chunk up to the end of file. "
	| longString stream read |
	longString _ (1 to: 100)
		inject: ''
		into: [ :prev :each |
			prev , 'A lot of stuff, needs over 2000 chars!! ' ].
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: longString.
	stream position: 0.
	read _ stream upTo: $X.
	self assert: read = longString.! !

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:08:12'!
testUpTo4LongUnterminatedRecord
	"Big chunk, not delimiter found, expected return all the chunk  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 5000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i >= 3000 ifTrue: [ strm nextPut: $b ]]].
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: stuff.
	stream position: 0.
	read _ stream upTo: $X.
	self assert: read size = 5000.! !

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:08:41'!
testUpTo5TerminatedAndUnterminatedLongRecords
	"Two big chunks, one delimiter in the middle, expected to return 
      the first time a big chunk, the second time the second block up to EOF.  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 6000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i = 3000 ifTrue: [ strm nextPut: $X ].
				i > 3000 ifTrue: [ strm nextPut: $b ]]].
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: stuff.
	stream position: 0.
	" first scan, the delimiter is found but not printed.  "
	read _ stream upTo: $X.
	self assert: read size = 2999.
	self assert: (read at: 1) = $a.
	" second scan. the delimiter is not found, all second chunk is returned  "
	read _ stream upTo: $X.
	self assert: read size = 3000.
	self assert: (read at: 1) = $b.! !

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:08:54'!
testUpTo6TerminatedLongRecords
	"Two big chunks, one delimiter in the middle, one at the end. expected to return 
      two big chunks in two read, delimiters excluded.  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 6000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i = 3000 ifTrue: [ strm nextPut: $X ].
				((Interval
					from: 3001
					to: 5999) includes: i) ifTrue: [ strm nextPut: $b ].
				i = 6000 ifTrue: [ strm nextPut: $X ]]].
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: stuff.
	stream position: 0.
	" first scan, delimiter is found, return all the block delimiter excluded "
	read _ stream upTo: $X.
	self assert: read size = 2999.
	self assert: (read at: 1) = $a.
	" second scan, return chunk, delimiter excluded.  "
	read _ stream upTo: $X.
	self assert: read size = 2999.
	self assert: (read at: 1) = $b.! !

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:12:06'!
testUpToTerminator1ShortRecords
	"
	. Read a file stream up to 'delim' in a strict way. 
	. If delim is found returns everything up to the first occurrence of 'delim' included.
	. if delim is not found returns nil and set the FileStream position where it was before
	the call was made. This ensures if another process writes into the file another delim
	limited token we will fully read it on next upTo call.
	This means Delimiter is a Terminator: a chunk is only considered well formed if it ends with it.
	"
	| stream |
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: 'record-1Xrecord-2Xrecord-incomplete'.
	stream position: 0.
	self assert:  ((stream upTo: $X delimiterIsTerminator: true) =  'record-1X').
	self assert:  ((stream upTo: $X delimiterIsTerminator: true) =  'record-2X').
	self assert:  ((stream upTo: $X delimiterIsTerminator: true) =  nil).
	". we are not at the end of the stream, but just after the last delim was found.
	we are ready to receive other delim limitated tokens. if they get written.
	"
	self assert:  (stream position = 18).! !

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:12:49'!
testUpToTerminator3LongUnterminatedRecord
	"Long input, no delimiter found, expected to return nil. "
	| longString stream read |
	longString _ (1 to: 100)
		inject: ''
		into: [ :prev :each |
			prev , 'A lot of stuff, needs over 2000 chars!! ' ].
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: longString.
	stream position: 0.
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read = nil.! !

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:13:03'!
testUpToTerminator4LongUnterminatedRecord
	"Big chunk, not delimiter found, expected return nil  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 5000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i >= 3000 ifTrue: [ strm nextPut: $b ]]].
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: stuff.
	stream position: 0.
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read = nil.! !

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:13:18'!
testUpToTerminator5TerminatedAndUnterminatedLongRecords
	"Two big chunks, one delimiter in the middle, expected to return 
      the first time a big chunk, the second time nil.  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 6000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i = 3000 ifTrue: [ strm nextPut: $X ].
				i > 3000 ifTrue: [ strm nextPut: $b ]]].
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: stuff.
	stream position: 0.
	" first scan, delimiter is found, return all the block delimiter included "
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read size = 3000.
	self assert: (read at: 1) = $a.
	" second scan, delimiter not found, returns nil  "
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read = nil.! !

!ReadWriteStreamTest methodsFor: 'tests' stamp: 'NM 10/25/2021 11:13:33'!
testUpToTerminator6TerminatedLongRecords
	"Two big chunks, one delimiter in the middle, one at the end expected to return 
      two big chunks in two read, delimiters included.  "
	| stuff stream read |
	stuff _ String streamContents: [ :strm |
		1
			to: 6000
			do: [ :i |
				i < 3000 ifTrue: [ strm nextPut: $a ].
				i = 3000 ifTrue: [ strm nextPut: $X ].
				((Interval
					from: 3001
					to: 5999) includes: i) ifTrue: [ strm nextPut: $b ].
				i = 6000 ifTrue: [ strm nextPut: $X ]]].
	stream _ ReadWriteStream on: ''. 
	stream nextPutAll: stuff.
	stream position: 0.
	" first scan, delimiter is found, return all the block delimiter included "
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read size = 3000.
	self assert: (read at: 1) = $a.
	" second scan, delimiter found, return chunk, delimiter included   "
	read _ stream
		upTo: $X
		delimiterIsTerminator: true.
	self assert: read size = 3000.
	self assert: (read at: 1) = $b.! !


!classDefinition: #WriteStreamTest category: 'BaseImageTests-Collections-Streams'!
TestCase subclass: #WriteStreamTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BaseImageTests-Collections-Streams'!
!WriteStreamTest commentStamp: '<historical>' prior: 0!
Tests cases for Stream messages: 

nextPutAll: when:
nextPut: when: 
print: when:.

Made at Cuis Sprint #1
!


!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/5/2022 21:09:16'!
testIsStream
	self assert: (String writeStream is: #Stream).! !

!WriteStreamTest methodsFor: 'tests' stamp: 'HAW 3/20/2019 07:27:06'!
testNewLineTabWhenConditionIsFalseDoesNotPutANewLineTabInStream

	| stream |

	stream := String writeStream.
	stream newLineTab: 2 when: false.
	
	self assert: stream contents isEmpty
	! !

!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:12:31'!
testNewLineTabWhenConditionIsTruePutsANewLineTabInStream

	| stream |

	stream := String writeStream.
	stream newLineTab: 2 when: true.
	
	self assert: stream contents equals: (String streamContents: [ :s | s newLineTab: 2 ]).! !

!WriteStreamTest methodsFor: 'tests' stamp: 'HAW 3/20/2019 07:20:47'!
testNewLineWhenConditionIsFalseDoesNotPutANewLineInStream

	| stream |

	stream := String writeStream.
	stream newLineWhen: false.
	
	self assert: stream contents isEmpty
	! !

!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:13:18'!
testNewLineWhenConditionIsTruePutsANewLineInStream

	| stream |

	stream := String writeStream.
	stream newLineWhen: true.
	
	self assert: stream contents equals: Character newLineCharacter asString.! !

!WriteStreamTest methodsFor: 'tests' stamp: 'HAW 3/20/2019 07:06:13'!
testNextPutAllWhenConditionIsFalseDoesNotPutCollectionInStream

	| stream |

	stream := String writeStream.
	stream nextPutAll: 'other' when: false.
	
	self assert: stream contents isEmpty
	! !

!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:13:41'!
testNextPutAllWhenConditionIsTruePutsCollectionInStream

	| stream |
	
	stream := String writeStream.
	stream nextPutAll: 'other' when: true.
	
	self assert: stream contents equals: 'other'.! !

!WriteStreamTest methodsFor: 'tests' stamp: 'HAW 3/20/2019 07:06:24'!
testNextPutWhenConditionIsFalseDoesNotPutObjectInStream

	| stream |
	
	stream := String writeStream.
	stream nextPut: $t when: false.
	
	self assert: stream contents isEmpty
	
	! !

!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:14:03'!
testNextPutWhenConditionIsTruePutsObjectInStream

	| stream |
	
	stream := String writeStream.
	stream nextPut: $t when: true.
	
	self assert: stream contents equals: 't'.! !

!WriteStreamTest methodsFor: 'tests' stamp: 'HAW 3/20/2019 07:13:06'!
testPrintWhenConditionIsFalseDoesNotPrintObjectInStream

	| stream |
	
	stream := String writeStream.
	stream print: Object when: false.
	
	self assert: stream contents isEmpty
	
	! !

!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:14:20'!
testPrintWhenConditionIsTruePrintsObjectInStream

	| stream |
	
	stream := String writeStream.
	stream print: Object when: true.
	
	self assert: stream contents equals: Object printString.! !

!WriteStreamTest methodsFor: 'tests' stamp: 'HAW 3/20/2019 07:42:20'!
testSpaceManyTimesWhenConditionIsFalseDoesNotPutASpaceInStream

	| stream |

	stream := String writeStream.
	stream space: 2 when: false.
	
	self assert: stream contents isEmpty
	! !

!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:14:32'!
testSpaceManyTimesWhenConditionIsTruePutSpacesInStream

	| stream |

	stream := String writeStream.
	stream space: 2 when: true.
	
	self assert: stream contents equals: '  '.! !

!WriteStreamTest methodsFor: 'tests' stamp: 'HAW 3/20/2019 07:19:06'!
testSpaceWhenConditionIsFalseDoesNotPutASpaceInStream

	| stream |

	stream := String writeStream.
	stream spaceWhen: false.
	
	self assert: stream contents isEmpty
	! !

!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:14:45'!
testSpaceWhenConditionIsTruePutsASpaceInStream

	| stream |

	stream := String writeStream.
	stream spaceWhen: true.
	
	self assert: stream contents equals: ' '.! !

!WriteStreamTest methodsFor: 'tests' stamp: 'HAW 3/20/2019 07:24:34'!
testTabManyTimesWhenConditionIsFalseDoesNotPutATabInStream

	| stream |

	stream := String writeStream.
	stream tab: 2 when: false.
	
	self assert: stream contents isEmpty
	! !

!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:15:00'!
testTabManyTimesWhenConditionIsTruePutsTabsInStream

	| stream |

	stream := String writeStream.
	stream tab: 2 when: true.
	
	self assert: stream contents equals: (String streamContents: [ :s | s tab: 2 ]).! !

!WriteStreamTest methodsFor: 'tests' stamp: 'HAW 3/20/2019 07:22:50'!
testTabWhenConditionIsFalseDoesNotPutATabInStream

	| stream |

	stream := String writeStream.
	stream tabWhen: false.
	
	self assert: stream contents isEmpty
	! !

!WriteStreamTest methodsFor: 'tests' stamp: 'jmv 7/31/2023 12:15:13'!
testTabWhenConditionIsTruePutsATabInStream

	| stream |

	stream := String writeStream.
	stream tabWhen: true.
	
	self assert: stream contents equals: Character tab asString.! !
