;;; Yasnippet

(add-to-list 'load-path
              "~/.emacs.d/elisp/yasnippet")
(require 'yasnippet)
(custom-set-variables
 '(yas/trigger-key  "M-TAB")
(yas/global-mode t)