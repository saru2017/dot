(when (equal window-system 'w32)
  (load-file "~/dot/emacs/init-win.el"))

(when (equal window-system 'nil)
  (load-file "~/dot/emacs/init-linux.el"))
