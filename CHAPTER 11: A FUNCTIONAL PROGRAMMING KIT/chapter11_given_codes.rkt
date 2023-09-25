#lang racket

; Converted pseudocode into Racket

; Defining global variables
(define p '())
(define null '())
(define fn '())
(define args '())
(define result '())
(define token "")
(define type "")
(define inbuffer "")
(define inbufptr 0)
(define inbufend 0)
(define outbuffer "")
(define outbufptr 0)

(define ivalue (make-hash))
(define svalue (make-hash))

; Initialize p
(set! p 'symbol)
(hash-set! svalue p "LAMBDA")

; Initialize procedure
(define (initialize p)
  (cond
    [(symbol? p) (hash-set! svalue p " ")]
    [(number? p) (define ivalue (make-hash)) (hash-set! ivalue p 0)]
  )
)

; Update p
(set! p (cons 'symbol 'number))
(hash-set! svalue (car p) "LAMBDA")
(hash-set! ivalue (cdr p) 17)

; Initialize null
(set! null 'symbol)
(hash-set! svalue null "NULL")

; Procedure scan
(define (scan)
  ; Placeholder for gettoken function
  (define (gettoken) (values ")" "ENDFILE"))
  
  (let-values ([(t ty) (gettoken)])
    (set! token t)
    (set! type ty)
    (when (equal? type "ENDFILE")
      (set! token ")")
    )
  )
)

; Procedure getexp
(define (getexp e)
  (cond
    [(equal? token "(")
     (begin (scan) (getexplist e) (scan))]
    [(equal? type "NUMERIC")
     (begin
       (set! e 'number)
       (hash-set! ivalue e (string->number token))
       (scan))]
    [else
     (begin
       (set! e 'symbol)
       (hash-set! svalue e token)
       (scan))]
    )
  )

; Procedure getexplist
(define (getexplist)
  (let loop ([e null])
    (let ([new-e (getexp)])
      (cond
        [(equal? token ".")
         (begin (scan)
                (cons e (getexp)))]
        [(equal? token ")")
         e]
        [else
         (loop (append e (list new-e)))]))))

(define (getchar)
  (when (> inbufptr inbufend)
    (set! inbuffer (read-line))
    (set! inbufend (string-length inbuffer))
    (set! inbufptr 0))
  (let ([ch (string-ref inbuffer inbufptr)])
    (set! inbufptr (+ inbufptr 1))
    ch))

(define (putchar c)
  (when (= outbufptr 80)
    (display outbuffer)
    (newline)
    (set! outbufptr 0))
  (set! outbuffer (string-append outbuffer (string c)))
  (set! outbufptr (+ outbufptr 1)))

(define (forcelineout)
  (display outbuffer)
  (newline)
  (set! outbufptr 0))

(define (puttoken tkn)
  (let ([len (string-length tkn)])
    (for ([i (in-range len)])
      (putchar (string-ref tkn i)))
    (putchar #\space)))

(define (putexp e)
  (cond
    [(symbol? e) (puttoken (hash-ref svalue e))]
    [(number? e) (puttoken (number->string (hash-ref ivalue e)))]
    [else
     (puttoken "C")
     (let loop ([p e])
       (when (pair? p)
         (putexp (car p))
         (set! p (cdr p)))
       (unless (and (symbol? p) (string=? (hash-ref svalue p) "NULL"))
         (puttoken ".")
         (putexp p)))
     (puttoken ")")]))

(define (gettoken)
  (set! token "")
  (letrec ([loop (lambda (ch)
                   (if (and (not (eof-object? ch)) (char=? ch #\space))
                       (loop (getchar))
                       ch))])
    (let ([ch (loop (getchar))])
      (if (eof-object? ch)
          (set! type "ENDFILE")
          (cond
            [(or (char-numeric? ch) (char=? ch #\-))
             (set! type "NUMERIC")
             (set! token (string-append token (string ch)))]
            [(char-alphabetic? ch)
             (set! type "ALPHANUMERIC")
             (set! token (string-append token (string ch)))]
            [else
             (set! type "DELIMITER")
             (set! token (string-append token (string ch)))]
          )))))

(define (tointeger t)
  (let loop ([i (if (string=? "-" (substring t 0 1)) 1 0)]
             [s 0])
    (if (>= i (string-length t))
        (if (string=? "-" (substring t 0 1)) (- s) s)
        (loop (+ i 1) (+ (* s 10) (string->number (string (string-ref t i))))))))

(define (tostring i)
  (let loop ([i (abs i)] [t ""] [neg? (< i 0)])
    (if (= i 0)
        (if (string=? t "")
            (if neg? "-0" "0")
            (if neg? (string-append "-" t) t))
        (loop (quotient i 10) (string-append (number->string (remainder i 10)) t) neg?))))
