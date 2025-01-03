Class {
	#name : #Matrix,
	#superclass : #Object,
	#instVars : [
		'rows',
		'cols'
	],
	#category : #SparseMatrix
}

{ #category : #transformation }
Matrix >> transformToCompactMatrix: sparseMatrix [
    | size compactMatrix k |
    
    size := 0. "This will store the number of non-zero elements in the sparse matrix."
 "Iterate through each element in the sparse matrix to count the non-zero values"
    1 to: sparseMatrix size do: [:i |
        1 to: (sparseMatrix at: i) size do: [:j |
            ((sparseMatrix at: i) at: j) ~= 0 ifTrue: [size := size + 1].
        ].
    ].
    "Initialize the dimensions of the compact matrix"
    rows := 3.
    cols := size.
    compactMatrix := Array new: rows.
    1 to: rows do: [:i |
        compactMatrix at: i put: (Array new: cols).
    ].

    "Initialize the index 'k' to track the position in the compact matrix"
    k := 1.
    "Fill the compact matrix with the non-zero elements from the sparse matrix"
    1 to: sparseMatrix size do: [:i |
        1 to: (sparseMatrix at: i) size do: [:j |
            ((sparseMatrix at: i) at: j) ~= 0 ifTrue: [
                (compactMatrix at: 1) at: k put: i.
                (compactMatrix at: 2) at: k put: j.
                (compactMatrix at: 3) at: k put: ((sparseMatrix at: i) at: j).
                k := k + 1.
            ].
        ].
    ].
    ^compactMatrix
]

{ #category : #transformation }
Matrix >> transformToSparseMatrix: compactMatrix from: sparseMatrix [
    | sparseMatrixReconstructed rows cols |
    
    "Get the number of rows and columns directly from the original sparse matrix"
    rows := sparseMatrix size.
    cols := (sparseMatrix first size).
    
    "Initialize the sparse matrix with zeros"
    sparseMatrixReconstructed := Array new: rows.
    1 to: rows do: [:i |
        sparseMatrixReconstructed at: i put: (Array new: cols withAll: 0).
    ].
    
    "Fill the sparse matrix with non-zero values from the compact matrix"
    1 to: (compactMatrix first size) do: [:i |
        | row col value |
        row := (compactMatrix at: 1) at: i.
        col := (compactMatrix at: 2) at: i.
        value := (compactMatrix at: 3) at: i.
        (sparseMatrixReconstructed at: row) at: col put: value.
    ].
    
    ^sparseMatrixReconstructed

]
