(use-package magit
  :straight t
  :bind ("C-c G" . magit-status)
  :init (setq magit-completing-read-function 'magit-ido-completing-read)
  :config (fullframe magit-status magit-mode-quit-window))

(use-package git-timemachine
  :straight t
  :commands git-timemachine)

(provide 'init-vc)
