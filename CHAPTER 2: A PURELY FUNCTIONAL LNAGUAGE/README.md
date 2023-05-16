# Notes

S-expressions -> used for the expression of functional programs

1. Parentheses is used
2. Constructed from elementary items called atoms
3. Atoms are of two types: (a) symbolic, (b) numeric
4. Symbolic atoms are not divisible. The only operation to be performed on symbolic atoms are whether they are equal or different
5. The layout of the S-expression on the page, in particular the spacing, is not significant, except that it is necessary to have at least one space between adjacent atoms, in order to distinguish them.
6. The difficulty in reading very long S-expressions we shall see is far outweighed by the ease we have in processing them.
7. When writing a program probably the first consideration we will make is how our data are going to fit into the format of S-expressions.
8. Some primitive functions for dismantling and reassembling them are introduced to manipulate S-expressions.
9. In order to be able to process list of varying structure, it is necessary to be able to test S-expression values to determine (a) whether they are atoms or lists, and (b) whether they are equal.
10. Predicate -> returns true or false
11. Predicate can be used to test the symbolic value before we apply a function to it which would otherwise be undefined.
12. 
