(delete-selection-mode t)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

;;
;; <Tramp mode> : édition des fichiers en ligne
;;

;; Le mot de passe pour la connexion n'expire jamais
(setq password-cache-expiry nil)

;; Le dossier où sont stockés les fichiers temporaires
(setq tramp-auto-save-directory "~/.tramp")

(defun display-time-file-nonempty-p (file)
  (let ((remote-file-name-inhibit-cache
	 (- display-time-interval 20)
	 (and (file-exists-p file)
	      (< 0 (nth 7 (file-attributes
			   (file-chase-links file)))))))))

(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

;;
;; </Tramp mode>
;;

;; Autosave 
(setq backup-directory-alist `((".*" . , "~/.emacs-backup-files")))
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs-backup-files" t)))


;; Package sources

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
