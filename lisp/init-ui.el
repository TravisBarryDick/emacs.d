;;; init-ui.el -- Early initialization of UI elements

;;; Commentary:
;;; This files contains customizations to the Emacs UI
;;; that don't depend on any extra packages, and therefore can be done
;;; early in the load process before package management is available.

;;; Code:

(setq
 inhibit-startup-screen t
 ;; Don't resize in steps
 window-resize-pixelwise t
 frame-resize-pixelwise t
 ;; Don't resize frame when changing any of the frame properties below
 frame-inhibit-implied-resize t)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(use-package frame
  :no-require t
  :init
  (setq window-divider-default-places t
        window-divider-default-bottom-width 1
        window-divider-default-right-width 1)
  :config
  ;; Disable menu bar, tool bar, and vertical scroll bars
  ;; Do this in early-init.el in emacs 27+
  (modify-all-frames-parameters
   '((menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (vertical-scroll-bars . nil)
     (font . "Mononoki 12")))
  :hook (after-init . window-divider-mode))

;; (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (when (and (fboundp 'menu-bar-mode)
;;            ;; turning off menu bar has no effect in Emacs.app
;;            ;; in EmacsMac.app it disables native fullscreen,
;;            (not (memq window-system '(mac ns))))
;;   (menu-bar-mode -1))

(use-package windmove
  :config (windmove-default-keybindings 'shift))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(provide 'init-ui)
;;; init-ui.el ends here
