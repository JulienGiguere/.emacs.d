(defun customizations-for-go-mode ()
  (interactive)
  (flyspell-prog-mode)
  (flycheck-mode)
  (linum-mode t)
  (fci-mode)
  (hs-minor-mode 1)
  (auto-complete-mode)
  (whitespace-mode)
  (subword-mode)
  (setq tab-width 4)
  (define-key go-mode-map (kbd "RET") 'newline-and-indent)
)

(add-hook 'go-mode-hook 'customizations-for-go-mode)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)
