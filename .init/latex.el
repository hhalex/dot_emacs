
(use-package latex-mode
  :ensure auctex
  :mode "\\.tex\\'"
  :config 
  (progn
    (use-package company
      :diminish company-mode
      :init (add-hook 'latex-mode-hook 'company-mode)
      )

    ;; Config des modes globaux
    
    ;; helm-dash seulement avec les docs ruby et ror
    (add-hook 'latex-mode-hook '(lambda () (setq-local helm-dash-docsets '("Latex"))))

    
    )
  )



