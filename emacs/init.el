;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; code:
(package-initialize)
(setq inhibit-startup-screen t)

;; editor settings
(setq mac-option-modifier 'meta) ; set alt-key to meta
(setq mac-command-modifier 'super)
(setq mac-escape-modifier nil) ; set esc-key to nil
(windmove-default-keybindings)
(delete-selection-mode 1) ; replace active region with typed text

(global-linum-mode t)
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(defvar linum-format "%4d ")
(show-paren-mode 1)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; history
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; temp directory
(setq backup-directory-alist
          `((".*" . ,"~/.emacs_temp/")))
    (setq auto-save-file-name-transforms
          `((".*" ,"~/.emacs_temp/" t)))

;; window management - toggle
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)

;;; Package
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
 '(package-selected-packages
   (quote
    (ag expand-region multiple-cursors move-text go-rename helm-projectile helm-descbinds helm yasnippet spaceline use-package flycheck-gometalinter git-gutter-fringe+ git-gutter-fringe smex go-guru go-autocomplete auto-complete go-mode)))
 '(powerline-default-separator (quote rounded))
 '(whitespace-style (quote (face trailing))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; plugins
(require 'icas)

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))

(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (flycheck-gometalinter-setup)))

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-emacs-theme))

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (yas-reload-all)
  (define-key yas-minor-mode-map (kbd "M-l") 'yas-expand)
  (define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-next-field)
  )

(use-package projectile
  :ensure projectile
  :config (projectile-global-mode t)
  :diminish projectile-mode)

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
	 ("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)
	 ("C-c C->" . mc/mark-all-words-like-this)
	 ("C-'" . mc/mark-next-like-this-word)
         ("C-\"" . mc/mark-previous-like-this-word)
	 ("C-M-'" . mc/unmark-next-like-this)
	 ("C-M-\"" . mc/unmark-previous-like-this)
	 ("C-;" . mc/skip-to-next-like-this)
	 ("C-:" . mc/skip-to-previous-like-this)
	 ))

;; Helm
(use-package helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-mode-fuzzy-match t)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
	  helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)

    (use-package helm-projectile
                 :ensure    helm-projectile
                 :init      (helm-projectile-on)
                 :bind      ("C-c h" . helm-projectile))

    ;; emacs
    (setq helm-locate-command
	  "glocate %s %s"
	  helm-locate-create-db-command
	  "gupdatedb --output='%s' --localpaths='%s'")

    (setq helm-locate-project-list
	  (list "/Users/xcy/.emacs.d/"))

    (helm-mode))
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-x c SPC" . helm-all-mark-rings)))
(ido-mode -1) ;; Turn off ido mode in case I enabled it accidentally

(use-package helm-descbinds
  :defer t
  :bind (("C-h b" . helm-descbinds)
         ("C-h w" . helm-descbinds)))

;; git-gutter
(global-git-gutter-mode +1)

;; GO
(use-package go-rename
  :ensure t
  :commands go-rename)

(require 'go-autocomplete)
(require 'go-guru)
(ac-config-default)
(defun my-go-mode-hook ()
  "Initialize GO."
  (go-guru-hl-identifier-mode)
  (yas-minor-mode)

  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (local-set-key (kbd "C-c C-h h") 'godoc)
  (local-set-key (kbd "C-c C-h p") 'godoc-at-point)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; move-text
(move-text-default-bindings)

(provide 'init)
;;; init.el ends here
