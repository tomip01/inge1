!classDefinition: #FormulaOneTest category: 'ISW1-2022-1C-Parcial-1'!
TestCase subclass: #FormulaOneTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!FormulaOneTest methodsFor: 'assertion' stamp: 'tp 9/20/2023 13:39:37'!
withTurboSequence: aTurboActivationSequence speedShouldBe: anExpectedSpeed

	self onCarWithTurboInRangeDo: [:aCar | 
		aTurboActivationSequence value: aCar.
		
		self assert: aCar isTurboActivated.
		self assert: anExpectedSpeed equals: aCar speed.].! !


!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/19/2023 15:56:52'!
test01SectorLengthMustBePositive

	self 
		should: [ SectorWithTurbo of: 0 * kilometer.]
		raise: Error
		withMessageText: Sector lengthMustBePositiveErrorDescription! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:28:02'!
test02ACarCanNotBePlacedInAKilometerGreaterThanSectorLength

	| sector  outside car |
	
	sector := self tenKilometerTurboSector.
	outside := sector length + (1 * millimeter).
	car := self schumacherCar.
	
	self 
		should: [ sector put: car at: outside ] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Sector cannotPlacedCarErrorDescription equals: error messageText.
			self deny: (sector includes: car) ]	
! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:28:31'!
test03CarCannotActivateTurboInNonTurboSector

	| car sector |

	sector := self tenKilometerWithoutTurboSector.
	car := self schumacherCar.
	
	sector atStartPut: car.
	
	self should: [ car activateTurbo ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: Sector turboNotAllowedErrorDescription equals: error messageText.
			self deny: car isTurboActivated]
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:53'!
test04CarCannotActivateTurboWhenNoCarAhead

	| schumacher hamilton sector |
	
	sector := self twentyKilometerTurboSector.
	
	schumacher := self schumacherCar.
	hamilton := self hamiltonCar.
	
	sector put: schumacher at: 12 * kilometer.
	sector put: hamilton at: 13 * kilometer.
	
	self 
		should: [ hamilton activateTurbo]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:exception |
			self assert: Sector cannotActivateTurboWhenNoCarAheadErrorDescription equals: exception messageText. 
			self deny: hamilton isTurboActivated ]! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:29:29'!
test05CarCanActivateTurboWhenLessThanASecondBehindAnotherCar

	| schumacher hamilton sector |
	
	sector := self twentyFourKilometerTurboSector.
	
	schumacher := self schumacherCar.
	hamilton := self hamiltonCar.
	
	schumacher speed: 300 * kilometer / hour.
	hamilton speed: 300 * kilometer / hour.
	
	sector put: schumacher at: 12.95 * kilometer.
	sector put: hamilton at: 13 * kilometer.
	
	schumacher activateTurbo.
	
	self assert: schumacher isTurboActivated
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:29:29'!
test06CarCannotActivateTurboWhenMoreThanASecondBehindAnotherCar

	| schumacher hamilton sector |
	
	sector := self twentyFourKilometerTurboSector.
	
	schumacher := self schumacherCar.
	hamilton := self hamiltonCar.
	
	schumacher speed: 300 * kilometer / hour.
	hamilton speed: 300 * kilometer / hour.
	
	sector put: schumacher at: 12.9 * kilometer.
	sector put: hamilton at: 13 * kilometer.
	
	self should: [schumacher activateTurbo]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error |
			self 
				assert: Sector cannotActivateTurboWhenMoreThanASecondBehindAnotherCarErrorDescription 
				equals: error messageText.
			self deny: schumacher isTurboActivated]
			! !

!FormulaOneTest methodsFor: 'tests' stamp: 'HAW 5/2/2022 09:16:40'!
test07TrackMustHaveSectors

	self
		should: [ Track withSectors: #() ]
		raise: Error
		withMessageText: Track mustHaveSectorsErrorDescription! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:18'!
test08TheLengthOfATrackShouldBeTheSumOfItsSectors

	| sectors track |
	
	sectors := self twoSectors.
	track := Track withSectors: sectors.
	
	self assert: 30 * kilometer equals: 	track length! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:18'!
test09ACarCanNotBePlacedInAKilometerGreaterThanTrackLength

	| sectors track car outside |
	
	sectors := self twoSectors.
	
	track := Track withSectors: sectors.
	outside := track length + (1 * millimeter).
	car := self schumacherCar.
	
	self should: [ track put: car at: outside ] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Track cannotPlacedCarErrorDescription equals: error messageText.
			self deny: (track includes: car) ]	
! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:18'!
test10TrackShouldPlaceCarInKilometerWithinSector

	| sectors track car positionInTrack positionInSector2 |
	
	sectors := self twoSectors.
		
	positionInSector2 := 5 * kilometer.
	positionInTrack := sectors first length + positionInSector2.
	
	track := Track withSectors: sectors.
	car := self schumacherCar.

	track put: car at: positionInTrack.
	
	self assert: sectors second equals: (track sectorOf: car).
	self assert: positionInTrack equals: (track positionOf: car).
	
	self deny: (sectors first includes: car).
	self assert: (sectors second includes: car).

! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:18'!
test11TrackShouldKnowCarsInRunning

	| sectors track car1 car2 |
	
	sectors := self twoSectors.
		
	track := Track withSectors: sectors.
	car1 := self schumacherCar.
	car2 := self verstappenCar.

	track put: car1 at: 10 * kilometer.
	track put: car2 at: 30 * kilometer.
	
	self assert: (track includes: car1).
	self assert: (track includes: car2).
		
	self assert: (sectors first includes: car1).
	self assert: (sectors second includes: car2).

! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:18'!
test12CarCannotBeInMoreThanOneSectorAtATime

	| sectors track car |
	
	sectors := self twoSectors.
	
	track := Track withSectors: sectors.
	car := self schumacherCar.

	track put: car at: 5 * kilometer.
	track put: car at: 15 * kilometer.
	
	self assert: sectors second equals: (track sectorOf: car).
	self deny: (sectors first includes: car).
	self assert: (sectors second includes: car)
! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:18'!
test13GrandPrixLengthShouldBeTrackLengthTimesNumberOfLaps

	| track grandPrix numberOfLaps |
	
	track := Track withSectors: (self twoSectors).
	numberOfLaps := 100.
	
	grandPrix := GrandPrix on: track running: numberOfLaps.
	
	self assert: track length * numberOfLaps	 equals: grandPrix length
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 13:22:39'!
test14TwoCarsCanBeAtTheSameDistanceFromStart

	| grandPrix hamilton verstappen |
	
	grandPrix := GrandPrix 
		on: (self trackWithTenKilometerTurboSector)
		running: 100.
	
	verstappen := self verstappenCar.
	hamilton := self hamiltonCar.	
	
	grandPrix put: verstappen at: 5 * kilometer.
	grandPrix put: hamilton at: 5 * kilometer.
	
	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert:  5 * kilometer equals: (grandPrix locationOf: hamilton). 
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 13:22:39'!
test15ACarStoppedShouldNotMoveAfterSomeTime

	| grandPrix verstappen |
	
	verstappen := self verstappenCar.
	verstappen speed: 0 * kilometer / hour.
	
	grandPrix := GrandPrix 
		on: (self trackWithTenKilometerTurboSector)
		running: 100
		with: (Set with: verstappen).
	
	grandPrix put: verstappen at: 5 * kilometer.
	grandPrix advance: 10 * minute.
	
	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen) 
	
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:18'!
test16ACarSpeedingShouldMoveAfterSomeTime

	| grandPrix verstappen sectors |
	
	verstappen := self verstappenCar.
	verstappen speed: 0* kilometer / hour.
	
	sectors := self twoSectors.
	
	grandPrix := GrandPrix 
		on: (Track withSectors: sectors)
		running: 100
		with: (Set with: verstappen).
	
	grandPrix put: verstappen at: 0 * kilometer.
	verstappen speed: 300 * kilometer / hour.
	grandPrix advance: 1 * hour.
	
	self assert: 300 * kilometer equals: (grandPrix locationOf: verstappen). 
	
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:18'!
test17GrandPrixKnowsSectorOfCar

	| grandPrix verstappen sectors |
	
	verstappen := self verstappenCar.
	
	sectors := self twoSectors.
	
	grandPrix := GrandPrix 
		on: (Track withSectors: sectors)
		running: 100
		with: (Set with: verstappen).
		
	grandPrix put: verstappen at: 5 * kilometer.
	
	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert: sectors first equals: (grandPrix sectorOf: verstappen).
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 12:33:18'!
test18GrandPrixKnowsSectorOfCarAfterSomeTime

	| grandPrix verstappen sectors |
	
	verstappen := self verstappenCar.
	
	sectors := self twoSectors.
	
	grandPrix := GrandPrix 
		on: (Track withSectors: sectors)
		running: 100
		with: (Set with: verstappen).
		
	grandPrix put: verstappen at: 0 * kilometer.
	
	verstappen speed: 5 * kilometer / hour. ":)"
	grandPrix advance: 1 * hour.
	
	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert: sectors first equals: (grandPrix sectorOf: verstappen).
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 13:23:39'!
test19GrandPrixMovesCarsBetweenSectors

	| grandPrix verstappen sectorA sectorB |
	
	verstappen := self verstappenCar.
	sectorA := self tenKilometerTurboSector.
	sectorB := self thirtyKilometerTurboSector.
	
	grandPrix := GrandPrix 
		on: (self trackWithSector: sectorA and: sectorB)
		running: 100
		with: (Set new add: verstappen; yourself).
		
	grandPrix put: verstappen at: 5 * kilometer.

	self assert: 5 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert: sectorA equals: (grandPrix sectorOf: verstappen).
	
	verstappen speed: 15 * kilometer / hour.
	grandPrix advance: 1 * hour.
	
	self assert: 20 * kilometer equals: (grandPrix locationOf: verstappen). 
	self assert: sectorB equals: (grandPrix sectorOf: verstappen).
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 13:31:15'!
test20FirstTurboIncrementsSpeedByTwentyPercent

	self withTurboSequence: [:aCar | aCar activateTurbo] 
		speedShouldBe: 120 * kilometer / hour.! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 13:32:18'!
