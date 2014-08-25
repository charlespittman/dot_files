(use-package eldoc
  :init (add-hook 'prog-mode-hook 'turn-on-eldoc-mode)
  :config (progn
            (use-package eldoc-extension
              :ensure t)
            (use-package c-eldoc
              :ensure t
              :config (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode))
            (use-package org-eldoc
              :ensure t)))
