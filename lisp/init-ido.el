(use-package ido
  :init
  (setq ido-enable-flex-matching t
        ido-use-virtual-buffers t)
  :config
  (ido-mode)
  (ido-everywhere))

(use-package ido-completing-read+
  :straight t
  :config (ido-ubiquitous-mode))

(use-package amx
  :straight t
  :demand
  :config (amx-mode)
  :bind ("M-X" . smex-major-mode-commands))

(use-package ido-better-flex
  :straight t
  :config (ido-better-flex/enable))

(provide 'init-ido)
;;; init-ido.el ends here
