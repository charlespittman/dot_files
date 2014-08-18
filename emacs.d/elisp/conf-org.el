(use-package org
  :init (progn (setq org-log-done t)
               (setq org-agenda-files (list "~/org/home.org"
                                            "~/org/work.org"
                                            "~/org/school.org")))
  :config (progn (use-package org-bullets
                   :ensure t
                   :config (add-hook 'org-mode-hook 'org-bullets-mode))

                 (define-key global-map "\C-ca" 'org-agenda)
                 (define-key global-map "\C-cb" 'org-iswitchb)
                 (define-key global-map "\C-cc" 'org-capture)
                 (define-key global-map "\C-cl" 'org-store-link)))
