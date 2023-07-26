"
Baseline for [https://github.com/astares/Binge/](https://github.com/astares/Binge/)
"
Class {
	#name : #BaselineOfBinge,
	#superclass : #BaselineOf,
	#category : #'BaselineOfBinge-Base'
}

{ #category : #baselines }
BaselineOfBinge >> baseline: spec [

	<baseline>
	spec for: #'common' do: [
		"Packages"
		spec package: 'Binge-Core'.
		spec package: 'Binge-Core-Tests' with: [ spec requires: #('Binge-Core')].

		"Groups"
		spec
				group: 'Core' with: #('Binge-Core');
				group: 'Tests' with: #('Binge-Core-Tests');
				group: 'all' with: #('Core' 'Tests');
				group: 'default' with: #('all')

	]
]
