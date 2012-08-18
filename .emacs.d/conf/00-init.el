;;; init

(column-number-mode t)           ;; カーソルの位置が何文字目かを表示する
(setq scroll-step 1)             ;; 1行ずつスクロールする
(setq visible-bell t)            ;; ビープ音を消す
(setq inhibit-startup-message t) ;; スタートアップページを表示しない
(setq backup-inhibited t)        ;; バックアップファイルを作らない
(setq delete-auto-save-files t)  ;; 終了時にオートセーブファイルを消す
(tool-bar-mode -1)               ;; メニューバーを隠す
(show-paren-mode 1)              ;; 対応する括弧を光らせる
(setq blink-cursor-interval 0.5) ;; カーソル点滅速度の調整
(setq partial-completion-mode 1) ;; 補完機能を使う
(setq scroll-preserve-screen-position t) ;; PageUp,PageDown の時にカーソル位置を保持
(setq initial-scratch-message nil)       ;; 起動直後の *scratch* buffer に入る文字列をなくす
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))    ;; タイトルバーに現在のファイル名表示
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t) ;; shell-mode で ^M を出さなくする

;; Macのキーバインドを使う
(mac-key-mode 1)

;; Macのoptionをメタキーにする
(if (eq window-system 'mac)
    (setq mac-option-modifier 'meta))

;; 最下行で「↓」を押したときスムーズなスクロールにする
(progn
 (setq scroll-step 1)
 (setq scroll-conservatively 4))

;; backup file を作らない。(.save.. ってやつとか ~ なんとかとか)
(progn
  (setq auto-save-list-file-name nil)
  (setq auto-save-list-file-prefix nil)
  (setq make-backup-files nil))

;; ステータスラインに時間を表示する
(progn
  (setq display-time-day-and-date t)
  (setq display-time-24hr-format t)
  (setq display-time-format "%Y-%m-%d(%a) %H:%M")
  (setq display-time-interval 30)
  (display-time))

;; タブ/インデント
;;(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'indent-relative-maybe)

;; シフト + 矢印で範囲選択
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)

;; linum (行番号表示)
(require 'linum)
(global-linum-mode t)

;; 行カーソル
(defface hlline-face
  '((((class color)
      (background dark))
     ;(:background "dark state gray"))
     (:background "gray10"
      :underline "gray24"))
    (((class color)
      (background light))
     (:background "ForestGreen"
      :underline nil))
    (t ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
;;(setq hl-line-face 'underline)1行ずつスクロールする
(global-hl-line-mode)

;; highlight
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;; sr-speedbar（ディレクトリ一覧）
;;(require 'sr-speedbar)
;;(setq sr-speedbar-right-side nil)

;; 同一バッファ名にディレクトリ付与
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; ack
(defun ack ()
  (interactive)
  (let ((grep-find-command "ack --nocolor --nogroup "))
    (call-interactively 'grep-find)))
