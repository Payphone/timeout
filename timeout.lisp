;;;; timeout.lisp

(in-package #:timeout)

(defmacro with-timeout (timeout &body body)
  `(let ((thread (bt:make-thread #'(lambda () ,@body))))
     (sleep ,timeout)
     (if (bt:thread-alive-p thread)
         (progn (bt:destroy-thread thread)
                (error (format nil "A timeout was issued on ~A after ~A second(s)."
                               thread ,timeout)))
         (bt:join-thread thread))))
