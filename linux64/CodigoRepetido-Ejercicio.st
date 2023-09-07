!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/6/2023 16:11:09'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook|
	
	customerBook := CustomerBook new.
	
	self do: [customerBook addCustomerNamed: 'John Lennon'.] takeLessMillisecondsThan: 50.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/6/2023 16:11:09'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self newCustomerBookAndAddCustomer: paulMcCartney.
	  
	self do: [customerBook removeCustomerNamed: paulMcCartney.] takeLessMillisecondsThan: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ma 9/6/2023 12:52:14'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	
	self try: [ customerBook addCustomerNamed: ''.]  
		onException: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ma 9/6/2023 11:38:49'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.		
	customerBook := self newCustomerBookAndAddCustomer: johnLennon.
	
	self try: [ customerBook removeCustomerNamed: 'Paul McCartney'.]  
		onException: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/5/2023 12:57:26'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookAndAddCustomer: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/5/2023 12:58:09'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self newCustomerBookAndAddCustomer: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ma 9/6/2023 11:38:49'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.		
	customerBook := self newCustomerBookAndAddCustomer: johnLennon.
		
	self try: [ customerBook suspendCustomerNamed: 'George Harrison'.]  
		onException: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ma 9/6/2023 11:38:49'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.		
	customerBook := self newCustomerBookAndAddCustomer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self  try: [ customerBook suspendCustomerNamed: johnLennon.]  
		onException: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)].
! !


!CustomerBookTest methodsFor: 'auxiliar' stamp: 'ma 9/6/2023 11:41:29'!
currentTimeInMilliseconds
	^Time millisecondClockValue * millisecond! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'tp 9/6/2023 16:11:09'!
do: aClosure takeLessMillisecondsThan: aQuantityOfMilliseconds

	| millisecondsAfterRunning millisecondsBeforeRunning |
	
	millisecondsBeforeRunning := self currentTimeInMilliseconds .
	aClosure value.
	millisecondsAfterRunning := self currentTimeInMilliseconds .
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aQuantityOfMilliseconds * millisecond)! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'BR 9/4/2023 21:49:54'!
newCustomerBookAndAddCustomer: aCustomerName
	| customerBook |
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aCustomerName .
	^ customerBook ! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'ma 9/6/2023 12:52:41'!
try: aClosure onException: anException do: aSecondClosure

	[aClosure value. self fail]
	on: anException 
	do: aSecondClosure.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'ma 9/6/2023 11:52:05'!
includesCustomerNamed: aName

	^(self isAnActiveCustomer: aName) or: [self isASuspendedCustomer: aName]! !

!CustomerBook methodsFor: 'testing' stamp: 'ma 9/6/2023 11:47:29'!
isASuspendedCustomer: aName
	
	^suspended includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'ma 9/6/2023 11:46:35'!
isAnActiveCustomer: aName
	
	^active includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'ma 9/6/2023 12:50:29'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ma 9/6/2023 12:47:00'!
removeCustomerNamed: aName 
      
	self removeCustomerNamed: aName  from: active onSuccess: [^aName].
	self removeCustomerNamed: aName  from: suspended onSuccess: [^aName].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'ma 9/6/2023 12:40:21'!
removeCustomerNamed: aName from: aGroupOfCustomers
 
	1 to: aGroupOfCustomers size do: 
	[ :index |
		aName = (aGroupOfCustomers at: index)
			ifTrue: [
				aGroupOfCustomers removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'ma 9/6/2023 12:55:35'!
removeCustomerNamed: aName from: aGroupOfCustomers onSuccess: aClosure
 
	self removeCustomerNamed: aName  
	from: aGroupOfCustomers 
	onSuccess: aClosure 
	onFailure: [].
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'ma 9/6/2023 12:50:55'!
removeCustomerNamed: aName from: aGroupOfCustomers onSuccess: aSuccessClosure onFailure: aFailureClosure
 
	((self removeCustomerNamed: aName from: aGroupOfCustomers) = aName) 
	ifFalse: aFailureClosure 
	ifTrue: aSuccessClosure .
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'ma 9/6/2023 12:49:29'!
suspendCustomerNamed: aName 
	
	self removeCustomerNamed: aName  
	from: active 
	onSuccess: [suspended add: aName] 
	onFailure: [^CantSuspend signal].
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:48'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:52'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
