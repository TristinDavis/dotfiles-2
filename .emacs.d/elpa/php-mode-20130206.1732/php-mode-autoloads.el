;;; php-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (php-mode php-file-patterns php) "php-mode" "../../../../../.emacs.d/elpa/php-mode-20130206.1732/php-mode.el"
;;;;;;  "fd718214ef0ed4bb38b8e3a5078f7df1")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/php-mode-20130206.1732/php-mode.el

(let ((loads (get 'php 'custom-loads))) (if (member '"php-mode" loads) nil (put 'php 'custom-loads (cons '"php-mode" loads))))

(add-to-list 'interpreter-mode-alist (cons "php" 'php-mode))

(defvar php-file-patterns '("\\.php[s345t]?\\'" "\\.phtml\\'" "\\.inc\\'") "\
List of file patterns for which to automatically invoke `php-mode'.")

(custom-autoload 'php-file-patterns "php-mode" nil)

(autoload 'php-mode "php-mode" "\
Major mode for editing PHP code.

\\{php-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/php-mode-20130206.1732/php-mode-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/php-mode-20130206.1732/php-mode-test.el"
;;;;;;  "../../../../../.emacs.d/elpa/php-mode-20130206.1732/php-mode.el")
;;;;;;  (20756 33398 908661))

;;;***

(provide 'php-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; php-mode-autoloads.el ends here
