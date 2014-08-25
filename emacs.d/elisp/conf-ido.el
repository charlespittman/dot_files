(use-package ido
  :ensure t
  :init (setq ido-enable-flex-matching t
              ido-everywhere t
              ido-create-new-buffer 'always)
  :config (progn (ido-mode t)
                 (use-package ido-ubiquitous
                   :ensure t)
                 (use-package ido-vertical-mode
                   :ensure t
                   :init (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
                   :config (ido-vertical-mode t))))

;; Listed here because smex is built on ido
(use-package smex
  :ensure t
  :init (setq smex-auto-update 60)
  :config (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("M-s-x" . smex-show-unbound-commands)))
