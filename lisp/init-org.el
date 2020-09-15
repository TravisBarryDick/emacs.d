(use-package pdf-tools
  :straight t)

(pdf-tools-install)

(use-package org-pdftools
  :hook (org-load . org-pdftools-setup-link)
  :straight t)

(provide 'init-org)
  
