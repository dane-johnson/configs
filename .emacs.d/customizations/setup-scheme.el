(add-hook 'scheme-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'turn-on-eldoc-mode)
(setq geiser-active-implementations '(chicken))
(setq geiser-chicken-binary "chicken-csi")