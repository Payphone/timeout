;;;; timeout.lisp

(in-package #:timeout)

(define-condition timeout-error (error)
  ((text :initarg text :reader text)))

(defmacro with-timeout (timeout &body body)
  `(let ((thread (bt:make-thread #'(lambda () ,@body))))
     (sleep ,timeout)
     (if (bt:thread-alive-p thread)
         (progn (bt:destroy-thread thread)
                (error 'timeout-error :text
                       "A timeout was issued on ~A after ~A seconds."))
         (bt:join-thread thread))))
