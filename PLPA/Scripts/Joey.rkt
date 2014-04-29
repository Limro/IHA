;; Filter takes a predicate and a list and returns a list with only
;; those elements that satisfy the predicate

(define filter
  (lambda (pred? lst)
    (cond ((null? lst) '())
          ((pred? (car lst)) (cons (car lst)
                                   (filter pred? (cdr lst))))
          (else (filter pred? (cdr lst))))))

;; Define a priority queue data type and some operations on it
(define make-empty-queue (lambda () '()))
(define element? pair?)
(define make-queue-element cons)
(define get-element-priority car)
(define get-element-item cdr)

;; Given a queue, a priority, and an item, enqueue returns a new queue
;; with the item enqueued at the given priority
(define enqueue
  (lambda (queue priority item)
    (if (null? queue)
        (list (make-queue-element priority item))
        (cons (car queue)
              (enqueue (cdr queue) priority item)))))

;; Define an example queue
(define queue
  (let* ((q1 (enqueue (make-empty-queue) 3 'low-item))
         (q2 (enqueue q1 4 'unimportant-item))
         (q3 (enqueue q2 1 'high-item))
         (q4 (enqueue q3 2 'middle-item))
         (q5 (enqueue q4 1 'other-high-item)))
    q5))

;; Define a function to get all of the elements of a given priority
(define show-enqueued-at-priority
  (lambda (queue priority)
    (let ((at-priority? (lambda (element)
                          (= (get-element-priority element) priority)
                          )
                          ))
    (filter at-priority? queue))
    ))

;; Define a function to dequeue the next highest priority element (but
;; first, foldl)
(define (foldl f acc list)
  (if (null? list) 
      acc 
      (foldl f 
             (f acc (car list)) 
             (cdr list))))

;; Get the highest priority level in a queue
(define highest-in-queue
  (lambda (queue)
    (let (( give-max-priority
            (lambda (acc element)
              (if (< (get-element-priority element) acc)
                  (get-element-priority element)
                  acc)
              )))
    (foldl give-max-priority 99 queue))
    ))

;; Dequeue an element, and return the previously queued item and a new
;; queue without that element
(define dequeue
  (lambda (queue)
    (let* ((highest-priority (highest-in-queue queue))
          (choose-highest-element
           (lambda (acc element)
             (cond ((equal? #f acc) element)
                   ((<= (get-element-priority acc)
                    (get-element-priority  element))
                 acc)
                 (else element))))
          (highest-element
           (foldl choose-highest-element #f queue))
          (not-this-element
           (lambda (element)
             (lambda (other)
               (not (eq? element other)))))
          )
      (list 
       (get-element-item highest-element)
        queue-rest))
    ))



;(filter 
; (lambda (x)
;   (= 0 (remainder x 2)))
;        '(1 2 3 4 5))

;(show-enqueued-at-priority queue 1)

;(highest-in-queue queue)
;(highest-in-queue '())

(dequeue queue)