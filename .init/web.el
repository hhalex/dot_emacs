(use-package web-mode
  :mode "\\.erb\\'"
  :init (add-hook 'web-mode-hook 'zencoding-mode)
  :config (progn
            (setq web-mode-enable-auto-pairing nil)
            (sp-pair "<%" "%>")
            (defun sp-web-mode-is-code-context (id action context)
              (when (and (eq action 'insert)
                         (not (or (get-text-property (point) 'part-side)
                                  (get-text-property (point) 'block-side))))

                t))

            (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))
            )
  )

(use-package sass-mode
  :mode "\\.scss\\'")
