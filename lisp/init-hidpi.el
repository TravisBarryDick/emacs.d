(use-package zoom-frm
  :straight t)

(defun toggle-hidpi () (interactive)
       (let (frame (selected-frame))
	 (if (frame-parameter frame 'zoomed)
	     (my-lowdpi)
	   (my-hidpi))))

(defun my-hidpi () (interactive)
       (let (frame (selected-frame))
	 (when (frame-parameter frame 'zoomed)
	   (zoom-frm-unzoom frame))
	 (let ((frame-zoom-font-difference 14))
	   (zoom-frm-in frame))))

(defun my-lowdpi () (interactive)
       (let (frame (selected-frame))
	 (when (frame-parameter frame 'zoomed)
	   (zoom-frm-unzoom frame))))

(global-set-key (quote [f9]) 'toggle-hidpi)

(provide 'init-hidpi)


