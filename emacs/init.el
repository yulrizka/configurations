;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; code:
(package-initialize)
(setq inhibit-startup-screen t)

;; editor settings
(global-linum-mode t)
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(defvar linum-format "%4d ")
(show-paren-mode 1)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
  '("marmalade" . "https://marmalade-repo.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" default)))
 '(fci-rule-color "#282a2e")
 '(flycheck-check-syntax-automatically (quote (save idle-change new-line mode-enabled)))
 '(flycheck-gometalinter-disable-all t)
 '(flycheck-gometalinter-enable-linters (quote ("gotype" "golint" "vet")))
 '(flycheck-gometalinter-tests t)
 '(flycheck-gometalinter-vendor t)
 '(global-flycheck-mode t)
 '(global-whitespace-mode t)
 '(gofmt-command "casimports")
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(package-selected-packages
   (quote
    (spaceline use-package flycheck-gometalinter git-gutter-fringe+ git-gutter-fringe smex go-guru go-autocomplete auto-complete go-mode)))
 '(powerline-default-separator (quote rounded))
 '(whitespace-style (quote (face trailing))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; pluginsd
(require 'icas)

(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (flycheck-gometalinter-setup)))

(use-package spaceline-config
  :ensure spaceline
  :config
(spaceline-emacs-theme))

;; git-gutter
(global-git-gutter-mode +1)

;; Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; GO
(require 'go-autocomplete)
(require 'go-guru)
(ac-config-default)
(defun my-go-mode-hook ()
  "Initialize GO."
  (go-guru-hl-identifier-mode)

  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)


(provide 'init)
;;; init.el ends here
