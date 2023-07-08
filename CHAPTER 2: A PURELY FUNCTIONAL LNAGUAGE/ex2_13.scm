#lang scheme
;; (A.B.NIL)).((C.(D.NIL)).NIL)) = ((A B) (C D))
;; (((A.NIL).NIL).B) = (((A)).B)
;; (A B C.(D E F.NIL)) = (A B C D E F)
;; ((A.B).(C.D)) = ((A.B) C.D)