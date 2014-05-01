;; FP1.scm
;; Rasmus Bækgaard <10893@iha.dk> 10893
;;

;fold
(define foldl
  (lambda (proc acc lst)
    (if (null? lst)
        acc
        (foldl proc
               (proc acc (car lst))
               (cdr lst)))))

;fold product
(define foldP
  (lambda (lst)
          (foldl * 1 lst)))

;(foldP '(1 2 3))
;(foldP '(1 2 3 4))

(define foldPositive
  (lambda (lst)
    (foldl + 0 lst)))

;(foldPositive '(1 2 3 4 5))
;(foldPositive '(2 3 4))

(define foldLength
  (lambda (lst)
    (foldl 
     (lambda (acc d) 
       (+ acc 1)) 
     0 lst)))

(foldLength '())
(foldLength (list 1 2 3))
(foldLength (list 1 2 3 2))

(define foldlReverse
  (lambda (lst)
    (foldl 
     (lambda (acc n) 
       (append (list n) acc)) 
     '() lst)))

;(foldlReverse '(1 2 3 4))

(define foldMap
  (lambda (proc lst)
    (foldl 
     (lambda (acc n) 
       (append acc (list (proc n)) )) 
     '() lst)))

;(foldMap abs '( -1 -2 3 4))
