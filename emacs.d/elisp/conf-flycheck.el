(use-package flycheck
  :config (progn
            (use-package flycheck-color-mode-line
              :config (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

            (use-package flycheck-pos-tip
              :config (eval-after-load 'flycheck
              '(custom-set-variables '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))))
