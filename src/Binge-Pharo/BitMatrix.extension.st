Extension { #name : #BitMatrix }

{ #category : #'*Binge-Pharo' }
BitMatrix >> inspectorExtension [
	<inspectorPresentationOrder: 0 title: 'BitMatrix'>

	| specTable numberOfBits |
	specTable := SpTablePresenter new.
	numberOfBits := self rows first numberOfBits.
	1 to: numberOfBits do: [ :index |
		specTable addColumn: (SpStringTableColumn new
			title: (numberOfBits + 1 - index) asString;
			width: 22;
			evaluated: [ :each | (each at: index) asString ];
			beNotExpandable) ].

	specTable items: (self rows collect: [:each | each printString]).
	^ specTable
]
