(use-package c++-mode
  :mode (("\\.cpp\\'" . c++-mode) ("\\.h\\'" . c++-mode) ("\\.hpp\\'" . c++-mode))
  :init (progn
          (add-hook 'c++-mode-hook 'flycheck-mode)
          (add-hook 'c++-mode-hook 'eldoc-mode)
          ; Enable C++11 support for gcc
          (add-hook 'c++-mode-hook 'ggtags-mode)
          (add-hook 'c++-mode-hook 'highlight-indentation-current-column-mode)
          (add-hook 'c++-mode-hook
                    (lambda ()
                      (setq flycheck-clang-standard-library "libc++")
                      (setq flycheck-clang-language-standard "c++11")
                      (require 'company-c-headers)
                      (add-to-list 'company-backends 'company-c-headers)
                      (add-to-list 'company-c-headers-path-system "/usr/include/c++/v1/")
              
                      (setq company-clang-arguments '("-std=c++11"
                                                     "-stdlib=libc++"
                                                     "-xc++"))))
          )
  
  :config 
  (progn
    
    (use-package highlight-indentation
      
      )

    (use-package flycheck-google-cpplint
      :init (require 'flycheck-google-cpplint)
      :config (progn
                (custom-set-variables
                 '(flycheck-c/c++-googlelint-executable "/usr/local/bin/cpplint.py"))
                (custom-set-variables
                 '(flycheck-googlelint-verbose "3")
                 '(flycheck-googlelint-filter "-whitespace,+whitespace/braces")
                 '(flycheck-googlelint-root "project/src")
                 '(flycheck-googlelint-linelength "120"))
                (flycheck-add-next-checker 'c/c++-clang
                                           '(warnings-only . c/c++-googlelint))))
    
    (add-hook 'c++-mode-hook (lambda () (setq-local helm-dash-docsets '("C++" "Boost"))))

    ;; Config des modes globaux
    (add-to-list 'company-backends 'company-gtags)
    )
  )
