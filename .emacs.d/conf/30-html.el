;;; HTML

;; html-helper-mode
(add-hook 'html-helper-load-hook '(lambda () (require 'html-font)))
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist 
      (append '(
        ("\\.html$" . html-helper-mode)
        ("\\.shtml$" . html-helper-mode)
      ) auto-mode-alist))
(add-hook 'html-mode-hook
      '(lambda () (setq indent-tabs-mode t tab-width 2)))

;; zencoding-mode
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
(add-hook 'text-mode-hook 'zencoding-mode)
(add-hook 'smarty-mode-hook 'zencoding-mode)
(add-hook 'php-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap "\C-z" 'zencoding-expand-line)