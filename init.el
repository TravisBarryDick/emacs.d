;;----------------------------------------------------------------------------
;; Bootstrap straight.el
;;----------------------------------------------------------------------------

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------

(straight-use-package 'use-package)

(use-package no-littering :straight t)

(use-package auto-compile
  :straight t
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(use-package bind-key :straight t)

;;----------------------------------------------------------------------------
;; Setup load-path for other init scripts.
;;----------------------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; (setq force-load-messages t)
;; (setq debug-on-error t)

;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require 'init-markdown)
(require 'init-ui)
(require 'init-themes)
(require 'init-tree)
(require 'init-ido)
(require 'init-python)
(require 'init-tex)
(require 'init-julia)
(require 'init-webdev)
(require 'init-vc)
(require 'init-julia-format)
(require 'init-org)
(require 'init-hidpi)
(require 'init-lua)
