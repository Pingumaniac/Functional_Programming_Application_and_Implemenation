# Notes

##  SECD machine

* Operated by two stacks: "one stack is used to hold intermediate values, the other (called the dump) is used to save values of the first stack and the other information which amounts to the suspended activation record. (166)"

## Four principle registers

1. stack - "used to hold intermediate results when computing the values of expressions (167)"
2. environment - "used to hold the values bound to variables during evaluation (167)"
3. control list - "used to hold the machine-language program being executed (167)"
4. dump - "used as a stack to save values of other registers on calling new function (167)"

## Set of instructions

1. *LD* - load
2. *LDC* - load constant
3. *LDF* - load function
4. *AP* - apply function
5. *RTN* - return
6. *DUM* - create dummy environment
7. *RAP* - recursive apply
8. *SEL* - select subcontrol
9. *JOIN* - rejoin subcontrol
10. *CAR* - take car of item on top of stack
11. *CDR* - take cdr of item on top of stack
12. *ATOM* - apply atom predicate to top stack item
13. *CONS* - form cons of top two stack items
14. *EQ* - apply eq predicate to top two stack items
15. *ADD* *SUB* *MUL* *DIV* *REM* *LEQ* - apply arithmetic operation to top two stack items
16. *STOP* - stop

## Some points about exec(compile(f), a))

1. "The definition is preise about important features of the language. For example, the parameter mechanism defined is what is usually referred to as call by value. (192)"
2. "Many well-formed expressions are given a meaning where none is intended. For example, function calls with too many actual parameters. (192)"
3. "Some well-formed expressions are not given a meaning where one is possible. For example, the partial definition of LETREC. (192)"
4. "Some special cases of well-formed expressions, whose meaning we might not consider intuitive, are given a reasonable or acceptable meaning by this definition. For example, a function with no parameters. (192)"
