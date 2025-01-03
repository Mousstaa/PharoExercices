Class {
	#name : #PharoDoc,
	#superclass : #Object,
	#category : #PharoDocGenerator
}

{ #category : #documentation }
PharoDoc >> generatePackageDocumentation: packageName [
    "Generates JavaDoc-like documentation for all classes in the given package, including superclass and subclasses"
    | doc classes allPackages matchingPackages exactPackage filePath |
    doc := String new.

    "Get all available packages and find matches"
allPackages := RPackageOrganizer default packages.
    matchingPackages := allPackages select: [:each | 
        each name asLowercase includesSubstring: packageName asLowercase].
    exactPackage := allPackages detect: [:each | each name = packageName] ifNone: [nil].

    "shows suggestions if there's no exact matches"
    exactPackage ifNil: [
        matchingPackages isEmpty
            ifTrue: [^'No packages found matching: ', packageName, 
                     String cr, 'Please verify the package name exists.']
            ifFalse: [^'Package "', packageName, '" not found.', String cr,
                     'Did you mean one of these?', String cr,
                     (String cr join: (matchingPackages collect: [:pkg | pkg name]))]
    ].

    "Get all classes in the package"
    classes := Smalltalk globals allClasses select: [:each | 
        each package name = packageName].
        
    "Check if package has any classes"
    classes isEmpty ifTrue: [
        ^'Package exists but contains no classes: ', packageName
    ].

    "Package header"
    doc := doc, 'Package: ', packageName, String cr, String cr.

    "Document each class in the package"
    classes do: [:class |
        | superclass subclasses |
        doc := doc, '====================', String cr.
        doc := doc, 'Class: ', class name, String cr.
        doc := doc, 'Description: ', (class comment
            ifNil: ['"No documentation for the given class has been provided"']),
            String cr.
        
        "Superclass"
        superclass := class superclass.
        doc := doc, 'Superclass: ', (superclass ifNil: ['None'] ifNotNil: [superclass name]), String cr.
        
        "Subclasses"
        subclasses := class subclasses.
        doc := doc, 'Subclasses: ', (subclasses isEmpty 
         ifTrue: ['None'] 
         ifFalse: [String streamContents: [:stream | subclasses do: [:each | stream nextPutAll: each name; nextPut: $,]]]), String cr.

        doc := doc, String cr, 'Methods:', String cr.
        class methodDictionary valuesDo: [:method |
            doc := doc, '- ', method selector, String cr.
            doc := doc, 'Description: ', (method comment
                ifNil: ['"No documentation for the given method has been provided"']),
                String cr
        ].
        doc := doc, String cr
    ].

    "Write documentation to a file"
    filePath := FileSystem workingDirectory / (packageName, '_Documentation.txt').
    filePath writeStreamDo: [:stream | stream nextPutAll: doc].

    ^'Documentation for ', packageName, ' has been written to: ', filePath fullName

]
