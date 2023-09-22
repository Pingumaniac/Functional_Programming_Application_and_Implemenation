#lang racket

#|
Scope of Variables:
d1 and d2 in dim: Limited to the let block inside the dim function.
d in reduce: Limited to the scope of the reduce function.
x, y, and z in threelist: Limited to the scope of the threelist function.
t and b in twolist: Limited to the scope of the twolist function.
d in red, num, dem: Limited to the scope of each respective function.
t, b, dl in red: Limited to the let block in red.
x and lst in remove: Limited to the scope of the remove function.
s, a, b in sing: Limited to the scope of the sing function.
p in sing: Limited to the let block in sing.
s in singletons: Limited to the scope of the singletons function.

Organization of Function Declarations:
atom?
assoc
mass
length
time
same
threelist
product
ratio
dim
reduce
twolist
num
dem
red
remove
sing
singletons

|#