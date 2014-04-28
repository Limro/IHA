(define mylength
    (lambda (xL)
      (if (null? xL) 0 
          (+ 1 (mylength (cdr xL))))))

(mylength (list 1 2 3))