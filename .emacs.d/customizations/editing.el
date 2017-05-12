(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))
(ac-config-default)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(global-auto-complete-mode t)
(electric-pair-mode 1)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))
(setq scroll-step 1)
(if (display-graphic-p)
    (scroll-bar-mode -1))
(menu-bar-mode -1)
(blink-cursor-mode 0)
(setq ring-bell-function 'ignore)
;; Comment region map to command-/
(global-set-key (kbd "s-/") (quote comment-or-uncomment-region))
