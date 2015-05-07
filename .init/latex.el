(use-package auctex
  :mode ("\\.tex\\'" . latex-mode)
  :init (progn
          (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
          (add-hook 'LaTeX-mode-hook 'visual-line-mode)
          (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
          (add-hook 'LaTeX-mode-hook 'flyspell-mode)
          (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
          
          )
  :config (progn
            (require 'smartparens-latex)
            (setq TeX-auto-save t)
            (setq-default TeX-master nil)
            (setq TeX-parse-self t)
            (setq TeX-source-correlate-method 'synctex)
            
            ;; helm-dash seulement avec les docs ruby et ror
            (add-hook 'latex-mode-hook '(lambda () (setq-local helm-dash-docsets '("Latex"))))
            
            )
  )

;;PDF pour latex

(eval-after-load "tex" 
  '(setcdr (assoc "LaTeX" TeX-command-list)
           '("%`%l%(mode) -shell-escape%' %t"
             TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")
           )
  )

