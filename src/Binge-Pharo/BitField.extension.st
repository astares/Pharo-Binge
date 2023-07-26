Extension { #name : #BitField }

{ #category : #'*Binge-Pharo' }
BitField >> inspectorExtension [
	<inspectorPresentationOrder: 0 title: 'BitField'>

	| specTable |
	specTable := SpTablePresenter new.

	1 to: numberOfBits do: [ :index |
		specTable addColumn: (SpStringTableColumn new
			title: (numberOfBits + 1 - index) asString;
			width: 22;
			evaluated: [ :each | (each at: index) asString ];
			beNotExpandable) ].

	specTable items: (Array with: self printString).
	^ specTable
]
