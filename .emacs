(load "term/bobcat")                                           ;; Ctrl-Hでバックスペース for Mac
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))  ;; Ctrl-Hでバックスペース for Mac

;======================================================================
; 言語・文字コード関連の設定
;======================================================================
(when (equal emacs-major-version 21) (require 'un-define))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
;;
;======================================================================
; Anthy
;    CTRL-\で入力モード切替え
;======================================================================
(load-library "anthy")
(setq default-input-method "japanese-anthy")
;;
;=======================================================================
;フォント
;=======================================================================
;(cond (window-system
;    (set-default-font "-*-fixed-medium-r-normal--14-*-*-*-*-*-*-*")
;       (progn
;         (set-face-font 'default
;                        "-shinonome-gothic-medium-r-normal--14-*-*-*-*-*-*-*")
;         (set-face-font 'bold
;                        "-shinonome-gothic-bold-r-normal--14-*-*-*-*-*-*-*")
;         (set-face-font 'italic
;                        "-shinonome-gothic-medium-i-normal--14-*-*-*-*-*-*-*")
;         (set-face-font 'bold-italic
;                        "-shinonome-gothic-bold-i-normal--14-*-*-*-*-*-*-*")
;       )))
;;
;=======================================================================
;フレームサイズ・位置・色など
;=======================================================================
(setq initial-frame-alist
    (append (list
           '(foreground-color . "white")        ;; 文字色
           '(background-color . "#333366")      ;; 背景色
           '(border-color . "black")
           '(mouse-color . "white")
           '(cursor-color . "white")
           '(width . 120)                ;; フレームの幅
           '(height . 50)                ;; フレームの高さ
           '(top . 0)                    ;; Y 表示位置
           '(left . 0)                   ;; X 表示位置
           )
        initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
;;
;=======================================================================
; Misc
;=======================================================================
(mouse-wheel-mode)                        ;;ホイールマウス
(global-font-lock-mode t)                    ;;文字の色つけ
(setq line-number-mode t)                    ;;カーソルのある行番号を表示
(auto-compression-mode t)                    ;;日本語infoの文字化け防止
(set-scroll-bar-mode 'right)                    ;;スクロールバーを右に表示
(global-set-key "\C-z" 'undo)                    ;;UNDO
(setq frame-title-format                    ;;フレームのタイトル指定
    (concat "%b - emacs@" system-name))

;(display-time)                            ;;時計を表示
;(global-set-key "\C-h" 'backward-delete-char)            ;;Ctrl-Hでバックスペース
;(global-set-key "\C-h" 'delete-backward-char)            ;;Ctrl-Hでバックスペース
(keyboard-translate ?\C-h ?\C-?)                         ;;Ctrl-Hでバックスペース

(setq make-backup-files nil)                    ;;バックアップファイルを作成しない (*.~)
(setq auto-save-default nil)                    ;;バックアップファイルを作成しない (.#*)
;(setq visible-bell t)                        ;;警告音を消す
;(setq kill-whole-line t)                    ;;カーソルが行頭にある場合も行全体を削除
(when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace t))    ;;行末のスペースを強調表示
;;
;=======================================================================
; 履歴の保存
;=======================================================================
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
;;
;=======================================================================
; 最近使ったファイル
;=======================================================================
(recentf-mode)
;;
;=======================================================================
; リージョンに色を付ける
;=======================================================================
(setq transient-mark-mode t)
;;
;=======================================================================
; 対応する括弧を光らせる
;=======================================================================
(show-paren-mode)
;;
;=======================================================================
; C-c c で compile コマンドを呼び出す
;=======================================================================
(define-key mode-specific-map "c" 'compile)
;;
;=======================================================================
; スクリプトを保存する時、自動的に chmod +x を行うようにする
;=======================================================================
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!"
         (buffer-substring-no-properties 1
                         (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char
             (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand
                           (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))
(add-hook 'after-save-hook 'make-file-executable)
;;
;=======================================================================
; ~/.emacs.d/auto-install/ にパスを通す
;=======================================================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
;;
;=======================================================================
; End of File
;=======================================================================
