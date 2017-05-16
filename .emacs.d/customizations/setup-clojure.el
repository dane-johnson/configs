(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(setq cider-repl-display-help-banner nil)
(add-to-list 'interpreter-mode-alist '("boot" . clojure-mode))

;; I'm pretty attached to ace-jump but clojure doesn't play nice
;; with my binding, and when you don't play nice people get hurt
(eval-after-load "clojure-mode"
  '(define-key clojure-mode-map (kbd "C-c SPC") nil))
