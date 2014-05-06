;; FP1-2.scm
;; Rasmus Bækgaard <10893@iha.dk> 10893
;;

; Recursive tail
(define positive-product::tailrecWork 
  (lambda (lst x)
    (if (null? lst) x 
        (if (< 0 (car lst))
            (positive-product::tailrecWork (cdr lst) (* (car lst) x)) 
            (positive-product::tailrecWork (cdr lst) x)))))

(define positive-product::tailrec
  (lambda (li)
    (positive-product::tailrecWork li 1)
    ))

;(positive-product::tailrec '())
;(positive-product::tailrec '(-1 1 2 3))


; Classic recursive
(define (positive-product::clasrec lst)
    (if (null? lst) (abs 1) 
        (abs (* (car lst)
                (positive-product::Classic (cdr lst))))))

;(positive-product::clasrec '())
(positive-product::clasrec '(-1 1 2 3))