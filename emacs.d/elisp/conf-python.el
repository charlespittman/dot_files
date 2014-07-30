(use-package python
  :mode ("\\.py\\'" . python-mode)
  :config (progn
            (use-package elpy
              :ensure t
              :init (setq elpy-rpc-backend "jedi")
              :config (progn
                        (elpy-enable)
                        (elpy-use-ipython)
                        (elpy-clean-modeline)))))
