(require 'mu4e)

(use-package mu4e-maildirs-extension :ensure t)

(setq mu4e-maildir "~/.mail"
      mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 120
      mu4e-hide-index-messages t
      mu4e-view-show-images t
      mu4e-compose-complete-only-personal t
      mu4e-compose-signature-auto-include nil
      message-kill-buffer-on-exit t
      mu4e-confirm-quit nil
      )

(setq mu4e-user-mail-address-list (list "cpittman@atdesk.com" "charles.pittman@gmail.com" "cpittman@citadel.edu" "chucks86@gmail.com")
      user-mail-address "cpittman@atdesk.com"
      )

(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/bin/msmtp"
;      smtpmail-local-domain        "atdesk.com"
      )

;; (setq mu4e-use-fancy-chars t
;;       mu4e-headers-seen-mark '("S" . "☑")
;;       mu4e-headers-unseen-mark '("u" . "☐")
;;       mu4e-headers-flagged-mark '("F" .  "⚵")
;;       mu4e-headers-new-mark '("N" .  "✉")
;;       mu4e-headers-replied-mark '("R" . "↵")
;;       mu4e-headers-passed-mark '("P" . "⇉")
;;       mu4e-headers-encrypted-mark '("x" . "⚷")
;;       mu4e-headers-signed-mark '("s" . "✍"))

(defun search-for-sender (msg)
  "Search for messages sent by the sender of the message at point."
  (mu4e-headers-search
   (concat "from:" (cdar (mu4e-message-field msg :from)))))

;; define 'x' as the shortcut
(add-to-list 'mu4e-view-actions
             '("xsearch for sender" . search-for-sender) t)

(defun count-lines-in-attachment (msg attachnum)
  "Count the number of lines in an attachment."
  (mu4e-view-pipe-attachment msg attachnum "wc -l"))

;; defining 'n' as the shortcut
(add-to-list 'mu4e-view-attachment-actions
             '("ncount lines" . count-lines-in-attachment) t)

(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)

(require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(setq mu4e-html2text-command "w3m -T text/html")
