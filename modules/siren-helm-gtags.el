;;; siren-helm-gtags.el --- jimeh's Emacs Siren: helm-gtags configuration.

;;; Commentary:

;; Basic configuration for helm-gtags.

;;; Code:

(require 'siren-helm)

(use-package helm-gtags
  :defer t
  :config
  (setq helm-gtags-auto-update t
        helm-gtags-direct-helm-completing t
        helm-gtags-fuzzy-match t
        helm-gtags-ignore-case t))

(provide 'siren-helm-gtags)
;;; siren-helm-gtags.el ends here
