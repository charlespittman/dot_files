(use-package confluence
  :ensure t
  :init (setq confluence-url "http://confluence.atdesk.com/confluence/rpc/xmlrpc")
  :config (progn
            (global-set-key "\C-xwf" 'confluence-get-page)
            (add-hook 'confluence-edit-mode-hook
                      (local-set-key "\C-xw" confluence-prefix-map)
                      (local-set-key "\M-j" 'confluence-newline-and-indent)
                      (local-set-key "\M-;" 'confluence-list-indent-dwim))))

(use-package jira
  :ensure t
  :init (setq jira-url "http://jira.atdesk.com/jira/rpc/xmlrpc"))
