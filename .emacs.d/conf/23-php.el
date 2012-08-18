;;; php

;; php-mode
(add-hook 'php-mode-hook '(lamba ()
(setq c-basic-offset 4)
(setq c-tab-width 4)
(setq c-indent-level 4)
(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq-default tab-width 4)
))

;; smarty-mode
(autoload 'smarty-mode "smarty-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.tpl$" . smarty-mode))
