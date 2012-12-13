
; Org mode that I only use to take notes on my mac
(require 'org)
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)
(define-key org-mode-map [backtab] 'org-shifttab)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-hide-leading-stars t)
(setq org-startup-folded (quote content))

(custom-set-faces
 '(org-hide ((((background light)) (:foreground "black")))))