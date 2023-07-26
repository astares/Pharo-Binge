"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfBinge,
	#superclass : #PackageManifest,
	#category : #'BaselineOfBinge-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfBinge class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#BaselineOfBinge)) #'2023-07-26T16:15:29.329521+02:00') )
]
