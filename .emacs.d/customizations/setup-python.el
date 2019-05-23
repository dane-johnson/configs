(add-hook 'python-mode-hook #'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'elpy-mode)
(add-hook 'python-mode-hook 'elpy-enable)
(require 'elpy)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(setq elpy-shell-use-project-root nil)
(setq python-indent-offset 2)
(define-key elpy-mode-map (kbd "C-c d") 'elpy-goto-definition)
(define-key elpy-mode-map (kbd "C-c a") 'elpy-goto-assignment)
(setq elpy-shell-use-project-root nil)
