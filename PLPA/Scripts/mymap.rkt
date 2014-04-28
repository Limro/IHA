(define mymap
  (lambda (proc arg)
    (if (null? arg) '()
        (cons (proc (car arg))
              (mymap proc (cdr arg))))))

(mymap abs (list 1 -2 3))