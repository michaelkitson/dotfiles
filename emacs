;; -*- mode: lisp -*-

;; UI
(defalias 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode 0)
(display-time)
(global-hl-line-mode t)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(set-face-background hl-line-face "gray20")
(setq column-number-mode t)
(setq display-time-day-and-date t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq line-number-mode t)
(setq linum-format "%d ")
(global-linum-mode t)
(setq longlines-show-hard-newlines t)
(setq size-indication-mode t)
(setq visible-bell t)
(show-paren-mode t)
(setq show-paren-delay nil)
(tool-bar-mode 0)

;; Files
(auto-compression-mode 1)
(setq make-backup-files nil)
(setq tramp-default-method "ssh")

;; Indentation
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)

;; Disabled commands
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; File Extensions
(setq auto-mode-alist (cons '("\\.bash_functions" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.bash_aliases" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.bashrc.local" . sh-mode) auto-mode-alist))

;; Loads
; (load "/usr/share/doc/git-core/contrib/emacs/git.el") ; Manual install

;; Load architecture specific configurations
(setq arch (if (eq system-type 'darwin) "Darwin" "Linux"))
(setq arch-specific-config (concat (replace-regexp-in-string "\.emacs$" "" (file-symlink-p "~/.emacs")) "/" arch "/emacs"))
(if (file-readable-p arch-specific-config) (load arch-specific-config))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'php-mode-hook 'flymake-php-load)
(add-hook 'php-mode-hook (lambda () (c-set-style "awk")))

;; Color-Theme
(color-theme-initialize)
(color-theme-midnight)

;; Rainbow-delimiters
(global-rainbow-delimiters-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gnus-uncacheable-groups "\\[Gmail\\]"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:background "color-17"))))
 '(org-hide ((((background light)) (:foreground "black")))))
