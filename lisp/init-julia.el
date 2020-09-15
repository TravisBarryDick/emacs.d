
(use-package julia-mode
  :straight t)

(use-package julia-repl
  :straight t
  :hook (julia-mode . (lambda() (julia-repl-mode))))

;; (use-package julia-formatter
;;   :straight (:type git :host github :repo "ki-chi/julia-formatter")
;;   :hook (julia-mode . (lambda () (julia-formatter-server-start))))

(provide 'init-julia)
