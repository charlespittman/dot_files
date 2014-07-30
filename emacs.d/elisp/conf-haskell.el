(use-package haskell-mode
  :ensure t
  :config (progn
            (use-package ghc)
            (use-package ghci-completion
              :config (add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion))
            (use-package flycheck-haskell
              :config (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
            (add-hook 'haskell-mode-hook 'capitalized-words-mode)
            (add-hook 'haskell-mode-hook 'turn-on-eldoc-mode)
            (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
            (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
            (custom-set-variables '(haskell-process-suggest-remove-import-lines t)
                                  '(haskell-process-auto-import-loaded-modules t)
                                  '(haskell-process-log t))
            (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
            (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
            (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
            (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
            (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
            (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
            (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
            (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
            (custom-set-variables '(haskell-stylish-on-save t))))
