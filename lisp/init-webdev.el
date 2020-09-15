(use-package web-mode
  :straight t)

(use-package prettier-js
  :straight t)

(use-package js2-mode
  :straight t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'prettier-js-mode)

(setq js-indent-level 2)

(provide 'init-webdev)
