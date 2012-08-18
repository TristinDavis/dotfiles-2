;;; perl

;; perl-completion
;(auto-install-from-emacswiki "perl-completion.el")
;(autoload 'perl-completion-mode "perl-completion" nil t)
;(eval-after-load "perl-completion"
;  '(progn
;     (define-key plcmp-mode-map (kbd "M-TAB") nil)
;     (define-key plcmp-mode-map (kbd "M-C-o") 'plcmp-cmd-smart-complete)))

;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cgi$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.psgi$" . cperl-mode) auto-mode-alist))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (cperl-set-style "PerlStyle")))
;            (require 'perl-completion)
;             (add-to-list 'ac-sources 'ac-source-perl-completion)))
(custom-set-variables
 '(cperl-indent-level           4)
 '(cperl-indent-parens-as-block t)
 '(cperl-close-paren-offset     -4))

;; tt-mode
(autoload 'tt-mode "tt-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl$" . tt-mode))
(custom-set-variables
 '(tt-mode-indent-level           4)
 '(tt-mode-indent-parens-as-block t)
 '(tt-mode-close-paren-offset     -4))
