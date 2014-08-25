(use-package tuareg
  :ensure t
  :load-path ("~/.opam/system/share/emacs/site-lisp/")

  :mode (("\\.ml[ily]?$" . tuareg-mode)
         ("\\.topml$" . tuareg-mode)
         ("\\.topscript$" . tuareg-mode))

  :config (progn
            (use-package merlin
              :init (setq merlin-use-auto-complete-mode t
                          merlin-error-after-save nil)

              :config (add-hook 'tuareg-mode-hook 'merlin-mode)

              :bind (("C-c <up>" . merlin-type-enclosing-go-up)
                     ("C-c <down>" . merlin-type-enclosing-go-down)))

            (use-package utop
              :config (progn
                        (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
                        (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)))

            (require 'ocp-indent)
            (ocp-setup-indent)))
