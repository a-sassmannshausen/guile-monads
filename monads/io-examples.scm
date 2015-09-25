(define-module (monads io-examples)
  #:use-module (monads)
  #:use-module (monads io))

;;;; Examples

(define (test-mdisplay) (run-io (iodisplay "Test String")))

(define (test-return) (run-io (io-return 5)))

(define (test-mbegin)
  (run-io (mbegin %io-monad
            (iosimple-format "What is your name?    ")
            (ioread-line))
          (current-input-port) (current-output-port)))

(define (test-advanced)
  (run-io (mlet* %io-monad
              ((name (mbegin %io-monad
                       (iodisplay "Please enter your name: ")
                       (ioread-line)))
               (age (mbegin %io-monad
                      (iodisplay "Please enter your age: ")
                      (ioread-line)))
               (age-in-20 -> (+ (string->number age) 20)))
            (iosimple-format "Hello ~a!
In 20 years you will be ~a years old.~%"
                            name age-in-20))))

(define (test-advanced-io-lift)
  (run-io (mlet* %io-monad
              ((name (mbegin %io-monad
                       (iodisplay "Please enter your name: ")
                       (ioread-line)))
               (age (mbegin %io-monad
                      (iodisplay "Please enter your age: ")
                      (ioread-line)))
               (num ((io-lift string->number) age))
               (age-in-20 -> (+ num 20)))
            (iosimple-format "Hello ~a!
In 20 years you will be ~a years old.~%"
                            name age-in-20))))

;;;;; Incorrect:
(define (test-bind-display)
  (force ((io-bind (iodisplay "first line")
                   ;; IODISPLAY expects one argument, and bind will attempt to
                   ;; pass the result of above to below.  As a result, this
                   ;; will error out.
                   (iodisplay "Test line")) #f (current-output-port))))

;;; Correct
(define (test-bind-display-correct)
  (run-io (io-bind (io-return "first lineTest line")
            iodisplay)))

;;;;; Incorrect
(define (test-bind-read)
  (run-io (io-bind (iosimple-format "What is your name?    ")
                   ;; IOREAD-LINE expects no arguments but will be passed '(),
                   ;; the result of iosimple-format.
                   (ioread-line))))

;;; Correct
(define (test-bind-read-correct)
  (run-io (with-prompt ioread-line "What is your name?	")))

;;; examples.scm ends here.
