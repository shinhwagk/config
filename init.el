(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-refresh-contents)

(require 'cl)
(defvar goku/packages '(			
			company
			monokai-theme
			smex
			smartparens
			pdf-tools
 	                ng2-mode
;;			hungry-delete
;;		       zenkurn-theme
		       popwin
		       ) "Default packages")

(setq package-selected-packages goku/packages)
(smartparens-global-mode 1)
;;(require 'hungry-delete)
;;(global-hungry-delete-mode)

(package-autoremove)

(defun goku/packages-installed-p()
  (loop for pkg in goku/packages
	when (not (package-installed-p pkg))
	do (return nil)
	finally (return t)))

(unless (goku/packages-installed-p)
  (package-refresh-contents)
  (dolist (pkg goku/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg))))


(global-company-mode)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.01)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode 1)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen 1)
(setq cursor-type 'bar)

(recentf-mode 1)
(setq recentf-max-menu-items 30)

(defun open-recentf()
  (interactive)
  (recentf-open-files))

(global-set-key (kbd "<f2>") 'open-rectangle)

(show-paren-mode 1)
(global-hl-line-mode 1)
(setq cursor-type 'bar)
(delete-selection-mode 1)
(linum-mode 1)


(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x" 'smex))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (pdf-tools zenburn-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
