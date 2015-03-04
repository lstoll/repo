(require-package 'helm)

(require 'helm-config)

(helm-mode 1)

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c t") 'helm-imenu)

(provide 'init-helm)
