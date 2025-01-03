# PharoExercices

This repository contains the two exercises as requested.

---

## Ex1: Sparse Matrix Transformation

This exercise includes a `Matrix` class with methods for transforming sparse matrices into a compact matrix format and vice versa. Sparse matrices are matrices with many zero values, and this transformation helps save space by storing only the non-zero elements. The repository also provides tests to validate these transformations.

### UML Diagram
![UML Diagram](Uml/Matrix.png)

## Classes and Methods

### `Matrix` Class

The `Matrix` class contains two methods for transforming matrices:

- **`transformToCompactMatrix: sparseMatrix`**  
  This method converts a sparse matrix into a compact matrix format. It stores only the non-zero values, including their row indices, column indices, and values.

- **`transformToSparseMatrix: compactMatrix from: sparseMatrix`**  
  This method reconstructs the sparse matrix from the compact matrix format.

### Test Case: `testTransformAndReconstruct`

This test method ensures the correctness of both transformations:
1. It defines a sparse matrix, can be modified as you like.
2. It compares the generated compact matrix with the expected result.
3. It then reconstructs the sparse matrix from the compact matrix and checks if it matches the original sparse matrix.

---

## Ex2: PharoDocGenerator

PharoDocGenerator is a tool designed to automatically generate JavaDoc-like documentation for Pharo packages, classes, their variables, and methods. It analyzes the given package and documents its contents, including the classes, superclasses, subclasses, and the methods with their descriptions.

### UML Diagram
![UML Diagram](Uml/PharoDoc.png)

## Classes and Methods

### `PharoDoc` Class

The `PharoDoc` class is used to generate documentation for Pharo packages and their contents. It traverses classes, methods, and comments, then outputs the information in a structured format.

- **`initialize`**  
  Initializes the `PharoDoc` instance by setting up necessary variables and data structures.

- **`generatePackageDocumentation: package`**  
  This method generates documentation for a given package. It retrieves information about the classes in the package, their methods, and any comments, and then creates a detailed documentation file.

### Test Case: `PharoDocTest`

The `PharoDocTest` class is a unit test to validate `PharoDoc`. It ensures the generated documentation matches the expected format.

- **`testGeneratePackageDocumentation`**  
  This method tests the functionality of `PharoDoc`'s `generatePackageDocumentation`. It:
  1. Creates test classes and assigns comments.
  2. Calls `generatePackageDocumentation` to produce documentation.
  3. Compares the generated documentation with the expected output to verify correctness.

## Usage

To generate documentation for a package, use the following code:

```smalltalk
| docGenerator result |
docGenerator := PharoDoc new.
result := docGenerator generatePackageDocumentation: 'YourPackageName'.
