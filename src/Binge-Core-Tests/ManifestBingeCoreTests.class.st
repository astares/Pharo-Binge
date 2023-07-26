"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBingeCoreTests,
	#superclass : #PackageManifest,
	#category : #'Binge-Core-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestBingeCoreTests class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestBingeCoreTests class' #ManifestBingeCoreTests)) #'2023-07-26T13:33:30.180386+02:00') )
]

{ #category : #'code-critics' }
ManifestBingeCoreTests class >> ruleUtilityMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#BinaryStreamReaderTest #readerFor: #false)) #'2023-07-26T13:30:14.073167+02:00') )
]
