Class {
	#name : #PharoDocTest,
	#superclass : #TestCase,
	#category : #'PharoDocGenerator-Tests'
}

{ #category : #tests }
PharoDocTest >> testGeneratePackageDocumentation [ 
    | package testClass subclass1 subclass2 generator result filePath doc |
"define the name of the package to be documented"
package := 'PharoDocGenerator'.

"Create test classes in the package for extra testing"
testClass := Object subclass: #TestClass
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    package: package.

subclass1 := testClass subclass: #SubClass1
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    package: package.

subclass2 := testClass subclass: #SubClass2
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    package: package.

"Add comments to the test class and methods"
testClass comment: 'This is a test class for documentation generation.'.

(testClass compile: 'testMethod1 "Test method 1"' classified: #testing).
(testClass compile: 'testMethod2 "Test method 2"' classified: #testing).

"Run the generator to generate the documentation file"
generator := PharoDoc new.
result := generator generatePackageDocumentation: package.

"Verify result string"
self assert: (result includesSubstring: 'Documentation for ',package,' has been written to:').

"Verify the generated documentation content"
filePath := FileSystem workingDirectory / (package,'_Documentation.txt').
doc := filePath contents.

self assert: (doc includesSubstring: 'Class: TestClass').
self assert: (doc includesSubstring: 'Superclass: Object').
self assert: (doc includesSubstring: 'Subclasses: SubClass1,SubClass2').
self assert: (doc includesSubstring: 'Description: This is a test class for documentation generation.').
self assert: (doc includesSubstring: '- testMethod1').
self assert: (doc includesSubstring: '- testMethod2').

"Remove Created subclasses and testClass"
testClass removeFromSystem.
subclass1 removeFromSystem.
subclass2 removeFromSystem.
"filePath delete."
]
