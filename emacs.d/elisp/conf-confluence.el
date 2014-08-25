(use-package confluence
  :ensure t
  :init (setq confluence-url "http://confluence.atdesk.com/confluence/rpc/xmlrpc")
  :config (add-hook 'confluence-edit-mode-hook
                    (local-set-key "\C-xw" confluence-prefix-map)
                    (local-set-key "\M-j" 'confluence-newline-and-indent)
                    (local-set-key "\M-;" 'confluence-list-indent-dwim))
  :bind ("C-x w f" . confluence-get-page))

(use-package org-jira
  :ensure t
  :init (setq jiralib-url "http://jira/jira"))

(defun open-jira-ticket-at-point ()
  "Open browser with Jira ticket at point."
  (interactive)
  (let ((ticket (thing-at-point 'sexp)))
    (if (eq nil (string-match-p "^[A-z]+-[0-9]+$" ticket))
        (setq ticket (read-from-minibuffer
                      "Not sure if this is a ticket: "
                      ticket)))
    (browse-url
     (concat jiralib-url "/browse/" ticket))))
