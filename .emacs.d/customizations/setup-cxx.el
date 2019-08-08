(setq c-default-style "linux"
      c-basic-offset 2)
(require 'cc-mode)
(define-key c-mode-map (kbd "C-c d") 'xref-find-definitions)
