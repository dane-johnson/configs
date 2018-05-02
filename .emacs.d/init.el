;; Add lein to path
(setenv "PATH" (concat (getenv "PATH") "/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Move backups to tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;Install MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
;; Update packages
(when (not package-archive-contents)
  (package-refresh-contents))
;; Enumerate all my favorite packages
(defvar my-packages
  '(ace-jump-mode yaml-mode auto-complete yasnippet zenburn-theme
                  rainbow-delimiters paredit cider coffee-mode jsx-mode
                  clojure-mode-extra-font-locking markdown-mode
                  sudo-edit web-mode csharp-mode elpy))
;; Guard for OX shell login
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))
;; Install those tasty packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
;; I'm done with the startup screen
(setq inhibit-startup-screen t)

;; I know what I'm doing with git, leave me alone
(setq vc-follow-symlinks t)

;; If this is a GUI, load that sweet theme
(if (display-graphic-p)
    (load-theme 'zenburn t))

;; Inconsolata as default font
(set-default-font "Inconsolata 12")

;; Load yasnippets
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets")) ;; Personal snippets

;; Enable mouse in the terminal
(xterm-mouse-mode t)
(global-set-key (kbd "<mouse-4>") 'previous-line)
(global-set-key (kbd "<mouse-5>") 'next-line)

;; Ace jump mode is super useful, lets bind it
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Add custom folder to load path
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "editing.el")
(load "setup-clojure.el")
(load "setup-elisp.el")
(load "setup-python.el")
(load "setup-javascript.el")
(load "setup-coffeescript.el")
(load "setup-latex.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("cdfc5c44f19211cfff5994221078d7d5549eeb9feda4f595a2fd8ca40467776c" "d606ac41cdd7054841941455c0151c54f8bff7e4e050255dbd4ae4d60ab640c1" "08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (ess elpy yasnippet-snippets lua-mode sudo-edit foggy-night-theme clojure-mode-extra-font-locking cider paredit rainbow-delimiters yasnippet auto-complete yaml-mode ace-jump-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(standard-indent 2)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
