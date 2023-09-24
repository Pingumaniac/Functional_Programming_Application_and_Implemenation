#lang racket

(define ones
  (cons 1 (delay ones)))
