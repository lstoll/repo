(require-package 'terraform-mode)

(add-hook 'terraform-mode-hook
	  #'terraform-format-on-save-mode)

(provide 'init-terraform)