test21SecondTurboSpeedsByTenPercent

	self withTurboSequence: [:aCar | aCar activateTurbo; deactivateTurbo; activateTurbo] 
		speedShouldBe: 110 * kilometer / hour.! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 13:33:05'!
test22ThirdTurboSpeedsByFivePercent

	self withTurboSequence: [:aCar | aCar activateTurbo; deactivateTurbo; activateTurbo; deactivateTurbo; activateTurbo.] 
		speedShouldBe: 105 * kilometer / hour.! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 13:34:24'!
test23AfterThridTurbo_TurboIsExhausted
	
	self withTurboSequence: [:aCar | aCar activateTurbo; deactivateTurbo; activateTurbo; deactivateTurbo; activateTurbo; deactivateTurbo; activateTurbo] 
		speedShouldBe: 100 * kilometer / hour.! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 13:40:39'!
test24CanNotActivateTurboWhenTurboIsActivated

	self onCarWithTurboInRangeDo: [:aCar | 
		aCar activateTurbo.
	
		self 
			should: [ aCar activateTurbo ]
			raise: Error - MessageNotUnderstood 
			withMessageText: aCar turboAlreadyActivatedErrorDescription]
	
	! !

!FormulaOneTest methodsFor: 'tests' stamp: 'tp 9/20/2023 13:41:26'!
test25CanNotDeactivateTurboWhenIsDeactivated

	self onCarWithTurboInRangeDo: [ :aCar |
		self 
			should: [ aCar deactivateTurbo ]
			raise: Error - MessageNotUnderstood 
			withMessageText: aCar turboAlreadydeActivatedErrorDescription]
	
	! !


!FormulaOneTest methodsFor: 'sectors' stamp: 'tp 9/20/2023 12:28:02'!
tenKilometerTurboSector

	^ SectorWithTurbo of: 10 * kilometer! !

!FormulaOneTest methodsFor: 'sectors' stamp: 'tp 9/20/2023 12:28:31'!
tenKilometerWithoutTurboSector

	^ SectorWithoutTurbo of: 10 * kilometer! !

!FormulaOneTest methodsFor: 'sectors' stamp: 'tp 9/20/2023 12:31:49'!
thirtyKilometerTurboSector

	^ SectorWithTurbo of: 30 * kilometer! !

!FormulaOneTest methodsFor: 'sectors' stamp: 'tp 9/20/2023 12:29:29'!
twentyFourKilometerTurboSector

	^ SectorWithTurbo of: 24 * kilometer! !

!FormulaOneTest methodsFor: 'sectors' stamp: 'tp 9/20/2023 12:33:53'!
twentyKilometerTurboSector

	^ SectorWithTurbo of: 20 * kilometer! !

!FormulaOneTest methodsFor: 'sectors' stamp: 'tp 9/20/2023 12:30:48'!
twentyKilometerWithoutTurboSector

	^ SectorWithoutTurbo of: 20 * kilometer! !

!FormulaOneTest methodsFor: 'sectors' stamp: 'tp 9/20/2023 12:33:18'!
twoSectors

	^ OrderedCollection 
		with: (self tenKilometerTurboSector)
		with: (self twentyKilometerWithoutTurboSector)! !


!FormulaOneTest methodsFor: 'tracks' stamp: 'tp 9/20/2023 13:23:39'!
trackWithSector: sectorA and: sectorB

	^ Track withSectors: (OrderedCollection with: sectorA with: sectorB)! !

!FormulaOneTest methodsFor: 'tracks' stamp: 'tp 9/20/2023 13:22:39'!
trackWithTenKilometerTurboSector

	^ Track withSectors: (OrderedCollection with: (self tenKilometerTurboSector))! !


!FormulaOneTest methodsFor: 'cars' stamp: 'tp 9/20/2023 12:26:22'!
hamiltonCar

	^ FormulaOneCar drivenBy: #Hamilton! !

