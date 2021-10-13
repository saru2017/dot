;;; packet自動インストール用
(setq warning-suppress-log-types '((package reinitialization)))
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")))
(package-initialize)


(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
	(if (boundp 'package-selected-packages)
	    ;; Record this as a package the user installed explicitly
	    (package-install package nil)
	  (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install optional package `%s': %S" package err)
     nil)))


;; 共通設定

;;;; ロックファイルを作らない
(setq create-lockfiles nil)

;;;; 共通で必要なパッケージ
(require-package 'markdown-mode)

;;;; 行番号の表示（有効：t、無効：nil）
(line-number-mode t)

;;;; 列番号の表示（有効：t、無効：nil）
(column-number-mode t)

;;;; 1行ずつスクロール
(setq scroll-conservatively 1)

;;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)




;; オリジナルショートカット

;;;; global set key
(global-set-key "\C-l" 'goto-line)




;; YaTeX
(add-to-list 'load-path "~/dot/emacs/yatex1.82")
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))




;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ language - coding system                   ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; デフォルトの文字コード
(set-default-coding-systems 'utf-8-unix)

;; テキストファイル／新規バッファの文字コード
(prefer-coding-system 'utf-8-unix)

;; ファイル名の文字コード
(set-file-name-coding-system 'utf-8-unix)

;; キーボード入力の文字コード
(set-keyboard-coding-system 'utf-8-unix)

;; サブプロセスのデフォルト文字コード
(setq default-process-coding-system '(undecided-dos . utf-8-unix))

;; 環境依存文字 文字化け対応
(set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
                      'katakana-jisx0201 'iso-8859-1 'cp1252 'unicode)
(set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)






;; 環境毎に変更
(when (equal window-system 'w32)
  (load-file "~/dot/emacs/init-win.el"))
(when (equal window-system nil)
  (load-file "~/dot/emacs/init-linux.el"))
(when (equal window-system 'x)
  (load-file "~/dot/emacs/init-x.el"))
