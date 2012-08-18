;;; window

(custom-set-variables
 '(initial-frame-alist '((width . 110) (height . 45) (top . 40)))
 '(scroll-bar-mode     nil)) ; hide scroll bar

;; split
;; (split-window-horizontally)

;; elscreen)
(load "elscreen" "ElScreen" t)
(global-set-key "\M-t" 'elscreen-create)
(global-set-key "\M-T" 'elscreen-clone)
(global-set-key "\M-k" 'elscreen-kill-screen-and-buffers)
(global-set-key "\M-}" 'elscreen-next)
(global-set-key "\M-{" 'elscreen-previous)
(global-set-key [(C-tab)] 'elscreen-next)
(global-set-key [(C-S-tab)] 'elscreen-previous)

 ;; color
(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "Gray")

;; alpha
(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;; full screen
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)
