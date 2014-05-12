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
               (list acc (cons (car lst1) (car lst2)))
               )
    )))

(define zip 
  (letrec ((acc '()))
    (lambda (lst1 lst2)
      (task1 lst1 lst2 acc))))
    
;; To check with
;(zip '(1 2) '(a b))
;(zip '(1 2 3) '(a b))



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
  (letrec (( acc 0))
    (lambda (proc lst)
      (foldl 
       proc
       (if (proc (car lst)) ; true or false?
           (list acc (car lst))
           acc)
       (cdr lst))
    )))


;(foldlFilter positive? '(-1 2 3 -4))

; sumprod

(define sumprod
  (lambda (lst1 lst2)
    (foldl 
     (lambda (n)
       (+ n (foldl * 1 (list (car lst1) (car lst2)))))
              '() 
              (list (car lst1) (car lst2)))
       ))
        
  ;(sumprod (cdr lst1) (cdr lst2))
;(sumprod '(1 2 3) '(4 5 6))



;;Dedup explained:
;; Take the first element in the list in the accumulator.
;; Check if the first cdr element is equal car accumulator.
;;   If so, rerun the procedure with cdr list.
;;   If not, add the car list to the accumulator (so car list is first in the acuumulator)
;; Repeat
(define dedup
  ;(letrec ((acc (list (car lst))))
    (lambda (lst)
      (if (null? lst)
          acc
          (if (= (car acc) (car lst))
              (dedup (cdr lst))
              (lambda (acc)
                (list (car lst) acc)
                (dedup (cdr lst)
                )
                acc
              )))))

;(dedup '(1 1 2 1 1))
  
  
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
  (letrec ((x '()))
  (lambda (proc lst)
    (foldr
     (lambda (acc n) 
       (if (null? n)
           acc
           (list acc (proc 
                      (if (list? n)
                          (car n)
                          (car (list n)))))
           ))
     lst '() ))))

;(foldMap abs '( -1 -2 3 4) )


;Reverse
(define foldlReverse
  (letrec ((x '()))
    (lambda (lst)
      (foldr
       (lambda (acc n)
         (if (null? n)
             acc 
             ;(list 
             (list x  acc
              (if (list? n)
                  (car n)
                  n))
              ;acc)))
             ))
       lst '() ))))

(foldlReverse '(1 2 3 4))

;; Part 2
;; foldr will take the procedure and apply that to the car lst and the redo this, until it hit's the last elemtn in a list.

;; Part 3
;; Fold needs to return a result - this can be done through the accumulator
  
