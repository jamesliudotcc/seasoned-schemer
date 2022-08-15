#lang racket

(require test-engine/racket-tests)

(define sum-of-prefixes-b
  (λ (previous-sum tup)
    (cond
      ((null? tup) '())
      (else (cons (+ previous-sum (car tup))
                  (sum-of-prefixes-b
                   (+ previous-sum (car tup))
                   (cdr tup)))))))

(define sum-of-prefixes
  (λ (tup)
    (cond
      ((null? tup) '())
      ((null? (cdr tup)) tup)
      (else (cons
             (car tup)
             (sum-of-prefixes-b (car tup) (cdr tup)))))))

(check-expect
 (sum-of-prefixes '())
 '())

(check-expect
 (sum-of-prefixes '(1))
 '(1))
              
(check-expect
 (sum-of-prefixes '(2 1 9 17 0))
 '(2 3 12 29 29))