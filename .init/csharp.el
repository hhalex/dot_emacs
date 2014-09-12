(use-package csharp-mode
  :ensure csharp-mode
  :mode "\\.cs\\'"
  :config (progn
            (use-package company
              :diminish company-mode
              :init (add-hook 'csharp-mode-hook 'company-mode)
              :config 
              )

            (use-package omnisharp
              :init (add-hook 'csharp-mode-hook 'omnisharp-mode)
              :config (progn
                        (setq omnisharp-server-executable-path "/usr/local/perso_alex/OmniSharpServer/OmniSharp/bin/Debug/OmniSharp.exe")
                        (add-to-list 'company-backends 'company-omnisharp)
                        
                        )
              )
            (use-package flycheck
              :commands omnisharp-start-omnisharp-server
              )
            )
  )
