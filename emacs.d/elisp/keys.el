(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

; Macro for regexp search/replace
(global-set-key (kbd "M-#") 'query-replace-regexp)

(global-set-key (kbd "<f5>") 'revert-this-buffer)
(global-set-key (kbd "<f6>") 'align)
(global-set-key (kbd "<f7>") 'delete-trailing-whitespace)
(global-set-key (kbd "<f8>") 'whitespace-mode)
(global-set-key (kbd "<f9>") 'linum-mode)

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

; Git status of current directory
(global-set-key (kbd "<f10>") 'magit-status)

;(global-set-key (kbd "C-x C-b") 'ibuffer)
(defalias 'list-buffers 'ibuffer)

(define-key text-mode-map (kbd "C-c C-c") 'center-paragraph)

(defun duplicate-line ()
  "Duplicate the line containing point."
  (interactive)
  (save-excursion
    (let (line-text)
      (goto-char (line-beginning-position))
      (let ((beg (point)))
        (goto-char (line-end-position))
        (setq line-text (buffer-substring beg (point))))
      (if (eobp)
          (insert ?\n)
        (forward-line))
      (open-line 1)
      (insert line-text))))

(bind-key "C-x C-d" 'duplicate-line)

(bind-key "s-SPC" 'just-one-space)

(global-set-key (kbd "C-c C-SPC") 'hs-toggle-hiding)

(eval-after-load "hideshow"
'(add-to-list 'hs-special-modes-alist
`(ruby-mode
,(rx (or "def" "class" "module" "{" "[")) ; Block start
,(rx (or "}" "]" "end")) ; Block end
,(rx (or "#" "=begin")) ; Comment start
ruby-forward-sexp nil)))
