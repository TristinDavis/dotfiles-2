;;; CSS

;; auto-complete
(eval-when-compile
  (require 'cl)
  (require 'auto-complete-config))
(defvar ac-source-css-property-names
  '((candidates . (loop for property in ac-css-property-alist
                        collect (car property)))))
