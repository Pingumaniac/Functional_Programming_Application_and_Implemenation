#lang racket

#|
cf e = if isrecipe(e) then force e else e

where cf = conditional force

This cannot be used in place of any of the uses of rf in the transformation rules for lazy evaluation,.
This is because rf is designed to handle specific computation stages.
Replacing it with cf can force more or less evaluations than needed.
|#