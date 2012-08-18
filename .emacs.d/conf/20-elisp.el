;;; Emacs lisp

;; auto-async-byte-compile
(autoload 'enable-auto-async-byte-compile-mode "auto-async-byte-compile" nil t)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
