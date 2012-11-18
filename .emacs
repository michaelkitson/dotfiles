;; UI
(defalias 'yes-or-no-p 'y-or-n-p)
(display-time)
(setq display-time-day-and-date t)
(menu-bar-mode -1)
(global-linum-mode 1)
(setq column-number-mode t)
(setq size-indication-mode t)
(setq inhibit-startup-message t)
(setq line-number-mode t)
(setq linum-format "%d ")
(global-hl-line-mode 1)
(set-face-background hl-line-face "gray20")
(show-paren-mode 1)
(setq show-paren-delay 0)

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

;; Loads
; (load "/usr/share/doc/git-core/contrib/emacs/git.el") ; Manual install
