;;; font
(create-fontset-from-ascii-font "-apple-Inconsolata-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1" nil "inconsolatekakugo")
(set-fontset-font "fontset-inconsolatekakugo"
                  'unicode
                  (font-spec :family "Hiragino Kaku Gothic ProN" :size 16)
                  nil
                  'append)
(set-frame-font "fontset-inconsolatekakugo")
