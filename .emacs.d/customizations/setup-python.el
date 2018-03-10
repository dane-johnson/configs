(add-hook 'python-mode-hook #'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'elpy-mode)
(add-hook 'python-mode-hook 'elpy-enable)
(setq python-shell-interpreter "ipython2"
      python-shell-interpreter-args "-i --simple-prompt")
(setq python-indent-offset 2)
