#lang racket

#|
Recipes have the following property:
when a list with delayed cdrs has been forced, it comes to be represented by a list
with alternate cons and recipe type records.

The concept of a recipe could be implemented as to avoid this phenomenon and to present the list,
once it has been forced, as normal, in the following way.

We should internally maintain two lists.
The first list is the delayed list.
The second list is the list that stores the evaluated elements once they are forced.
In other words, each time force is called, elements from the first list would be stored to
the second list after being evaluated.
Once the first list becomes empty (all elements have been forced),
the entire structure will be represented as a normal list.
|#