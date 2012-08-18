;;; editing config

(setq-default truncate-lines           t   ; truncate line
              tab-width                4   ; tab width
;;              indent-tabs-mode         nil ; no use tab
              find-file-visit-truename t)  ; visit truename

;; find-file-at-point
(ffap-bindings)

;; show parentheses
(show-paren-mode t)

;; auto insert
(require 'autoinsert)
;(auto-insert-mode t)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/auto-insert/")
(setq auto-insert-alist
      (nconc '(
             ("\\.html$" . "template.html")
             ("\\.pl$" . "template.pl")
             ) auto-insert-alist))

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; yes,no を答えるかわりに，y,n にする
(defalias 'yes-or-no-p 'y-or-n-p)
