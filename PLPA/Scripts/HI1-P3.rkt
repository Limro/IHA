;; fold product
(define foldP
  (lambda (acc lst)
    (if (null? lst)
        acc
        (foldP 
               (* acc (car lst))
               (cdr lst)))))

;; fold1 wrapper
(define fold1
  (lambda (lst)
    (foldP 1 lst)))

;(fold1 '(1 2 3 4 5))
;(fold1 '(2 3 4))

;; fold postive
(define posPro
  (lambda (lst x)
    (if (null? lst) 
        x 
        (if (< 0 (car lst))
            (posPro ;true
             (cdr lst) (* (car lst) x)) 
            (posPro ;false
             (cdr lst) x)))))

; Wrapper
(define fold2
  (lambda (lst)
    (posPro lst 1)
    ))

;(fold2 '(1 2 3 4 5))
;(fold2 '(2 3 4))

; fold3 reimplement length
(define fold3
    (lambda (lst)
      (if (null? lst) 0 
          (+ 1 (fold3 (cdr lst))))))

;(fold3 (list 1 2 3))
;(fold3 (list 1 2 3 2))

; fold4 reimplement reverse
(define foldRev
  (lambda (lst rev)
    (if (and (null? lst) (null? rev)) rev
        (if (null? (cdr lst))
            (cons (car lst) rev)
            (foldRev (cdr lst) (cons (car lst) rev))))))

;wrapper
(define fold4
  (lambda (lst)
    (foldRev lst '() )))

;(fold4 '())
;(fold4 '(1 2 3))

; fold5 reimplement map
(define fold5
  (lambda (proc arg)
    (if (null? arg) '()
        (cons (proc (car arg))
              (fold5 proc (cdr arg))))))

(fold5 abs (list 1 -2 3))
(fold5 - (list 1 -2 3))

