(require-package 'go-mode)
(require-package 'go-autocomplete)
(require-package 'flycheck-gometalinter)

; dafuq is up with autoloads?
;(load "go-mode.el")

(require 'go-autocomplete)
(setq-default ac-go-expand-arguments-into-snippets t)

; Installed by thesetup
(load-file (concat "/Users/" (getenv "USER") "/src/golang.org/x/tools/cmd/oracle/oracle.el"))
(load-file (concat "/Users/" (getenv "USER") "/src/golang.org/x/tools/refactor/rename/go-rename.el"))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
(setq flycheck-gometalinter-vendor t)
;; disable linters
;(setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))
;; Only enable selected linters
;(setq flycheck-gometalinter-disable-all t)
;(setq flycheck-gometalinter-enable-linters '("golint"))
;; Set different deadline (default: 5s)
;(setq flycheck-gometalinter-deadline "10s")

(defun my-go-mode-hook ()
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  (setq tab-width 4)

  (setq ac-sources '(ac-source-go ac-source-yasnippet))
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

(provide 'init-go)
