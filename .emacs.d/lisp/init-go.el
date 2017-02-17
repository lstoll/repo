(require-package 'go-mode)
(require-package 'go-autocomplete)
(require-package 'flycheck-gometalinter)
(require-package 'go-eldoc)

; dafuq is up with autoloads?
(load "go-mode.el")

(require 'go-autocomplete)
(setq-default ac-go-expand-arguments-into-snippets t)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

;; Disable these, because meta takes care of it.
(setq-default flycheck-disabled-checkers '(go-errcheck go-golint go-vet go-unconvert go-gofmt))

;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
(setq flycheck-gometalinter-vendor t)
;; disable linters
(setq flycheck-gometalinter-disable-linters
      '("vetshadow" ; this is noisy with if err := blocks
	"gotype")) ; This is bad with stale data, build/test overrides

;; Only enable selected linters
;(setq flycheck-gometalinter-disable-all t)
;(setq flycheck-gometalinter-enable-linters '("golint"))
;; Set different deadline (default: 5s)
;(setq flycheck-gometalinter-deadline "10s")

;; Only run the 'fast' linters
(setq flycheck-gometalinter-fast t)

;; Hook to run gazel on save if project has a .gazelcfg.json in the
;; projectile root
(defun gazel-update-BUILD ()
  "Run gazel in current dir if project has gazel configured"
  (interactive)
  (let* ((gzcfgpath (concat (projectile-project-root) ".gazelcfg.json"))
	 ;; Run for the project, but only what's in the current dir
	 (gazel-args (list "-root" (projectile-project-root))))
    (when (file-exists-p gzcfgpath)
      (message "Calling gazel %s" gazel-args)
      (call-process "gazel" nil nil nil gazel-args))))

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
  (setq flycheck-checkers '(go-build go-test gometalinter))
  )
(add-hook 'go-mode-hook 'go-mode-setup)

(provide 'init-go)
