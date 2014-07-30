(use-package tuareg
  :init (progn
          (setq auto-mode-alist
                (append '(("\\.ml[ily]?$" . tuareg-mode)
                          ("\\.topml$" . tuareg-mode)
                          ("\\.topscript$" . tuareg-mode))
                        auto-mode-alist))
          (add-to-list
           'load-path "~/.opam/system/share/emacs/site-lisp") )
  :config (progn
            (use-package merlin
              :init (progn
                      (setq merlin-use-auto-complete-mode t)
                      (setq merlin-error-after-save nil))

              :config (progn
                        ;; (set-face-background 'merlin-type-face "#88FF44")
                        (add-hook 'tuareg-mode-hook 'merlin-mode)

                        ;; So you can do it on a mac, where `C-<up>` and `C-<down>` are used
                        ;; by spaces.
                        (define-key merlin-mode-map
                          (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
                        (define-key merlin-mode-map
                          (kbd "C-c <down>") 'merlin-type-enclosing-go-down)))

            (use-package utop
              :config (progn
                        (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
                        (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)))

            ;; Change tuareg's indentation to use ocp-indent.  Also assumes it was installed via opam

            (require 'ocp-indent)
            (ocp-setup-indent)))
