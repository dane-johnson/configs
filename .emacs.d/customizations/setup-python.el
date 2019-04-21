(add-hook 'python-mode-hook #'rainbow-delimiters-mode)
(setq python-indent-offset 2)
(define-key elpy-mode-map (kbd "C-c d") 'elpy-goto-definition)
(define-key elpy-mode-map (kbd "C-c a") 'elpy-goto-assignment)
