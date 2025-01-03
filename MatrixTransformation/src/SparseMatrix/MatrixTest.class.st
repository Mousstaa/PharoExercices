Class {
	#name : #MatrixTest,
	#superclass : #TestCase,
	#category : #'SparseMatrix-Tests'
}

{ #category : #tests }
MatrixTest >> testTransformAndReconstruct [ 
    | sparseMatrix builder expectedCompactMatrix actualCompactMatrix reconstructedMatrix |
    
    builder := Matrix new.
    
    "Define the sparse matrix"
    sparseMatrix := #(
        #(0 0 3 0 4 0 0)
        #(0 0 5 7 0 0 0)
        #(0 0 0 0 0 0 0)
        #(0 2 6 0 0 0 0)
        #(0 0 0 0 0 0 0)
    ).
    
    "Define the expected compact matrix"
    expectedCompactMatrix := #(
        #(1 1 2 2 4 4)    "Rows of non-zero elements"
        #(3 5 3 4 2 3)    "Columns of non-zero elements"
        #(3 4 5 7 2 6)    "Values of non-zero elements"
    ).
    
    "Perform the transformation to compact matrix"
    actualCompactMatrix := builder transformToCompactMatrix: sparseMatrix.

    "Show original and compact matrices"
    Transcript show: 'Original Sparse Matrix: '; show: sparseMatrix printString; cr.
    Transcript show: 'Expected Compact Matrix: '; show: expectedCompactMatrix printString; cr.
    Transcript show: 'Generated Compact Matrix:   '; show: actualCompactMatrix printString; cr.
    
    "Compare the compact matrix and verify results"
    (actualCompactMatrix = expectedCompactMatrix)
        ifTrue: [Transcript show: 'Compact Matrix Generated Successfully!'; cr]
        ifFalse: [Transcript show: 'Test Failed!'; cr].

    "Reconstruct the sparse matrix from the compact matrix and show it"
    reconstructedMatrix := builder transformToSparseMatrix: actualCompactMatrix from: sparseMatrix.
    Transcript show: 'Reconstructed Sparse Matrix: '; show: reconstructedMatrix printString; cr.
    
    "Compare the reconstructed sparse matrix with the original sparse matrix"
    (reconstructedMatrix = sparseMatrix)
        ifTrue: [Transcript show: 'Reconstruction Test Passed!'; cr]
        ifFalse: [Transcript show: 'Reconstruction Test Failed!'; cr].

]
