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
(setq flycheck-gometalinter-disable-linters '("vetshadow")) ; this is noisy with if err := blocks
;; Only enable selected linters
;(setq flycheck-gometalinter-disable-all t)
;(setq flycheck-gometalinter-enable-linters '("golint"))
;; Set different deadline (default: 5s)
;(setq flycheck-gometalinter-deadline "10s")

;; Only run the 'fast' linters
(setq flycheck-gometalinter-fast t)

(defun go-mode-setup ()
  (go-eldoc-setup)
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  (setq tab-width 4)

  (setq ac-sources '(ac-source-go ac-source-yasnippet))

  (setq flycheck-checkers '(go-build go-test gometalinter))
  )
(add-hook 'go-mode-hook 'go-mode-setup)

(provide 'init-go)
