;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |10-6 lab|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;in class lab 10/6
(define leaf
  (lambda () '()))

(define at-leaf?
  null?)

(define move
  (lambda (cur left right)
    (list cur left right)))

(define number->bintree
  (lambda (n)
    (move n (leaf) (leaf))))

(define current-element
  car)

(define move-to-left-son
  cadr)

(define move-to-right-son
  caddr)

(define insert-to-left
  (lambda (n t)
    (move (current-element t)
          (move n (move-to-left-son t) (leaf))
          (move-to-right-son t))))

(define insert-to-right
  (lambda (n t)
    (move (current-element t)
          (move-to-left-son t)
          (move n (leaf) (move-to-right-son t)))))

(number->bintree 13)

(define t1 (insert-to-right 14
                            (insert-to-left 12
                                               (number->bintree 13))))
(current-element(move-to-left-son t1))

(at-leaf? (move-to-right-son (move-to-left-son t1)))

(insert-to-left 15 t1)