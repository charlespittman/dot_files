(use-package org
  :init (setq org-log-done t
              org-agenda-files (list "~/org/home.org"
                                     "~/org/work.org"
                                     "~/org/school.org"))

  :config (progn (use-package org-ac
                   :ensure t)
                 (use-package org-bullets
                   :ensure t
                   :config (add-hook 'org-mode-hook 'org-bullets-mode)))

  :bind (("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link)))