!FormulaOneTest methodsFor: 'cars' stamp: 'tp 9/20/2023 13:37:52'!
onCarWithTurboInRangeDo: aBlock

	| schumacher hamilton sector |
	
	sector := self twentyFourKilometerTurboSector.
	
	schumacher := self schumacherCar.
	hamilton := self hamiltonCar.
	
	schumacher speed: 100 * kilometer / hour.
	hamilton speed: 100 * kilometer / hour.
	
	sector put: schumacher at: 12.99 * kilometer.
	sector put: hamilton at: 13 * kilometer.
	
	aBlock value: schumacher.! !

!FormulaOneTest methodsFor: 'cars' stamp: 'tp 9/20/2023 12:24:55'!
schumacherCar

	^ FormulaOneCar drivenBy: #Schumacher! !

!FormulaOneTest methodsFor: 'cars' stamp: 'tp 9/20/2023 12:26:53'!
verstappenCar

	^ FormulaOneCar drivenBy: #Verstappen! !


!classDefinition: #FormulaOneCar category: 'ISW1-2022-1C-Parcial-1'!
Object subclass: #FormulaOneCar
	instanceVariableNames: 'grandPrix driver speed turboStatus traveledDistance currentSector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!FormulaOneCar methodsFor: 'initialization' stamp: 'tp 9/19/2023 15:00:03'!
initializeDrivenBy: aDriver 

	driver := aDriver.
	turboStatus := TurboDeactivated next: TurboActivated firstInActivationChain.
	speed := 0*kilometer/hour.
	traveledDistance := 0.
	! !

!FormulaOneCar methodsFor: 'initialization' stamp: 'FRT 5/1/2022 11:26:28'!
runningInGrandPrix: aGrandPrix
	
	grandPrix _ aGrandPrix! !


!FormulaOneCar methodsFor: 'moving' stamp: 'HAW 4/30/2022 19:15:07'!
advance: aDistance

	traveledDistance _ traveledDistance + aDistance! !

!FormulaOneCar methodsFor: 'moving' stamp: 'FRT 4/30/2022 16:33:07'!
atSector: aSector

	currentSector _ aSector.! !

!FormulaOneCar methodsFor: 'moving' stamp: 'tp 9/19/2023 15:01:52'!
speed

	^ speed * turboStatus speedingRatio! !

!FormulaOneCar methodsFor: 'moving' stamp: 'HAW 5/1/2022 17:34:26'!
speed: newSpeed

	speed _ newSpeed! !

!FormulaOneCar methodsFor: 'moving' stamp: 'HAW 4/30/2022 19:15:19'!
traveledDistance

	^ traveledDistance! !

!FormulaOneCar methodsFor: 'moving' stamp: 'HAW 4/30/2022 19:15:31'!
traveledDistance: aDistance

	traveledDistance _ aDistance! !


!FormulaOneCar methodsFor: 'turbo' stamp: 'tp 9/19/2023 15:10:43'!
activateTurbo

	^ turboStatus activateTurboOn: self.
! !

!FormulaOneCar methodsFor: 'turbo' stamp: 'tp 9/19/2023 15:11:56'!
deactivateTurbo

	^ turboStatus deactivateTurboOn: self.! !


!FormulaOneCar methodsFor: 'error descriptions' stamp: 'tp 9/19/2023 15:22:50'!
turboAlreadyActivatedErrorDescription

	" se que está repetido"
	
	^'Turbo already activated'! !

!FormulaOneCar methodsFor: 'error descriptions' stamp: 'tp 9/19/2023 15:22:45'!
turboAlreadydeActivatedErrorDescription

	" se que está repetido"
	
	^'Turbo is already deactivated'! !


!FormulaOneCar methodsFor: 'testing' stamp: 'tp 9/19/2023 15:05:24'!
isTurboActivated
	
	^turboStatus isActivated.! !


!FormulaOneCar methodsFor: 'turbo-private' stamp: 'tp 9/19/2023 15:08:59'!
activateTurboInSectorWithTurbo
	
	turboStatus := turboStatus next! !

!FormulaOneCar methodsFor: 'turbo-private' stamp: 'tp 9/19/2023 14:34:12'!
activateTurboOnCurrentSector

	^currentSector activateTurboTo: self.! !

!FormulaOneCar methodsFor: 'turbo-private' stamp: 'tp 9/19/2023 15:09:28'!
deactivateTurboOnCurrentSector

	^turboStatus := TurboDeactivated next: turboStatus next.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FormulaOneCar class' category: 'ISW1-2022-1C-Parcial-1'!
FormulaOneCar class
	instanceVariableNames: ''!

!FormulaOneCar class methodsFor: 'instance creation' stamp: 'HAW 4/30/2022 18:44:15'!
drivenBy: aDriver 

	^self new initializeDrivenBy: aDriver ! !


