(use-package tex
  :straight auctex
  :defer
  :defines TeX-view-program-list TeX-view-program-selection
  :init
  (setq TeX-debug-bad-boxes t
        TeX-parse-self t
        TeX-source-correlate-mode t
        TeX-auto-save t)
  :config
  (setq-default TeX-master nil)
  (let ((skim-exec "/Applications/Skim.app/Contents/SharedSupport/displayline"))
    (when (file-executable-p skim-exec)
      (add-to-list 'TeX-view-program-list
                   `("Skim" ,(concat skim-exec " -r -b -g %n %o %b")))
      (add-to-list 'TeX-view-program-selection
                   '(output-pdf "Skim")))))

(use-package reftex
  :diminish reftex-mode
  :hook (LaTeX-mode . turn-on-reftex)
  :init
  (setq reftex-plug-into-AUCTeX t
        reftex-ref-style-default-list '("Cleveref" "Varioref" "Default")))

(use-package latex-extra
  :straight t
  :diminish latex-extra-mode
  :hook (LaTeX-mode . latex-extra-mode))

(use-package company-auctex
  :straight t
  :hook (TeX-mode . company-auctex-init))

(use-package auctex-latexmk
  :straight t
  :hook (LaTeX-mode . auctex-latexmk-setup)
  :init
  (setq auctex-latexmk-inherit-TeX-PDF-mode t))

(use-package magic-latex-buffer
  :straight t
  :hook LaTeX-mode
  :config (setq ml/symbols (nconc ml/symbols
                                  '(("\\\\dotsc\\>" . "…")
                                    ("\\\\dotsb\\>" . "⋯")))))

(provide 'init-tex)
