;;; init-tree.el --- Set up treemacs
;;; Commentary:
;;; Code:

(use-package all-the-icons
  :straight t)

(use-package treemacs
  :straight t
  :defer t
  :config
  (setq treemacs-width 30)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)
  (pcase (cons (not (null (executable-find "git")))
               (not (null treemacs-python-executable)))
    (`(t . t) (treemacs-git-mode 'deferred))
    (`(t . _) (treemacs-git-mode 'simple)))
  :bind
  ("M-0"       . treemacs-select-window)
  ("C-c t 1"   . treemacs-delete-other-windows)
  ("C-c t t"   . treemacs)
  ("C-c t B"   . treemacs-bookmark)
  ("C-c t f"   . treemacs-find-file)
  ("C-c t M-t" . treemacs-find-tag))

(use-package treemacs-projectile
  :after treemacs projectile
  :straight t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :straight t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :straight t)

(provide 'init-tree)
;;; init-tree.el ends here