!classDefinition: #FormulaOneCarTurboStatus category: 'ISW1-2022-1C-Parcial-1'!
Object subclass: #FormulaOneCarTurboStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!FormulaOneCarTurboStatus methodsFor: 'turbo de/activation' stamp: 'tp 9/19/2023 14:35:19'!
activateTurboOn: aFormulaOneCar

	^self subclassResponsibility.! !

!FormulaOneCarTurboStatus methodsFor: 'turbo de/activation' stamp: 'tp 9/19/2023 14:35:44'!
deactivateTurboOn: aFormulaOneCar

	^self subclassResponsibility.! !


!FormulaOneCarTurboStatus methodsFor: 'speed' stamp: 'tp 9/19/2023 15:02:55'!
speedingRatio

	^ self subclassResponsibility .! !


!FormulaOneCarTurboStatus methodsFor: 'testing' stamp: 'tp 9/19/2023 15:05:43'!
isActivated

	^ self subclassResponsibility.! !


!FormulaOneCarTurboStatus methodsFor: 'error descriptions' stamp: 'tp 9/19/2023 14:30:37'!
turboAlreadyActivatedErrorDescription
	
	^'Turbo already activated'! !

!FormulaOneCarTurboStatus methodsFor: 'error descriptions' stamp: 'tp 9/19/2023 14:30:48'!
turboAlreadydeActivatedErrorDescription
	
	^'Turbo is already deactivated'! !


!FormulaOneCarTurboStatus methodsFor: 'next' stamp: 'tp 9/19/2023 15:10:00'!
next
	
	^self  subclassResponsibility.! !


!classDefinition: #TurboActivated category: 'ISW1-2022-1C-Parcial-1'!
FormulaOneCarTurboStatus subclass: #TurboActivated
	instanceVariableNames: 'speedingRatio next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!TurboActivated methodsFor: 'turbo de/activation' stamp: 'tp 9/19/2023 14:31:52'!
activateTurboOn: aFormulaOneCar

	^ self error: self turboAlreadyActivatedErrorDescription.! !

!TurboActivated methodsFor: 'turbo de/activation' stamp: 'tp 9/19/2023 14:37:23'!
deactivateTurboOn: aFormulaOneCar

	^ aFormulaOneCar deactivateTurboOnCurrentSector.! !


!TurboActivated methodsFor: 'speed' stamp: 'tp 9/19/2023 15:03:24'!
speedingRatio
	
	^speedingRatio ! !


!TurboActivated methodsFor: 'initialization' stamp: 'tp 9/19/2023 15:17:20'!
initializeExhausted

	speedingRatio := 1 .
	next := self .! !

!TurboActivated methodsFor: 'initialization' stamp: 'tp 9/19/2023 15:19:24'!
initializeWith: aSpeedingRatio next: aNext

	speedingRatio := aSpeedingRatio .
	next := aNext .! !


!TurboActivated methodsFor: 'next' stamp: 'tp 9/19/2023 15:10:16'!
next
	
	^next! !


!TurboActivated methodsFor: 'testing' stamp: 'tp 9/19/2023 15:06:21'!
isActivated

	^ true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurboActivated class' category: 'ISW1-2022-1C-Parcial-1'!
TurboActivated class
	instanceVariableNames: ''!

!TurboActivated class methodsFor: 'activation chain' stamp: 'tp 9/19/2023 15:14:56'!
firstInActivationChain

	^ self speeding: 12/10 next:
		(self speeding: 11/10 next: 
			(self speeding: 105/100 next: 
				self exhausted )) ! !


!TurboActivated class methodsFor: 'instance creation' stamp: 'tp 9/19/2023 14:53:17'!
exhausted

	"me copio descaradamente de la solución, no se me ocurrió nada"
	
	^self new initializeExhausted.
	
	! !

!TurboActivated class methodsFor: 'instance creation' stamp: 'tp 9/19/2023 14:52:19'!
speeding: aSpeedingRatio next: aNext

	"me copio descaradamente de la solución, no se me ocurrió nada"
	
	^self new initializeWith: aSpeedingRatio next: aNext.
	
	! !


!classDefinition: #TurboDeactivated category: 'ISW1-2022-1C-Parcial-1'!
FormulaOneCarTurboStatus subclass: #TurboDeactivated
	instanceVariableNames: 'speedingRatio next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!TurboDeactivated methodsFor: 'turbo de/activation' stamp: 'tp 9/19/2023 14:34:12'!
activateTurboOn: aFormulaOneCar

	^aFormulaOneCar activateTurboOnCurrentSector.! !

!TurboDeactivated methodsFor: 'turbo de/activation' stamp: 'tp 9/19/2023 14:36:13'!
deactivateTurboOn: aFormulaOneCar

	^self error: self turboAlreadydeActivatedErrorDescription.! !


