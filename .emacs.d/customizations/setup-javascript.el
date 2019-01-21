(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-indent-style 2
      web-mode-code-indent-offset 2)
(defun jsx-if-react ()
  "Sets web mode content type to jsx if this js file imports React"
  (if (string-match-p "import[[:blank:]]+React" (buffer-string))
      (web-mode-set-content-type "jsx")))
(add-hook 'web-mode-hook 'jsx-if-react)
