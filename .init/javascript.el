(use-package js2-mode
  :ensure js2-mode
  :mode "\\.js\\'"
  :config 
  (progn
    (use-package highlight-indentation
      :init (add-hook 'js2-mode-hook
                      (lambda () (highlight-indentation-current-column-mode)))
      )
    
    ;; Config des modes globaux
    
    ;; helm-dash JavaScript
    (add-hook 'js2-mode-hook '(lambda () (setq-local helm-dash-docsets '("JavaScript"))))
    
    )
  )


