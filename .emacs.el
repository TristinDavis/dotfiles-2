;; load-path
(let ((default-directory "~/.emacs.d/elisp/"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))

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
