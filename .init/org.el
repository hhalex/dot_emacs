(use-package org
  :init (progn
          
          )
  :mode ("\\.org\\'" . org-mode)
  :config 
  (progn
    (setq python-shell-interpreter "python2")
    (setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
    
;;; display/update images in the buffer after I evaluate
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
    (require 'ox-latex)
    (add-to-list 'org-latex-packages-alist '("" "minted"))
    (setq org-latex-listings 'minted)
    (setq org-latex-minted-options
           '(("frame" "lines")
             ("fontsize" "\\scriptsize")
             ("linenos" "")))
    (use-package ob-ipython
      :config (progn
                
                )
      )
    )
  )
