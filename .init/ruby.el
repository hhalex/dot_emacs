
(use-package enh-ruby-mode
  :ensure enh-ruby-mode
  :mode "\\.rb\\'"
  :interpreter "ruby"
  :config 
  (progn
    (use-package inf-ruby
      :ensure inf-ruby
      :demand t
      :init (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
      :bind ("C-c C-s" . inf-ruby-console-auto)
      )
    (use-package company
      :diminish company-mode
      :init (add-hook 'enh-ruby-mode-hook 'company-mode)
      )

    (use-package robe
      :diminish robe-mode
      :init (add-hook 'enh-ruby-mode-hook 'robe-mode)
      :config (progn
                (push 'company-robe company-backends)
                )
      )

    ;; Config des modes globaux
    
    ;; helm-dash seulement avec les docs ruby et ror
    (add-hook 'enh-ruby-mode-hook '(lambda () (setq-local helm-dash-docsets '("Ruby" "Ruby on rails"))))

    
    )
  )
