(require-package 'yasnippet)

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

;; Drop the defaults
(setq yas-snippet-dirs (remq 'yas-installed-snippets-dir yas-snippet-dirs)))

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/personal"
        "~/.emacs.d/snippets/go-mode"
        ))

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "M-TAB") 'yas-expand)

(provide 'init-yasnippet)
