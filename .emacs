(setq inhibit-startup-screen t)
(setq tab-width 2)
(setq indent-tabs-mode nil)
(setq backup-inhibited t)
(setq auto-save-default nil)

(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(setq neo-theme 'ascii)

(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook #'global-company-mode)
(add-hook 'reason-mode-hook (lambda ()
			      (add-hook 'before-save-hook 'refmt-before-save)))

(setq elm-format-on-save t)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-elm))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" default)))
 '(package-selected-packages
   (quote
    (elm-mode reason-mode indium flycheck rjsx-mode neotree zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
