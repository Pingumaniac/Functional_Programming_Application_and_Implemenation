# Notes

##  SECD machine

* Operated by two stacks: "one stack is used to hold intermediate values, the other (called the dump) is used to save values of the first stack and the other information which amounts to the suspended activation record. (166)"

## Four principle registers

1. stack - "used to hold intermediate results when computing the values of expressions (167)"
2. environment - "used to hold the values bound to variables during evaluation (167)"
3. control list - "used to hold the machine-language program being executed (167)"
4. dump - "used as a stack to save values of other registers on calling new function (167)"
