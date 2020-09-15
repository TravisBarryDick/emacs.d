(use-package diminish
  :straight t)

(use-package minions
  :straight t
  :config (minions-mode 1))

(use-package spaceline-all-the-icons
  :straight t
  :init
  (setq spaceline-all-the-icons-separator-type 'slant)
  :config
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-anzu))

(provide 'init-modeline)
;;; init-modeline.el ends here
