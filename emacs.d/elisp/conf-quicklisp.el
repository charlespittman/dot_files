(use-package slime
  :ensure t
  :load-path "~/.slime/"
  :init (setq inferior-lisp-program "sbcl")
  :config (progn (load (expand-file-name "~/quicklisp/slime-helper.el"))
                 (use-package ac-slime
                   :ensure t)))
