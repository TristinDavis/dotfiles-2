;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/")  t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; init loader
(eval-when-compile (require 'cl))
(defvar init-loader-directory (expand-file-name "~/.emacs.d/conf"))
(defvar init-loader-regexp "\\(?:^[[:digit:]]\\{2\\}-.*\.elc?\\)$")
(defun init-loader-files (dir regexp)
  (loop for file in (directory-files dir t)
        when (and (string-match regexp (file-name-nondirectory file))
                  (or (not (locate-library (concat file "c")))
                      (string-match "\.elc$" file)))
        collect file into ret
        finally return (sort ret 'string<)))
(defun init-loader-load (dir regexp)
  (let ((load-path (cons dir load-path))
        (targets (init-loader-files dir regexp)))
    (dolist (target targets)
      (condition-case e
          (load (file-name-sans-extension target) nil t)
        (error (message "load error: %s - %s" target e))))))
(init-loader-load init-loader-directory init-loader-regexp)

;; display line num
(global-linum-mode t)
(setq linum-format "%4d:")

(column-number-mode t)
(setq scroll-step 1)
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq backup-inhibited t)
(setq delete-auto-save-files t)
(tool-bar-mode nil)
(show-paren-mode 1)
(setq blink-cursor-interval 0.5)
(setq scroll-preserve-screen-position t)
(setq initial-scratch-message nil)
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;; window
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-indent-next-pair-timer-geo-mean (quote ((default 0.0005 0))))
 '(cperl-close-paren-offset -4)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(initial-frame-alist (quote ((top . 1) (width . 180) (height . 49) (alpha . 80))))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tt-mode-close-paren-offset -4)
 '(tt-mode-indent-level 4)
 '(tt-mode-indent-parens-as-block t))

;; elscreen
(elscreen-start)
;(elscreen-set-prefix-key "\C-t")
(global-set-key "\M-t" 'elscreen-create)
(global-set-key "\M-T" 'elscreen-clone)
(global-set-key "\M-k" 'elscreen-kill-screen-and-buffers)
(global-set-key "\M-}" 'elscreen-next)
(global-set-key "\M-{" 'elscreen-previous)
(global-set-key [(C-tab)] 'elscreen-next)
(global-set-key [(C-S-tab)] 'elscreen-previous)

;; color theme
(color-theme-initialize)
(color-theme-clarity)

(display-time-mode 1)    ; display time
(display-battery-mode 1) ; display battery

;; activate option key for Mac
(if (eq window-system 'mac)
    (setq mac-option-modifier 'meta))

;; smooth scroll
(progn
  (setq scroll-step 1)
  (setq scroll-conservatively 4))

;; no backup file
(progn
  (setq auto-save-list-file-name nil)
  (setq auto-save-list-file-prefix nil)
  (setq make-backup-files nil))

;; tab key config
;;(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'indent-relative-maybe)

;; when open same file
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; ack
;;(defun ack ()
;;  (interactive)
;;  (let ((grep-find-command "ack --nocolor --nogroup "))
;;    (call-interactively 'grep-find)))

;; ag
(defun ag ()
  (interactive)
  (let ((grep-find-command "ag --nocolor --nogroup "))
    (call-interactively 'grep-find)))

;; powerline.el
(require 'powerline)

;; flymake
(require 'flymake)

;; php-mode
(require 'php-mode)
(setq php-mode-force-pear t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; smarty-mode
(require 'smarty-mode)
(add-to-list 'auto-mode-alist '("\\.tpl$" . smarty-mode))

;; js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; cperl-mode
(require 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cgi$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.psgi$" . cperl-mode) auto-mode-alist))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (cperl-set-style "PerlStyle")))
;            (require 'perl-completion)
;             (add-to-list 'ac-sources 'ac-source-perl-completion)))


;; tt-mode
(require 'tt-mode)
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl$" . tt-mode))

;; lang ja
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; font
(set-face-attribute 'default nil :family "monaco" :height 120)                           ; en
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Hiragino Maru Gothic Pro")) ; ja
(setq face-font-rescale-alist '((".*Hiragino Maru Gothic Pro.*" . 1.2)))                 ; 1 : 2

;; find-file-at-point
(ffap-bindings)

;; show parentheses
(show-paren-mode t)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; yes,no を答えるかわりに，y,n にする
(defalias 'yes-or-no-p 'y-or-n-p)

;; auto-indent-mode
;(setq auto-indent-on-visit-file t) ;; If you want auto-indent on for files
;(require 'auto-indent-mode)
;(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
        								;)
                                        ;(auto-indent-global-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; indent
(setq-default truncate-lines           t   ; truncate line
              tab-width                4   ; tab width
;;            indent-tabs-mode         nil ; no use tab
              find-file-visit-truename t)  ; visit truename

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region."
  (interactive "r")
  (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
    (replace-regexp re "" nil beg end)))

(global-set-key (kbd "C-x M-t") 'cleanup-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)

;; marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; backslash
(define-key global-map [?¥] [?\\])

;; color-moccur
(when (require 'color-moccur nil t)
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  (setq moccur-split-word t)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  (when (and (executable-find "cmigemo")
	     (require 'migemo nil t))
    (setq moccur-use-migemo t)))

;; PATH
(dolist (dir (list
	      "/sbin"
	      "/usr/sbin"
	      "/bin"
	      "/usr/bin"
	      "/usr/local/bin"
	      (expand-file-name "~/bin")
	      ))
  ;; exec-path
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))
