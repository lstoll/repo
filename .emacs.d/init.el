(package-initialize)

;; Require reasonable emacs version.
(let ((minver 24))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

;; add dir with our custom code
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; setup where emacs reads/saves its customizations. This stops it
;; from dumping them in here.
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; start server for client to connect to
(server-start)

;; Bring in our basic package manager, ensure installed packages are
;; installed.
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;
;; Start emacs config tweaks
;;

(menu-bar-mode -1)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction

;; Window switching on terminal.
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(if (not (display-graphic-p))
    (progn (require 'mwheel)
		   (require 'mouse)
		   (xterm-mouse-mode t)
		   (mouse-wheel-mode t)       
		   (setq scroll-margin 1
				 scroll-conservatively 0
				 scroll-up-aggressively 0.01
				 scroll-down-aggressively 0.01)))

;;
;; Start custom packages
;;

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (color-theme-sanityinc-tomorrow-night))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-height 20))

(use-package swiper
  :ensure t
  :bind ("\C-s" . swiper))

(use-package counsel
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode))

(use-package auto-complete
  :ensure t
  :config
  (global-auto-complete-mode t)
  (ac-config-default))

(use-package yasnippet
  :ensure t
  :config
  ;; remove default dirs, only do our explict stuff
  (setq yas-snippet-dirs (remq 'yas-installed-snippets-dir yas-snippet-dirs))
  (setq yas-snippet-dirs
      '("~/.emacs.d/snippets/personal"
        "~/.emacs.d/snippets/go-mode"
        ))
  (yas-global-mode 1))

(use-package flycheck
  :ensure t
  :config
  (setq flycheck-highlighting-mode 'lines)
  (set-face-attribute 'flycheck-error nil
		      :foreground nil
		      :background "red")
  (set-face-attribute 'flycheck-error nil
		      :foreground nil
		      :background "yellow")
  (global-flycheck-mode))

(use-package go-mode
  :ensure t
  :hook (go-mode . go-mode-setup))

(use-package go-autocomplete
  :ensure t
  :config
  (setq-default ac-go-expand-arguments-into-snippets))

(use-package go-eldoc
  :ensure t)

;;
;; Setup functions
;;

(defun go-mode-setup ()
  (go-eldoc-setup)
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  (setq tab-width 4)

  (setq ac-sources '(ac-source-go ac-source-yasnippet))

  ;; Only the first match here will be run. This is annoying becuase
  ;; we want to build, then metalint
  (setq flycheck-checkers '(go-build go-test gometalinter)))

