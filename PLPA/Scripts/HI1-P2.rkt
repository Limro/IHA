; Recursive tail
; arg should be a list
; x starts as 1
(define positive-product::tailrecWork 
  (lambda (arg x)
    (if (null? arg) x 
        ;else
        (if (< 0 (car arg))
            (positive-product::tailrecWork (cdr arg) (* (car arg) x)) 
            (positive-product::tailrecWork (cdr arg) x)))))

; Wrapper
(define positive-product::tailrec
  (lambda (li)
    (positive-product::tailrecWork li 1)
    ))

(positive-product::tailrec '())
(positive-product::tailrec '(-1 1 2 3))

; Classic recursive
; arg should be a list
; x starts as 1
(define (positive-product::Classic arg x)
    (if (null? arg) x 
        ;else
        (if (< 0 (car arg))
            (positive-product::Classic (cdr arg) (* (car arg) x)) 
            (positive-product::Classic (cdr arg) x))))

; Wrapper
(define positive-product::clasrec
  (lambda (li)
    (positive-product::Classic li 1)
    ))

(positive-product::clasrec '())
(positive-product::clasrec '(-1 1 2 3))