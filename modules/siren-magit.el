;;; siren-magit.el --- jimeh's Emacs Siren: magit configuration.

;;; Commentary:

;; Basic configuration for magit.

;;; Code:

(siren-require-packages '(magit))

(require 'siren-fci)
(require 'siren-ediff)
(require 'magit)

(setq magit-completing-read-function 'magit-ido-completing-read)
(setq magit-status-buffer-switch-function 'switch-to-buffer)
(setq magit-bury-buffer-function 'bury-buffer)
(setq magit-restore-window-configuration nil)
(setq magit-revert-buffers 'silent)
(setq magit-default-tracking-name-function
      'magit-default-tracking-name-branch-only)
(setq magit-repository-directories
      (quote ("~/Projects" "~/src" "~/.emacs.d" "~/.dotfiles")))

(setq magit-display-buffer-function
      'magit-display-buffer-same-window-except-diff-v1)

;; Configure magit-mode
(defun siren-magit-mode-defaults ()
  ;; (linum-mode t) ;; Causes magit to freeze sometimes
  )

(setq siren-magit-mode-hook 'siren-magit-mode-defaults)

(add-hook 'magit-mode-hook (lambda () (run-hooks 'siren-magit-mode-hook)))

;; Configure git-commit-mode
(defun siren-git-commit-mode-defaults ()
  (subword-mode)
  (setq tab-width 2)
  ;; (flyspell-mode) ;; in GUI causes git-commit-mode to lock up emacs
  (linum-mode t)
  (auto-fill-mode))

(setq siren-git-commit-mode-hook 'siren-git-commit-mode-defaults)

(add-hook 'git-commit-mode-hook (lambda ()
                                  (run-hooks 'siren-git-commit-mode-hook)))

;; Keybindings
(global-set-key (kbd "C-x g") 'magit-status)

;; Aliases
(defalias 'bl 'magit-blame)


(provide 'siren-magit)
;;; siren-magit.el ends here
