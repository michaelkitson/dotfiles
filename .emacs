
;; UI
(defalias 'yes-or-no-p 'y-or-n-p)
(display-time)
(setq display-time-day-and-date t)
(menu-bar-mode nil)
(setq line-number-mode t)
(setq column-number-mode t)
(setq size-indication-mode t)
(setq inhibit-startup-message t)
(global-hl-line-mode t)
(set-face-background hl-line-face "gray20")
(global-linum-mode t)
(setq linum-format "%d ")
(show-paren-mode t)
(setq show-paren-delay nil)
(setq longlines-show-hard-newlines t)

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

;; Load architecture specific configurations
(setq arch (if (eq system-type 'darwin) "Darwin" "Linux"))
(setq arch-specific-config (concat (replace-regexp-in-string "\.emacs$" "" (file-symlink-p "~/.emacs")) arch "/.emacs"))
(if (file-readable-p arch-specific-config) (load arch-specific-config))
