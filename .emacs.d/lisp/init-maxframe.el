(require-package 'maxframe)

(add-hook 'window-setup-hook 'maximize-frame t)

(setq mf-max-width 1680)

;(split-window-right)

(provide 'init-maxframe)
