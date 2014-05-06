;; FP1-1.scm
;; Rasmus Bækgaard <10893@iha.dk> 10893
;;

; Recursive tail
(define vector->list:rec
    (lambda (vec x lst)
      (if (= (vector-length vec) x)
          lst
          (vector->list:rec vec (+ x 1) (cons 
                                         (vector-ref vec 
                                                     (- (- (vector-length vec) x) 1)) 
                                         lst))
          )))

(define vector->list:rectail
    (lambda (vec) 
      (vector->list:rec vec 0 '() )))

(vector->list:rectail '#(2 3 4))

;; Classic recursive
(define (vector->list:rec3 vec x)
      (if (= (vector-length vec) x)
          '()
          (if (vector? vec) (cons (vector-ref vec x)
                                  (vector->list:rec3 vec (+ x 1) ))
              '() )))

(define vector->list:rec
    (lambda (vec) 
      (vector->list:rec3 vec 0)))

(vector->list:rec '#(1 2 3 4))