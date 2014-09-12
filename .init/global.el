;; Charge tous les packages utiles quelquesoit le fichier édité

;; Common lisp
(require 'cl)

;; UsePackage : permet de charger des packages intelligemment
(require 'use-package)

;; Evite de considérer l'indentation lors de 
;; la différenciation de deux fichiers avec diff
(setq-default ediff-ignore-similar-regions t)

;; Highlight indentation
(require 'highlight-indentation)

;; Navigateur textuel
(require 'w3m)

;; Permet de garder le fil quand on scrolle
(require 'on-screen)
(on-screen-global-mode +1)

;; Powerline

;;(require 'powerline)
;;(powerline-default-theme)
;;(set-face-attribute 'mode-line nil :height 105)

(use-package smartparens
  :diminish smartparens-mode
  :init (smartparens-global-mode)
  :config 
  (progn
    (show-smartparens-global-mode t)
    (sp-with-modes '(rhtml-mode)
      (sp-local-pair "<" ">")
      (sp-local-pair "<%" "%>"))
    (sp-with-modes '(php-mode)
      (sp-local-pair "<?php" "?>"))
    )
  )

(use-package helm-dash
  :diminish helm-dash
  :config (progn
            (setq helm-dash-docsets-path (format "%s/.emacs.d/docsets" (getenv "HOME")))
            (setq browse-url-browser-function 'w3m)
            ;;setq  helm-dash-common-docsets '("Ruby_2" "Ruby on Rails"
            ;;                                 "HTML" "CSS" "JavaScript" "CoffeeScript"
            ;;                                 "Common_Lisp" "Clojure"
            ;;                                 "C" "Go"
            ;;                                 "SQLite" "MySQL" "Redis" "MongoDB"
            ;;                                 "Qt"
            ;;                                 "Vagrant" "Nginx"
            ;;                                 )
            ;;      )
            )
  :bind ("\C-cd" . helm-dash-at-point)
  )

(use-package yasnippet
  :diminish yas-global-mode
  :init (yas-global-mode 1)
  )