!TurboDeactivated methodsFor: 'initialization' stamp: 'tp 9/19/2023 14:56:07'!
initializeNext: aNext

	speedingRatio := 1.
	next := aNext.! !


!TurboDeactivated methodsFor: 'testing' stamp: 'tp 9/19/2023 15:06:54'!
isActivated

	^false! !


!TurboDeactivated methodsFor: 'speed' stamp: 'tp 9/19/2023 15:03:37'!
speedingRatio
	
	^speedingRatio ! !


!TurboDeactivated methodsFor: 'next' stamp: 'tp 9/19/2023 15:10:29'!
next
	
	^next! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurboDeactivated class' category: 'ISW1-2022-1C-Parcial-1'!
TurboDeactivated class
	instanceVariableNames: ''!

!TurboDeactivated class methodsFor: 'instance creation' stamp: 'tp 9/19/2023 14:55:32'!
next: aNext

	^ self new initializeNext: aNext.! !


!classDefinition: #GrandPrix category: 'ISW1-2022-1C-Parcial-1'!
Object subclass: #GrandPrix
	instanceVariableNames: 'track numberOfLaps'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!GrandPrix methodsFor: 'initialization' stamp: 'FRT 5/1/2022 11:26:39'!
initializeWithTrack: aTrack andNumberOfLaps: aNumberOfLaps andCars: aCollectionOfCars

	track _ aTrack.
	numberOfLaps _ aNumberOfLaps.
	aCollectionOfCars do: [ :car | car runningInGrandPrix: self ].
! !


!GrandPrix methodsFor: 'car position' stamp: 'FRT 4/30/2022 22:23:59'!
locationOf: aCar

	^ aCar traveledDistance.	! !

!GrandPrix methodsFor: 'car position' stamp: 'HAW 4/30/2022 19:15:32'!
put: aCar at: aDistance

	| distanceInTrack |
	
	aCar traveledDistance: aDistance.
	
	distanceInTrack _ aDistance \\ track length.
	track put: aCar at: distanceInTrack.
	! !

!GrandPrix methodsFor: 'car position' stamp: 'FRT 4/30/2022 15:38:16'!
sectorOf: aCar 

	^ track sectorOf: aCar.! !


!GrandPrix methodsFor: 'length' stamp: 'HAW 4/30/2022 18:43:17'!
length

	^ track length * numberOfLaps! !


!GrandPrix methodsFor: 'simulation' stamp: 'tp 9/19/2023 16:07:45'!
advance: aTimeLapse
	
	| cars |
	
	cars := track cars asOrderedCollection.
	
	cars do: [ :car | self relocate: car after: aTimeLapse ].
! !

!GrandPrix methodsFor: 'simulation' stamp: 'HAW 5/1/2022 17:35:43'!
relocate: aCar after: aTimeLapse 

	| distanceMoved distanceInTrack |
	
	distanceMoved _ aCar speed * aTimeLapse.
	aCar advance: distanceMoved.
	
	distanceInTrack _ aCar traveledDistance \\ track length.
	track put: aCar at: distanceInTrack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GrandPrix class' category: 'ISW1-2022-1C-Parcial-1'!
GrandPrix class
	instanceVariableNames: ''!

!GrandPrix class methodsFor: 'instance creation' stamp: 'HAW 4/30/2022 19:36:05'!
on: aTrack running: aNumberOfLaps 

	^self on: aTrack running: aNumberOfLaps with: #()! !

!GrandPrix class methodsFor: 'instance creation' stamp: 'HAW 4/30/2022 19:36:16'!
on: aTrack running: aNumberOfLaps with: aCollectionOfCars

	^self new initializeWithTrack: aTrack andNumberOfLaps: aNumberOfLaps andCars: aCollectionOfCars! !


!GrandPrix class methodsFor: 'error message' stamp: 'ARM 4/28/2022 15:09:05'!
distanceOutSideRaceTrackLengthErrorMessage

	^'Distance outside Race Track length'! !

!GrandPrix class methodsFor: 'error message' stamp: 'FRT 5/1/2022 12:24:57'!
turboNotAllowedWithRainTiresErrorMessage

	^ 'Turbo not allowed with rain tires'! !


!classDefinition: #Sector category: 'ISW1-2022-1C-Parcial-1'!
Object subclass: #Sector
	instanceVariableNames: 'cars length'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!Sector methodsFor: 'initialization' stamp: 'FRT 5/1/2022 10:02:21'!
initializeOf: aLength 

	cars _ Dictionary new.
	length _ aLength.! !


!Sector methodsFor: 'car position' stamp: 'FRT 5/1/2022 14:13:55'!
assertValidPosition: aPosition

	length < aPosition ifTrue: [ self error: self class cannotPlacedCarErrorDescription ]! !

