;;; ack-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ack) "ack" "../../../../../.emacs.d/elpa/ack-0.8/ack.el"
;;;;;;  "dd740aad40195a91118f8b876c3e119d")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/ack-0.8/ack.el

(autoload 'ack "ack" "\
Run ack using COMMAND-ARGS and collect output in a buffer.
When called interactively, the value of DIRECTORY is provided by
`ack-default-directory-function'.

The following keys are available while reading from the
minibuffer:

\\{ack-minibuffer-local-map}

\(fn COMMAND-ARGS &optional DIRECTORY)" t nil)

;;;***

;;;### (autoloads (pcomplete/ack) "pcmpl-ack" "../../../../../.emacs.d/elpa/ack-0.8/pcmpl-ack.el"
;;;;;;  "788be49482a39330b9206d1b06027e77")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/ack-0.8/pcmpl-ack.el

(autoload 'pcomplete/ack "pcmpl-ack" "\
Completion for the `ack' command.
Start an argument with '-' to complete short options and '--' for
long options.

\(fn)" nil nil)

(defalias 'pcomplete/ack-grep 'pcomplete/ack)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/ack-0.8/ack-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/ack-0.8/ack.el" "../../../../../.emacs.d/elpa/ack-0.8/pcmpl-ack.el")
;;;;;;  (20756 22273 790497))

;;;***

(provide 'ack-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ack-autoloads.el ends here
