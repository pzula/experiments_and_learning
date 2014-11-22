(ns four-clojure-solutions.core)

;; 1 -
(def truthy
  = true)

;; 2 - Clojure uses polish notation
(def simple-math
  (= (- 10 (* 2 3)) 4))

;; 3 - Clojure strings are Java strings. This means that you can use
;; any of the Java string methods on Clojure strings.
(def java-strings
  (= "HELLO WORLD" (.toUpperCase "hello world")))

;; 4 - Lists can be constructed with either a function or a quoted form.
(def intro-to-lists
  (= (list :a :b :c) '(:a :b :c)))

;; 5 - When operating on a list, the conj function will return a new list
;; with one or more items "added" to the front.
(def conj1
  (= '(1 2 3 4) (conj '(2 3 4) 1))
  )

;; 5
(def conj2
  (= '(1 2 3 4) (conj '(3 4) 2 1))
  )

;; 6 - Vectors can be constructed several ways. You can compare them with lists.
(def intro-to-vectors
  (= [:a :b :c] (list :a :b :c) (vec '(:a :b :c)) (vector :a :b :c))
  )

;; 7 - When operating on a Vector, the conj function will return
;; a new vector with one or more items "added" to the end.
(def vectors-conj1
  (= [1 2 3 4] (conj [1 2 3] 4))
  )

;; 7
(def vectors-conj2
  (= [1 2 3 4] (conj [1 2] 3 4))
  )

;; 8 - sets are collections of unique values
(def intro-to-sets
  (= __ (set '(:a :a :b :c :c :c :c :d :d)))
  )