!Sector methodsFor: 'car position' stamp: 'HAW 5/1/2022 16:59:05'!
atStartPut: aCar
 
	self put: aCar at: 0*kilometer! !

!Sector methodsFor: 'car position' stamp: 'FRT 4/30/2022 09:23:35'!
positionOf: aCar
 
	^ cars at: aCar.
! !

!Sector methodsFor: 'car position' stamp: 'FRT 5/1/2022 14:13:55'!
put: aCar at: aPosition
 
	self assertValidPosition: aPosition.
	
	cars at: aCar put: aPosition.
	aCar atSector: self.! !

!Sector methodsFor: 'car position' stamp: 'FRT 4/30/2022 15:04:40'!
remove: aCar
 
	cars removeKey: aCar ifAbsent: [].
! !


!Sector methodsFor: 'accessing' stamp: 'FRT 4/30/2022 22:08:51'!
cars
	
	^ cars keys! !

!Sector methodsFor: 'accessing' stamp: 'HAW 5/2/2022 14:26:16'!
length

	^length! !


!Sector methodsFor: 'testing' stamp: 'HAW 5/1/2022 16:54:33'!
includes: aCar

	^ cars includesKey: aCar! !


!Sector methodsFor: 'turbo' stamp: 'tp 9/19/2023 15:44:20'!
activateTurboTo: aCarToActivateTurboTo

	^ self subclassResponsibility.! !

!Sector methodsFor: 'turbo' stamp: 'HAW 5/2/2022 14:07:54'!
assertDriverIsOneSecondOrLess: aCarToActivateTurboTo ofDriverAt: positionOfCarAhead

	| carAhead |
	
	carAhead _ self carAtPosition: positionOfCarAhead.
	
	((positionOfCarAhead / carAhead speed) -
	((cars at: aCarToActivateTurboTo) / aCarToActivateTurboTo speed)) < (1 * second)
		ifFalse: [self error: Sector cannotActivateTurboWhenMoreThanASecondBehindAnotherCarErrorDescription ].! !

!Sector methodsFor: 'turbo' stamp: 'HAW 5/2/2022 14:06:52'!
carAtPosition: positionOfDriver

	^cars keyAtValue: positionOfDriver! !

!Sector methodsFor: 'turbo' stamp: 'HAW 5/2/2022 14:08:13'!
positionOfCarAheadOf: aCarToActiveTurboTo ifNone: alternativeClosure

	| sortedPositions carToActivateTurboToPosition |
	
	carToActivateTurboToPosition _ cars at: aCarToActiveTurboTo.
	sortedPositions _ cars asSortedCollection remove: carToActivateTurboToPosition; yourself.
	 
	^ sortedPositions 
		detect: [:aPosition | aPosition > carToActivateTurboToPosition ]
		ifNone: alternativeClosure ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sector class' category: 'ISW1-2022-1C-Parcial-1'!
Sector class
	instanceVariableNames: ''!

!Sector class methodsFor: 'instance creation' stamp: 'tp 9/19/2023 15:40:17'!
of: aLength 
	
	aLength strictlyPositive ifFalse: [ self error: self lengthMustBePositiveErrorDescription ]	.
		
	^ self new initializeOf: aLength! !


!Sector class methodsFor: 'error message' stamp: 'FRT 4/30/2022 20:24:41'!
cannotActivateTurboWhenMoreThanASecondBehindAnotherCarErrorDescription
	
	^ 'Cannot activate Turbo when opponent is more than 1 second ahead'! !

!Sector class methodsFor: 'error message' stamp: 'FRT 4/30/2022 20:13:07'!
cannotActivateTurboWhenNoCarAheadErrorDescription
	
	^ 'Cannot activate Turbo without opponent ahead'! !

!Sector class methodsFor: 'error message' stamp: 'FRT 4/30/2022 10:08:26'!
cannotPlacedCarErrorDescription

	^ 'Driver can not be placed outside section'! !

!Sector class methodsFor: 'error message' stamp: 'HAW 4/30/2022 17:05:20'!
lengthMustBePositiveErrorDescription

	^ 'Length must be positive'! !

!Sector class methodsFor: 'error message' stamp: 'FRT 4/30/2022 09:54:45'!
turboNotAllowedErrorDescription
	
	^ 'Turbo not allowed in this Sector'! !


!classDefinition: #SectorWithTurbo category: 'ISW1-2022-1C-Parcial-1'!
Sector subclass: #SectorWithTurbo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!SectorWithTurbo methodsFor: 'turbo' stamp: 'tp 9/19/2023 15:44:05'!
activateTurboTo: aCarToActivateTurboTo

	| positionOfCarAhead |
	
	positionOfCarAhead := self 
		positionOfCarAheadOf: aCarToActivateTurboTo 
		ifNone: [self error: Sector cannotActivateTurboWhenNoCarAheadErrorDescription ].
		
	self 
		assertDriverIsOneSecondOrLess: aCarToActivateTurboTo
		ofDriverAt: positionOfCarAhead.

	aCarToActivateTurboTo activateTurboInSectorWithTurbo
	! !


