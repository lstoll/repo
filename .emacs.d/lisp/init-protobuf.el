(require-package 'protobuf-mode)
(require-package 'flycheck-protobuf)

(setq protobuf-imenu-generic-expression
      '(("service" "^service *\\(.*\\) {" 1)
	("message" "^message *\\(.*\\) {" 1)))

(add-hook 'protobuf-mode-hook
	  (lambda ()
	    (setq imenu-generic-expression protobuf-imenu-generic-expression)))

(provide 'init-protobuf)
