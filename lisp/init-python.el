(use-package elpy
  :straight t
  :commands elpy-enable
  :functions elpy-use-ipython
  :init
  (setq elpy-rpc-virtualenv-path 'current)
  (when (executable-find "python3")
    (setq elpy-rpc-python-command "python3"))
  (when (executable-find "jupyter")
    (setq python-shell-interpreter "jupyter"
          python-shell-interpreter-args "console --simple-prompt"
          python-shell-prompt-detect-failure-warning nil))
  :config
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter"))

(use-package python
  :defer
  :config (elpy-enable))

(provide 'init-python)
