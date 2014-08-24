(use-package bind-key
  :ensure t
  :config (progn
            (bind-keys*
             ("<f5>" . revert-this-buffer)
             ("<f6>" . align)
             ("<f7>" . delete-trailing-whitespace)
             ("<f8>" . whitespace-mode)
             ("<f9>" . linum-mode)
             ("<f10>" . magit-status)   ;Git status of current directory
             ("<f11>" . follow-mode)
             ("<kp-add>" . split-window-horizontally)
             ("<kp-divide>" . delete-window)
             ("<kp-multiply>" . delete-other-windows)
             ("<kp-subtract>" . split-window-vertically)
             ("C-x C-d". duplicate-line)
             ("C-x k" . kill-this-buffer) ;I use this way more often
             ("C-w" . backward-kill-word)
             ("C-x C-k" . kill-region)
             ("C-c C-k" . kill-region)
             ("C-x M-k" . kill-buffer)
             ("C-c C-b" . new-empty-buffer)
             ("M-#" . query-replace-regexp)
             ("M-<f4>" . apply-macro-to-region-lines)
             ("M-SPC" . just-one-space)
             ("M-o" . other-window)
             )))

(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

;; Use the forward/back buttons on the mouse
(global-set-key [mouse-8] 'previous-buffer)
(global-set-key [mouse-9] 'next-buffer)

(defun new-empty-buffer ()
  "Open a new empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and initial-major-mode))
  (setq buffer-offer-save t)))

(defun kill-this-buffer ()
  "Kills the current buffer without prompting for confirmation."
  (interactive)
  (kill-buffer (current-buffer)))

;(global-set-key (kbd "C-x C-k") 'kill-this-buffer) ;Kill buffer without prompt

(global-set-key (kbd "C-z") 'repeat)    ;Repeat last command

(defun revert-this-buffer ()
  "Reverts the current buffer from disk without prompting for confirmation."
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))

(defalias 'list-buffers 'ibuffer)

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

(global-set-key (kbd "C-c C-SPC") 'hs-toggle-hiding)

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
                `(ruby-mode
                  ,(rx (or "def" "class" "module" "{" "[")) ; Block start
                  ,(rx (or "}" "]" "end")) ; Block end
                  ,(rx (or "#" "=begin")) ; Comment start
                  ruby-forward-sexp nil)))

;; Indent line and create new, indented line after current one
(global-set-key (kbd "C-<return>") (lambda () (interactive)
                                     (end-of-line)
                                     (reindent-then-newline-and-indent)))
