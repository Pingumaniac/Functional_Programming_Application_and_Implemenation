#lang racket

(define (syllables w)
  (define vowels '("a" "e" "i" "o" "u"))
  (define (is-vowel? ch) (member ch vowels))
  
  (let loop ((w w) (current-syllable '()) (syllables '()))
    (if (null? w)
        (reverse (cons (reverse current-syllable) syllables))
        (let ((ch (car w)))
          (cond
            [(is-vowel? ch) 
             (loop (cdr w) (cons 'v current-syllable) syllables)]
            [else
             (if (and (not (null? current-syllable)) (eq? (car current-syllable) 'c))
                 (loop w '() (cons (reverse current-syllable) syllables))
                 (loop (cdr w) (cons 'c current-syllable) syllables))])))))
