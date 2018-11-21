;;  nt-emacs 26.1 .emacs   
(cd "c:/")
;;; coding-system
(set-language-environment "Japanese")
(prefer-coding-system 'sjis)
(set-default-coding-systems 'sjis)
(setq file-name-coding-system 'sjis)
(setq locale-coding-system 'sjis)
;;;背景色と前景色
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white")))))
 '(cursor ((((class color)
             (background dark))
            (:background "white"))
           (((class color)
             (background light))
            (:background "#999999"))
           (t ())
           ))
;; region の色
(set-face-background 'region "SkyBlue")
(set-face-foreground 'region "black")

(if (boundp 'window-system)
    (setq initial-frame-alist
          (append (list
                   '(foreground-color . "azure3") ;; 文字が白
                   '(background-color . "black") ;; 背景は黒
                   '(border-color     . "black")
                   '(mouse-color      . "white")
                   '(cursor-color     . "white")
                   '(cursor-type      . box)
                   '(menu-bar-lines . 1)
                   ;;15.2 フォントの設定 
;                   '(font . "my-fontset") 
;                   '(vertical-scroll-bars . nil) ;;スクロールバーはいらない
                   '(width . 115) ;; ウィンドウ幅
                   '(height . 40) ;; ウィンドウの高さ
                   '(top . 0) ;;表示位置
                   '(left . 0) ;;表示位置
                   )
                  initial-frame-alist)))
(setq default-frame-alist initial-frame-alist)
;;全角スペースとタブの可視化
(global-whitespace-mode 1)
(setq whitespace-space-regexp "\\(\u3000\\)")
(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings ())
(set-face-foreground 'whitespace-tab "yellow")
(set-face-underline  'whitespace-tab t)
(set-face-foreground 'whitespace-space "yellow")
(set-face-background 'whitespace-space "red")
(set-face-underline  'whitespace-space t)

;;;フォントサイズ
(set-face-attribute 'default nil :height 125)
;;; 現在の関数名をモードラインに表示
(which-function-mode 1)

(setq initial-scratch-message 
";;           *scratch*              (lisp-interaction-mode)        ;;")

;;load path

(setq load-path (cons (expand-file-name "c:/home/.emacs.d") load-path))
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode 0);;ツールバー非表示
;;; バックアップファイルを作らない
(setq backup-inhibited t)
;; ミニバッファの履歴を保存する
(savehist-mode 1)
;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)


;; keyset
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(setq inhibit-startup-message t)

;;recentf-mode
(recentf-mode 1)
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 500)
(define-key global-map (kbd "C-x C-g") 'recentf-open-files)


;;(setq transient-mark-mode t)
(show-paren-mode t)
(setq show-paren-style 'expression)
(global-unset-key "\C-z")
(global-set-key "\C-z" 'other-window) ;C-z as other-window

;(require 'wdired)
;(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(iswitchb-mode 1) ;;iswitchbモードON


;; 反対側のウィンドウにいけるように
(setq windmove-wrap-around t)


;; Package Manegement
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; 起動画面削除
(setq inhibit-startup-message t)

;;tramp
(require 'tramp)
(setq tramp-default-method "ssh")


;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

