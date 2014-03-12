(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

; Macro for regexp search/replace
(global-set-key (kbd "M-#") 'query-replace-regexp)

(global-set-key (kbd "<f9> <f8>") 'whitespace-mode)
(global-set-key (kbd "<f9> <f7>") 'linum-mode)
(global-set-key (kbd "<f9> <f10>") 'align)
(global-set-key (kbd "<f9> <f11>") 'delete-trailing-whitespace)

; Quickly switch windows
(global-set-key (kbd "M-o") 'other-window)

; Use the forward/back buttons on the mouse
(global-set-key [mouse-8] 'previous-buffer)
(global-set-key [mouse-9] 'next-buffer)

(add-hook 'lisp-mode-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))

;; Kill active buffer without prompt
(defun kill-this-buffer ()
  "Kills the current buffer without prompting for confirmation."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

; Repeat last command
(global-set-key (kbd "C-z") 'repeat)


;; Revert active buffer without prompt
(defun revert-this-buffer ()
  "Reverts the current buffer from disk without prompting for confirmation."
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))
(global-set-key (kbd "<f6>") 'revert-this-buffer)

; Git status of current directory
(global-set-key (kbd "<f10>") 'magit-status)

;(global-set-key (kbd "C-x C-b") 'ibuffer)
(defalias 'list-buffers 'ibuffer)
