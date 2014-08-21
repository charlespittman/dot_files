(use-package ido
  :init (setq ido-enable-flex-matching t
              ido-everywhere t
              ido-create-new-buffer 'always)
  :config (progn (ido-mode t)
                 (use-package ido-vertical-mode
                   :ensure t
                   :init (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
                   :config (ido-vertical-mode t))))

;; Listed here because smex is built on ido
(use-package smex
  :ensure t
  :init (setq smex-auto-update 60)
  :config (progn (smex-initialize)
                 (global-set-key (kbd "M-x") 'smex)
                 (global-set-key (kbd "M-X") 'smex-major-mode-commands)
                 (global-set-key (kbd "M-s-x") 'smex-show-unbound-commands)
                 ;; This is your old M-x. (Also still bound to Menu key)
                 (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))
