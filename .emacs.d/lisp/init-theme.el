(require-package 'color-theme-sanityinc-tomorrow)

(load-theme 'sanityinc-tomorrow-night t)

(if (eq system-type 'darwin) ; gnu/linux
  (set-face-attribute 'default nil :font "Meslo LG S" :height 120))

(provide 'init-theme)
;;; init-theme ends here
