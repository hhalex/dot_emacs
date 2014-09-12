(defun compile-init-file ()
      (let ((byte-compile-warnings '(unresolved)))
        (byte-compile-file user-init-file)
        (message "Emacs init file saved and compiled.")))
(defun my-emacs-lisp-mode-hook ()

  ;; Load paths 
  (add-to-list 'load-path "~/.emacs.d")
  (add-to-list 'custom-theme-load-path
             (file-name-as-directory "/home/alexandre/.emacs.d/perso/themes"))

  (load "~/.emacs.d/.init/general.el")
  (load "~/.emacs.d/.init/global.el")

  (load "~/.emacs.d/.init/ruby.el")
  (load "~/.emacs.d/.init/latex.el")
  (load "~/.emacs.d/.init/csharp.el")

  ;;(load "~/.emacs.d/.emacs_init_etags")
  ;;
  ;;(load "~/.emacs.d/.emacs_init_divers")
  ;;(load "~/.emacs.d/.emacs_init_packages_sources")
  ;;(load "~/.emacs.d/.emacs_init_php")
  ;;(load "~/.emacs.d/.emacs_init_apache")
  ;;(load "~/.emacs.d/.emacs_init_latex")
  ;;(load "~/.emacs.d/.emacs_init_remote_access")
  ;;
  ;;(load "~/.emacs.d/.emacs_init_ruby")
  ;;(load "~/.emacs.d/.emacs_init_autocomplete")

  (load-theme 'comidia t t)
  (enable-theme 'comidia)

  ;; Compilation du .emacs
  (if (string-equal buffer-file-name (expand-file-name user-init-file))
      (progn (add-hook 'after-save-hook 'compile-init-file t t)
    	     ))
  )

(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(TeX-source-correlate-method (quote synctex))
;; '(TeX-source-correlate-mode t)
;; '(TeX-source-correlate-start-server t)
;; '(TeX-view-program-list (quote (("qpdfview" "qpdfview %o"))))
;; '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "qpdfview") (output-html "xdg-open"))))
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
;; '(blink-cursor-mode nil)
;; '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "k&r"))))
 '(column-number-mode t)
 '(doc-view-continuous t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
