(defun compile-init-file ()
      (let ((byte-compile-warnings '(unresolved)))
        (byte-compile-file user-init-file)
        (message "Emacs init file saved and compiled.")))
(defun my-emacs-lisp-mode-hook ()


  ;; Load paths 
  (add-to-list 'load-path "~/.emacs.d/elpa")
  (add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/perso/themes"))
			 
  (if (eq system-type 'windows-nt)
    (progn 
      (setenv "PATH" (concat "c:/cygwin/bin;" (getenv "PATH")))
      (setq exec-path (cons "c:/cygwin/bin/" exec-path))
      (require 'cygwin-mount)
      (cygwin-mount-activate)))

  (load "~/.emacs.d/.init/general.el")
  (load "~/.emacs.d/.init/global.el")
  (load "~/.emacs.d/.init/magit.el")

  (load "~/.emacs.d/.init/javascript.el")
  (load "~/.emacs.d/.init/python.el")
;;  (load "~/.emacs.d/.init/c++.el")
  (load "~/.emacs.d/.init/ruby.el")
  (load "~/.emacs.d/.init/web.el")
  (load "~/.emacs.d/.init/org.el")
  (load "~/.emacs.d/.init/latex.el")
;;  (load "~/.emacs.d/.init/csharp.el")

  ;; Themes
  (load-theme 'jazz t t)
  (enable-theme 'jazz)

  ;; Compilation du .emacs
  (if (string-equal buffer-file-name (expand-file-name user-init-file))
      (progn (add-hook 'after-save-hook 'compile-init-file t t)
    	     ))
  )

(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(magit-auto-revert-mode nil))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#ffffff"))))
 '(company-scrollbar-fg ((t (:background "#ffffff"))))
 '(company-tooltip ((t (:inherit font-lock-comment-face :background "#ffffff"))))
 '(company-tooltip-common ((t (:inherit font-lock-string-face :background "#ffffff"))))
 '(company-tooltip-selection ((t (:inherit font-lock-keyword-face :background "#ffffff")))))
