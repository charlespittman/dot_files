(use-package flycheck
  :ensure t
  :config (progn
            (use-package flycheck-color-mode-line
              :ensure t
              :config (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

            (use-package flycheck-haskell
              :ensure t)

            (use-package flycheck-pos-tip
              :ensure t
              :config (custom-set-variables '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))))
