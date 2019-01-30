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
                  clojure-mode-extra-font-locking markdown-mode web-mode
                  sudo-edit web-mode))
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
(set-default-font "Inconsolata 13")

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("d606ac41cdd7054841941455c0151c54f8bff7e4e050255dbd4ae4d60ab640c1" "08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" default)))
 '(package-selected-packages
   (quote
    (lua-mode sudo-edit foggy-night-theme clojure-mode-extra-font-locking cider paredit rainbow-delimiters yasnippet auto-complete yaml-mode ace-jump-mode)))
 '(standard-indent 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
