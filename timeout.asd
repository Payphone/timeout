;;;; timeout.asd

(asdf:defsystem #:timeout
  :description "A simple timeout"
  :author "Peyton Farrar <peyton@peytonfarrar.com>"
  :license "BSD"
  :depends-on (#:bordeaux-threads)
  :serial t
  :components ((:file "package")
               (:file "timeout")))
