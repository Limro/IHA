(define dx 0.00001)

(define derivative
  (lambda (f)
    (lambda (x)
      (/ (- (f (+ x dx)) (f x)) 
         dx))))

(define improved-r
  (lambda (f r)
    (- r 
       (/ (f r)
          ((derivative f) r)))
  ))

(define ex 
  (lambda (x)
    + x x))

(define newton
  (lambda (f r)
    (if (< (abs (f r)) dx)
        r
        (let (( improved-r (improved-r f r)))
          (newton f improved-r)))))
                           
    
(define f (lambda (x) (* x x)))
(define g (lambda (x) (- x x)))

(newton f 0) ; 0 er mindre end dx
(newton f 10)
(newton g 10)
