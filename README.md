# PharoExercices

# Sparse Matrix Transformation

This repository contains a class `Matrix` that provides methods for transforming sparse matrices to compact matrices and vice versa. The `Matrix` class is used to demonstrate the conversion of sparse matrices, which are matrices that have many zero values, to a more space-efficient format. The repository also includes tests to validate these transformations.


## Classes and Methods

### `Matrix` Class

The `Matrix` class contains two primary methods for transforming matrices:

- **`transformToCompactMatrix: sparseMatrix`**  
  Converts a sparse matrix to a compact matrix format, storing only the non-zero elements' row indices, column indices, and values.

- **`transformToSparseMatrix: compactMatrix from: sparseMatrix`**  
  Reconstructs the sparse matrix from the compact matrix format.

### Test Case: `testTransformAndReconstruct`

This method tests the functionality of both transformations:
1. It defines a sample sparse matrix.
2. It compares the generated compact matrix with the expected result.
3. It then reconstructs the sparse matrix from the compact matrix and verifies if it matches the original sparse matrix.



### UML Diagram



# PharoDocGenerator

PharoDocGenerator is for generating JavaDoc-like documentation for Pharo packages, classes, their variables and their methods. It automatically generates documentation by analyzing the provided package, documenting the classes within it, their superclasses, subclasses, and the methods with their descriptions.

## Classes and Methods

### `PharoDoc` Class

The `PharoDoc` class is used for generating documentation for Pharo packages and their contents. It includes methods for traversing classes, methods, and comments, and outputting this information in a structured format.

- **`initialize`**  
  Initializes the `PharoDoc` instance by setting up necessary variables and data structures.

- **`generatePackageDocumentation: package`**  
  Generates documentation for a given package by retrieving information about its classes, methods, and other components. The method uses information about the classes in the package, their methods, and adds comments for each class and method in the generated documentation.

### Test Case: `PharoDocTest`

The `PharoDocTest` class is a test suite for validating the functionality of `PharoDoc`. It verifies that the generated documentation meets the expected format and content.

- **`testGeneratePackageDocumentation`**  
  This test method is used to test the functionality of `PharoDoc`'s `generatePackageDocumentation`. It:
  1. Creates instances of test classes and assigns comments.
  2. Calls the `generatePackageDocumentation` method to produce documentation.
  3. Compares the generated documentation with expected content to ensure correctness.

## Usage

To generate documentation for a package, use the following code:

```smalltalk
| docGenerator result |
docGenerator := PharoDoc new.
result := docGenerator generatePackageDocumentation: 'YourPackageName'.
```

This will generate a text file containing the documentation for the specified package.

## Test

PharoDocGenerator includes a unit test (using `TestCase`) to verify the correctness of the documentation. You can run the tests to ensure everything works as expected:

```smalltalk
PharoDocTest run.
```