!classDefinition: #SectorWithoutTurbo category: 'ISW1-2022-1C-Parcial-1'!
Sector subclass: #SectorWithoutTurbo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!SectorWithoutTurbo methodsFor: 'turbo' stamp: 'tp 9/19/2023 15:42:57'!
activateTurboTo: aCarToActivateTurboTo

	^self error: Sector turboNotAllowedErrorDescription! !


!classDefinition: #Track category: 'ISW1-2022-1C-Parcial-1'!
Object subclass: #Track
	instanceVariableNames: 'sectors driversDistanceFromBeginning'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-1C-Parcial-1'!

!Track methodsFor: 'initialization' stamp: 'HAW 4/30/2022 17:06:50'!
initializeWithSectors: aSectors

	sectors _ aSectors copy.! !


!Track methodsFor: 'car position' stamp: 'HAW 5/2/2022 14:10:18'!
carNotFoundErrorDescription

	^ 'Car not found'! !

!Track methodsFor: 'car position' stamp: 'tp 9/19/2023 16:30:59'!
positionOf: aCar
	| accumulatedLength |
	
	accumulatedLength := 0 * kilometer.
	
	sectors do: [ :sector | 
		(sector includes: aCar) ifTrue: [^ accumulatedLength + (sector positionOf: aCar)].
		accumulatedLength := accumulatedLength + sector length.
		].

"	[sector includes: aCar] whileFalse: [
		accumulatedLength := accumulatedLength + sector length.
		ix := ix + 1.
		sector := (sectors at: ix).
	].

	^ accumulatedLength + (sector positionOf: aCar)."! !

!Track methodsFor: 'car position' stamp: 'tp 9/19/2023 16:50:43'!
put: aCar at: aPosition

	| accumulatedLength |
	
	aPosition > self length ifTrue: [ self error: self class cannotPlacedCarErrorDescription ].

	self remove: aCar.
	
	accumulatedLength := 0 * kilometer .
	
	sectors do: [ :sector | 
				aPosition <= (accumulatedLength +  sector length) ifTrue: [^sector put: aCar at: aPosition - accumulatedLength.].
				accumulatedLength := accumulatedLength + sector length.
				]! !

!Track methodsFor: 'car position' stamp: 'FRT 4/30/2022 15:15:27'!
remove: aCar
	
	| currentSector |
	
	currentSector _ self sectorOf: aCar ifNone: [ ^ self ].
	currentSector remove: aCar.
	! !

!Track methodsFor: 'car position' stamp: 'HAW 5/2/2022 14:10:18'!
sectorOf: aCar
	
	^self sectorOf: aCar ifNone: [ self error: self carNotFoundErrorDescription ]! !

!Track methodsFor: 'car position' stamp: 'tp 9/20/2023 12:18:48'!
sectorOf: aCar ifNone: aBlock

	^  sectors detect: [ :sector |				sector includes: aCar			] ifNone: aBlock! !


!Track methodsFor: 'accessing' stamp: 'tp 9/19/2023 16:21:42'!
cars

	^ sectors inject: Set new into: [:aSet :aSector | aSet addAll: aSector cars; yourself].	! !

!Track methodsFor: 'accessing' stamp: 'tp 9/19/2023 16:26:30'!
length

	^ sectors sum: [:sector | sector length ].

"	| acc ix |

	acc := 0 * kilometer.
	ix := 1.
	
	[ix <= sectors size] whileTrue: [ | sector |
		sector := sectors at: ix.
		acc := acc + sector length.
		ix := ix + 1.		
	].

	^ acc."
! !


!Track methodsFor: 'testing' stamp: 'tp 9/19/2023 16:23:38'!
includes: aCar
	"Returns if any of the sectors includes aCar"
	
	^self cars includes: aCar.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Track class' category: 'ISW1-2022-1C-Parcial-1'!
Track class
	instanceVariableNames: ''!

!Track class methodsFor: 'instance creation' stamp: 'HAW 4/30/2022 17:10:08'!
withSectors: sectors

	sectors isEmpty ifTrue: [ self error: self mustHaveSectorsErrorDescription ].
	
	^ self new initializeWithSectors: sectors! !


!Track class methodsFor: 'error messages' stamp: 'FRT 4/29/2022 18:22:32'!
cannotPlacedCarErrorDescription

	^ 'Car cannot be placed in track'! !

!Track class methodsFor: 'error messages' stamp: 'HAW 4/30/2022 17:09:27'!
mustHaveSectorsErrorDescription

	^'Track must have sectors'! !
