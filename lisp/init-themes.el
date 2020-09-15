;; -*- lexical-binding: t; -*-

(use-package doom-themes
  :straight t
  :init
  (setq doom-one-brighter-modeline 't
        ;;doom-one-brighter-comments 't
        ;;doom-one-comment-bg 't
	)
  :config
  (doom-themes-visual-bell-config))

(use-package heaven-and-hell
  :straight t
  :init
  (setq heaven-and-hell-theme-type 'dark) ;; Omit to use light by default
  (setq heaven-and-hell-themes
        '((light . doom-one-light)
          (dark . doom-one))) ;; Themes can be the list: (dark . (tsdh-dark wombat))
  ;; Optionally, load themes without asking for confirmation.
  (setq heaven-and-hell-load-theme-no-confirm t)
  (heaven-and-hell-init-hook)
  :bind (("C-c <f12>" . heaven-and-hell-load-default-theme)
         ("<f12>" . heaven-and-hell-toggle-theme)))

(use-package solaire-mode
  :straight t
  :hook
  ((change-major-mode after-revert ediff-prepare-buffer)
   . turn-on-solaire-mode)
  (minibuffer-setup . solaire-mode-in-minibuffer)
  :config
  (solaire-global-mode +1)
  (solaire-mode-swap-bg)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config))

(defun toggle-frame-background-mode ()
  (interactive)
  (setq frame-background-mode
        (if (and (boundp 'frame-background-mode)
                 (eq frame-background-mode 'dark))
            'light 'dark))
  (mapc #'frame-set-background-mode (frame-list))
  (mapc #'enable-theme (reverse custom-enabled-themes)))

(bind-key "<f9>" #'toggle-frame-background-mode)

(provide 'init-themes)
;;; init-themes.el ends here
