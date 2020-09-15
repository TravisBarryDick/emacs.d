(setq julia-formatter-process-name "julia-formatter")

(defun launch-julia-formatter ()
  "Launches a julia instance and initializes the JuliaFormatter package."
  (interactive)
  (unless (get-process julia-formatter-process-name)
    (start-process
     julia-formatter-process-name
     julia-formatter-process-name
     "julia")
    (process-send-string
     (get-process julia-formatter-process-name)
     "using JuliaFormatter\n")))

(defun save-and-format-buffer ()
  "Saves the current buffer, uses JuliaFormatter to format the file, and then reloads it from file."
  (interactive)
  (if (buffer-file-name)
      (progn (basic-save-buffer)
	     (process-send-string
	      (get-process julia-formatter-process-name)
	      (format "format(\"%s\", margin=80)\n" (buffer-file-name))))))

(add-hook 'julia-mode-hook 'auto-revert-mode)
(add-hook 'julia-mode-hook (lambda () (launch-julia-formatter)))
(add-hook 'julia-mode-hook (lambda () (local-set-key "\C-x\C-j\C-f" 'save-and-format-buffer)))

(provide 'init-julia-format)
