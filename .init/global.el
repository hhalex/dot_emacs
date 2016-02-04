;; Charge tous les packages utiles quelque soit le fichier édité

;; Common lisp
(require 'cl)

;; UsePackage : permet de charger des packages intelligemment
(require 'use-package)

;; Evite de considérer l'indentation lors de 
;; la différenciation de deux fichiers avec diff
(setq-default ediff-ignore-similar-regions t)

;; Navigateur textuel
(require 'w3m)

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-smartparens-global-mode t)
    )
  )

(use-package helm-dash
  :ensure t
  :config (progn
            (setq helm-dash-docsets-path "~/.emacs.d/docsets" )
            (setq browse-url-browser-function 'w3m)
            )
  :bind ("\C-cd" . helm-dash-at-point)
  )

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
  :init
  (progn
    (setq yas-verbosity 3)
    (yas-global-mode 1)))

(use-package projectile
  :init (progn
          (projectile-global-mode 1)
          (add-hook 'projectile-mode-hook 'projectile-rails-on)
          )
  )

(use-package company
  :diminish company-mode
  :init (global-company-mode 1)
  :config (progn
            (require 'color)
            
            (let ((bg (face-attribute 'default :background)))
              (custom-set-faces
               `(company-tooltip ((t (:inherit font-lock-comment-face :background ,(color-lighten-name bg 4)))))
               `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 2)))))
               `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 8)))))
               `(company-tooltip-selection ((t (:inherit font-lock-keyword-face :background ,(color-lighten-name bg 6)))))
               `(company-tooltip-common ((t (:inherit font-lock-string-face :background ,(color-lighten-name bg 6)))))))
            )
  )

(use-package flycheck
  :init (progn
          (global-flycheck-mode 1)
          )
  ;;:config (setq-default flycheck-disabled-checkers '(c/c++-clang))
  )
