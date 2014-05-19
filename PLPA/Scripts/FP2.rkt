;; FP2.rkt
;; Rasmus Bækgaard <10893@iha.dk> 10893
;;


;;Task 1
(define task1 
  (lambda (lst1 lst2 acc)
    (if (or (null? lst2) (null? lst1))
        acc
        (task1 (cdr lst1) 
               (cdr lst2) 
               (cons (cons (car lst1) (car lst2)) acc )
               )
    )))

(define zip 
  (letrec ((acc '()))
    (lambda (lst1 lst2)
      (reverse (task1 lst1 lst2 acc)))))
    
;; To check with
;(zip '(1 2) '(a b))
;(zip '(1 2 3) '(a b))
;(zip '(1 2 3) '(a b c))



;;Task 2

;fold
(define foldl
  (lambda (proc acc lst)
    (if (null? lst)
        acc
        (foldl proc
               (proc acc (car lst))
               (cdr lst)))))

; filter
(define foldlFilter
    (lambda (proc lst)
      (reverse (foldl 
       (lambda (acc val)
           (if (proc val)
               (cons val acc)
               acc))
       '() lst)
      )))


;(foldlFilter positive? '(1 2 3 -4))

; sumprod

(define sumprod
    (lambda (lst1 lst2)
      (foldl 
       (lambda (x y)
         (+ x (* (cdr y) (car y))))
       0 (zip lst1 lst2))
      ))
        
;(sumprod '(1 2 3) '(4 5 6))



;Dedup
(define dedup
    (lambda (lst)
      (if (null? lst)
          '()
      (reverse (foldl
       (lambda (x y)
         (if (equal? (car x) y)
             x
             (cons y x)))
              (list (car lst)) lst))
      )))

;(dedup '(1 1 1 2 3 3))
;(dedup '())
  
  
;; Task 3

(define foldr
  (lambda (proc lst acc)
    (if (null? lst)
        acc
        (proc (car lst)
              (foldr proc (cdr lst) acc)))))
  

;;Part1:
; Map
(define foldMap
  (lambda (proc lst)
    (foldr
     (lambda (n acc)
       (cons (proc n) acc))
     lst '())))

;(foldMap abs '( -1 -2 3 4) )


;Reverse
(define foldlReverse
    (lambda (lst)
      (foldr
       (lambda (n acc)
         ;(cons n acc))
         (append acc (list n))) ; Sorry for append
         lst '())
      ))
         

(foldlReverse '(1 2 3 4))

;; Part 2
;; foldr ('r' short for 'right') folds the other way than foldl - from behind. 
;; This means the first procedure returned is on the last element in the input list.

;; Part 3
;; Fold needs to return a result of multiple steps and calculations.
;; This can be done through the accumulator.
  
