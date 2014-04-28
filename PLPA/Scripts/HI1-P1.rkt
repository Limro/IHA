; Recursive tail
(define vector->list:rec2
    (lambda (vec x)
      (if (= (vector-length vec) x) '()
      (if (vector? vec) (cons (vector-ref vec x)
              (vector->list:rec2 vec (+ x 1) ))
        '() ))))

(define vector->list:rectail
    (lambda (vec) 
      (vector->list:rec2 vec 0)))

(vector->list:rectail '#(1 2 3 4))

;; Classic recursive
(define (vector->list:rec3 vec n)
      (if (= (vector-length vec) x) '()
      (if (vector? vec) (cons (vector-ref vec x)
              (vector->list:rec3 vec (+ x 1) ))
        '() )))

(define vector->list:rec
    (lambda (vec) 
      (vector->list:rec3 vec 0)))

(vector->list:rectail '#(1 2 3 4))