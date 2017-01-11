
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((minver 24))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(server-start)

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)
(require 'init-customizations)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

(require 'init-theme)
(require 'init-keybindings) ;; Set up our keybindings

(if (eq system-type 'gnu/linux)
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (split-window-right)
  )

(if (eq system-type 'darwin)
  (require 'init-maxframe) ;; Get that big size
  )

(if (not (display-graphic-p))
    (progn (require 'mwheel)
	   (require 'mouse)
	   (xterm-mouse-mode t)
	   (mouse-wheel-mode t)
	   (global-set-key [mouse-4] 'previous-line)
	   (global-set-key [mouse-5] 'next-line)))

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require 'init-ido)
(require 'init-helm)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-yasnippet)
(require 'init-auto-complete)
(require 'init-highlight-indentation)
(require 'init-ruby)
(require 'init-popwin)
(require 'init-json)
(require 'init-go)
(require 'init-yaml)
(require 'init-coffee)
(require 'init-markdown)
(require 'init-ag)
(require 'init-dash-at-point)
(require 'init-protobuf)
(require 'init-terraform)
(require 'init-magit)
