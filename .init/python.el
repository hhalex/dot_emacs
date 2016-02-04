(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python2" . python-mode)
  :init (progn
          (setq python-shell-interpreter "python2")
          (add-hook 'python-mode-hook 'anaconda-mode)
          (add-hook 'python-mode-hook 'eldoc-mode)
          
          )
  :config 
  (progn
    (use-package highlight-indentation
      :init (add-hook 'python-mode-hook
                      (lambda () (highlight-indentation-current-column-mode)))
      )
    
    ;; Config des modes globaux
    (add-to-list 'company-backends 'company-jedi)
    
    ;; helm-dash Python
    (add-hook 'python-mode-hook '(lambda () (setq-local helm-dash-docsets '("Python 2"))))
    
    )
  )
