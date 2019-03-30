(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(require 'linum)
(require 'linum-relative)
(setq-default linum-format 'dynamic)
(setq-default linum-relative-current-symbol "")
(setq-default linum-relative-format "%4s ")
(linum-relative-toggle)
(add-hook 'find-file-hook (lambda ()
                            (hl-line-mode)
                            (linum-mode)))

(require 'auto-complete-config)
(ac-config-default)
(ac-linum-workaround)

(setq evil-search-module 'evil-search)
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-w-in-emacs-state t)
(require 'evil)
(require 'evil-leader)
(require 'evil-matchit)
(require 'evil-nerd-commenter)
(require 'evil-numbers)
(require 'evil-visualstar)
(require 'surround)
(setq evil-leader/leader ",")
(evil-leader/set-key "r" 'evilnc-comment-or-uncomment-lines)
(evil-leader/set-key "b" 'ido-switch-buffer)
(evil-leader/set-key "f" 'ido-find-file)
(evil-leader/set-key "w" 'save-buffer)
(global-evil-leader-mode 1)
(global-evil-matchit-mode 1)
(evilnc-default-hotkeys)
(global-surround-mode 1)
(evil-mode 1)

(require 'ido)
(ido-mode 'both)
(ido-mode 1)
(ido-everywhere 1)

(require 'whitespace)
(setq whitespace-style '(tabs tab-mark)) ;; Show only tabs
(global-whitespace-mode 1)

(require 'caml)
(require 'tuareg)
(require 'haskell-mode)
(require 'flycheck)
(add-hook 'tuareg-mode-hook 'auto-complete-mode)

(setq-default sentence-end-double-space nil)
(setq-default indent-tabs-mode nil)
(setq scroll-margin 3)
(setq scroll-conservatively 100)
(setq scroll-preserve-screen-position t)
(setq show-paren-style 'parenthesis)
(setq show-paren-delay 0)
(setq-default show-trailing-whitespace t)
(show-paren-mode 1)
(column-number-mode)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'solarized-light t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
