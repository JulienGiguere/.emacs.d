;;; siren-neotree.el --- jimeh's Emacs Siren: neotree configuration.

;;; Commentary:

;; Basic configuration for neotree.

;;; Code:


;(require 'siren-all-the-icons)
;;(require 'siren-projectile)
;(require 'all-the-icons)

;;(use-package neotree
  ;;:bind
  ;;("C-x C-p" . neotree-toggle)
  ;;("C-x p" . neotree-project-dir)

  ;;:init
  ;;(defun neotree-project-dir ()
   ;; "Open NeoTree using the project root, using find-file-in-project,
;;or the current buffer directory."
  ;;  (interactive)
    ;;(let ((project-dir (ignore-errors (projectile-project-root)))
      ;;    (file-name (buffer-file-name))
        ;;  (neo-smart-open nil))
      ;;(neotree-show)
     ;; (if project-dir (neotree-dir project-dir))
     ;; (if file-name (neotree-find file-name))))

;;  (defun neotree-project-dir-toggle ()
  ;;  "Toggle opening NeoTree using the project root, using find-file-in-project,
;;or the current buffer directory."
  ;;  (interactive)
    ;;(if (and (fboundp 'neo-global--window-exists-p)
    ;;         (neo-global--window-exists-p))
    ;;    (neotree-hide)
    ;;  (neotree-project-dir)))

  ;;:config

 ;; (setq neo-theme (if window-system 'nerd))
;(if window-system 'nerd)

  ;;(setq neo-autorefresh t
    ;;    neo-force-change-root t
      ;;  neo-mode-line-type 'default
      ;;  neo-show-hidden-files t
      ;;  neo-show-updir-line nil
      ;;  neo-smart-open nil
      ;;  neo-toggle-window-keep-p t
        ;; neo-vc-integration '(face char)
      ;;  neo-window-width 42))
200~(use-package neotree
      :config
      ;; modified version of https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
      (defun neotree-project-tree-open ()
        (interactive)
        (let ((project-dir (ignore-errors (projectile-project-root)))
              (file-name (buffer-file-name)))
          (if project-dir
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name))
            (neotree-find)))
        (neo-global--select-window))

      (defun neotree-project-tree-toggle ()
        (interactive)
        (if (neo-global--window-exists-p)
            (neotree-hide)
          (neotree-project-tree-open)))

      (global-set-key [f8] 'neotree-project-tree-toggle)

      (setq neo-theme 'arrow)
      (setq neo-window-width 35)

      ;; https://github.com/jaypei/emacs-neotree/issues/77 + https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
      (defun custom-neotree-enter-hide ()
        (interactive)
        (neotree-enter)
        (let ((current (neo-buffer--get-filename-current-line)))
          (if (not (and current (file-accessible-directory-p current)))
              (neotree-hide)))
        )

      (defun custom-neotree-peek ()
        (interactive)
        (let ((neo-window (neo-global--get-window)))
          (neotree-enter)
          (select-window neo-window))
        )

      (add-hook
       'neotree-mode-hook
       (lambda ()
         (define-key neotree-mode-map (kbd "RET") 'custom-neotree-enter-hide)))

      (add-hook
       'neotree-mode-hook
       (lambda ()
         (define-key neotree-mode-map (kbd "TAB") 'custom-neotree-peek))))201~200~(use-package neotree
                                                                                    :config
                                                                                    ;; modified version of https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
                                                                                    (defun neotree-project-tree-open ()
                                                                                      (interactive)
                                                                                      (let ((project-dir (ignore-errors (projectile-project-root)))
                                                                                            (file-name (buffer-file-name)))
                                                                                        (if project-dir
                                                                                            (progn
                                                                                              (neotree-dir project-dir)
                                                                                              (neotree-find file-name))
                                                                                          (neotree-find)))
                                                                                      (neo-global--select-window))

                                                                                    (defun neotree-project-tree-toggle ()
                                                                                      (interactive)
                                                                                      (if (neo-global--window-exists-p)
                                                                                          (neotree-hide)
                                                                                        (neotree-project-tree-open)))

                                                                                    (global-set-key [f8] 'neotree-project-tree-toggle)

                                                                                    (setq neo-theme 'arrow)
                                                                                    (setq neo-window-width 35)

                                                                                    ;; https://github.com/jaypei/emacs-neotree/issues/77 + https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
                                                                                    (defun custom-neotree-enter-hide ()
                                                                                      (interactive)
                                                                                      (neotree-enter)
                                                                                      (let ((current (neo-buffer--get-filename-current-line)))
                                                                                        (if (not (and current (file-accessible-directory-p current)))
                                                                                            (neotree-hide)))
                                                                                      )

                                                                                    (defun custom-neotree-peek ()
                                                                                      (interactive)
                                                                                      (let ((neo-window (neo-global--get-window)))
                                                                                        (neotree-enter)
                                                                                        (select-window neo-window))
                                                                                      )

                                                                                    (add-hook
                                                                                     'neotree-mode-hook
                                                                                     (lambda ()
                                                                                       (define-key neotree-mode-map (kbd "RET") 'custom-neotree-enter-hide)))

                                                                                    (add-hook
                                                                                     'neotree-mode-hook
                                                                                     (lambda ()
                                                                                       (define-key neotree-mode-map (kbd "TAB") 'custom-neotree-peek))))201~200~(use-package neotree
                                                                                                                                                                  :config
                                                                                                                                                                  ;; modified version of https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
                                                                                                                                                                  (defun neotree-project-tree-open ()
                                                                                                                                                                    (interactive)
                                                                                                                                                                    (let ((project-dir (ignore-errors (projectile-project-root)))
                                                                                                                                                                          (file-name (buffer-file-name)))
                                                                                                                                                                      (if project-dir
                                                                                                                                                                          (progn
                                                                                                                                                                            (neotree-dir project-dir)
                                                                                                                                                                            (neotree-find file-name))
                                                                                                                                                                        (neotree-find)))
                                                                                                                                                                    (neo-global--select-window))

                                                                                                                                                                  (defun neotree-project-tree-toggle ()
                                                                                                                                                                    (interactive)
                                                                                                                                                                    (if (neo-global--window-exists-p)
                                                                                                                                                                        (neotree-hide)
                                                                                                                                                                      (neotree-project-tree-open)))

                                                                                                                                                                  (global-set-key [f8] 'neotree-project-tree-toggle)

                                                                                                                                                                  (setq neo-theme 'arrow)
                                                                                                                                                                  (setq neo-window-width 35)

                                                                                                                                                                  ;; https://github.com/jaypei/emacs-neotree/issues/77 + https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
                                                                                                                                                                  (defun custom-neotree-enter-hide ()
                                                                                                                                                                    (interactive)
                                                                                                                                                                    (neotree-enter)
                                                                                                                                                                    (let ((current (neo-buffer--get-filename-current-line)))
                                                                                                                                                                      (if (not (and current (file-accessible-directory-p current)))
                                                                                                                                                                          (neotree-hide)))
                                                                                                                                                                    )

                                                                                                                                                                  (defun custom-neotree-peek ()
                                                                                                                                                                    (interactive)
                                                                                                                                                                    (let ((neo-window (neo-global--get-window)))
                                                                                                                                                                      (neotree-enter)
                                                                                                                                                                      (select-window neo-window))
                                                                                                                                                                    )

                                                                                                                                                                  (add-hook
                                                                                                                                                                   'neotree-mode-hook
                                                                                                                                                                   (lambda ()
                                                                                                                                                                     (define-key neotree-mode-map (kbd "RET") 'custom-neotree-enter-hide)))

                                                                                                                                                                  (add-hook
                                                                                                                                                                   'neotree-mode-hook
                                                                                                                                                                   (lambda ()
                                                                                                                                                                     (define-key neotree-mode-map (kbd "TAB") 'custom-neotree-peek))))201~200~(use-package neotree
                                                                                                                                                                                                                                                :config
                                                                                                                                                                                                                                                ;; modified version of https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
                                                                                                                                                                                                                                                (defun neotree-project-tree-open ()
                                                                                                                                                                                                                                                  (interactive)
                                                                                                                                                                                                                                                  (let ((project-dir (ignore-errors (projectile-project-root)))
                                                                                                                                                                                                                                                        (file-name (buffer-file-name)))
                                                                                                                                                                                                                                                    (if project-dir
                                                                                                                                                                                                                                                        (progn
                                                                                                                                                                                                                                                          (neotree-dir project-dir)
                                                                                                                                                                                                                                                          (neotree-find file-name))
                                                                                                                                                                                                                                                      (neotree-find)))
                                                                                                                                                                                                                                                  (neo-global--select-window))

                                                                                                                                                                                                                                                (defun neotree-project-tree-toggle ()
                                                                                                                                                                                                                                                  (interactive)
                                                                                                                                                                                                                                                  (if (neo-global--window-exists-p)
                                                                                                                                                                                                                                                      (neotree-hide)
                                                                                                                                                                                                                                                    (neotree-project-tree-open)))

                                                                                                                                                                                                                                                (global-set-key [f8] 'neotree-project-tree-toggle)

                                                                                                                                                                                                                                                (setq neo-theme 'arrow)
                                                                                                                                                                                                                                                (setq neo-window-width 35)

                                                                                                                                                                                                                                                ;; https://github.com/jaypei/emacs-neotree/issues/77 + https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
                                                                                                                                                                                                                                                (defun custom-neotree-enter-hide ()
                                                                                                                                                                                                                                                  (interactive)
                                                                                                                                                                                                                                                  (neotree-enter)
                                                                                                                                                                                                                                                  (let ((current (neo-buffer--get-filename-current-line)))
                                                                                                                                                                                                                                                    (if (not (and current (file-accessible-directory-p current)))
                                                                                                                                                                                                                                                        (neotree-hide)))
                                                                                                                                                                                                                                                  )

                                                                                                                                                                                                                                                (defun custom-neotree-peek ()
                                                                                                                                                                                                                                                  (interactive)
                                                                                                                                                                                                                                                  (let ((neo-window (neo-global--get-window)))
                                                                                                                                                                                                                                                    (neotree-enter)
                                                                                                                                                                                                                                                    (select-window neo-window))
                                                                                                                                                                                                                                                  )

                                                                                                                                                                                                                                                (add-hook
                                                                                                                                                                                                                                                 'neotree-mode-hook
                                                                                                                                                                                                                                                 (lambda ()
                                                                                                                                                                                                                                                   (define-key neotree-mode-map (kbd "RET") 'custom-neotree-enter-hide)))

                                                                                                                                                                                                                                                (add-hook
                                                                                                                                                                                                                                                 'neotree-mode-hook
                                                                                                                                                                                                                                                 (lambda ()
                                                                                                                                                                                                                                                   (define-key neotree-mode-map (kbd "TAB") 'custom-neotree-peek))))201~200~(use-package neotree
                                                                                                                                                                                                                                                                                                                              :config
                                                                                                                                                                                                                                                                                                                              ;; modified version of https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
                                                                                                                                                                                                                                                                                                                              (defun neotree-project-tree-open ()
                                                                                                                                                                                                                                                                                                                                (interactive)
                                                                                                                                                                                                                                                                                                                                (let ((project-dir (ignore-errors (projectile-project-root)))
                                                                                                                                                                                                                                                                                                                                      (file-name (buffer-file-name)))
                                                                                                                                                                                                                                                                                                                                  (if project-dir
                                                                                                                                                                                                                                                                                                                                      (progn
                                                                                                                                                                                                                                                                                                                                        (neotree-dir project-dir)
                                                                                                                                                                                                                                                                                                                                        (neotree-find file-name))
                                                                                                                                                                                                                                                                                                                                    (neotree-find)))
                                                                                                                                                                                                                                                                                                                                (neo-global--select-window))

                                                                                                                                                                                                                                                                                                                              (defun neotree-project-tree-toggle ()
                                                                                                                                                                                                                                                                                                                                (interactive)
                                                                                                                                                                                                                                                                                                                                (if (neo-global--window-exists-p)
                                                                                                                                                                                                                                                                                                                                    (neotree-hide)
                                                                                                                                                                                                                                                                                                                                  (neotree-project-tree-open)))

                                                                                                                                                                                                                                                                                                                              (global-set-key [f8] 'neotree-project-tree-toggle)

                                                                                                                                                                                                                                                                                                                              (setq neo-theme 'arrow)
                                                                                                                                                                                                                                                                                                                              (setq neo-window-width 35)

                                                                                                                                                                                                                                                                                                                              ;; https://github.com/jaypei/emacs-neotree/issues/77 + https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
                                                                                                                                                                                                                                                                                                                              (defun custom-neotree-enter-hide ()
                                                                                                                                                                                                                                                                                                                                (interactive)
                                                                                                                                                                                                                                                                                                                                (neotree-enter)
                                                                                                                                                                                                                                                                                                                                (let ((current (neo-buffer--get-filename-current-line)))
                                                                                                                                                                                                                                                                                                                                  (if (not (and current (file-accessible-directory-p current)))
                                                                                                                                                                                                                                                                                                                                      (neotree-hide)))
                                                                                                                                                                                                                                                                                                                                )

                                                                                                                                                                                                                                                                                                                              (defun custom-neotree-peek ()
                                                                                                                                                                                                                                                                                                                                (interactive)
                                                                                                                                                                                                                                                                                                                                (let ((neo-window (neo-global--get-window)))
                                                                                                                                                                                                                                                                                                                                  (neotree-enter)
                                                                                                                                                                                                                                                                                                                                  (select-window neo-window))
                                                                                                                                                                                                                                                                                                                                )

                                                                                                                                                                                                                                                                                                                              (add-hook
                                                                                                                                                                                                                                                                                                                               'neotree-mode-hook
                                                                                                                                                                                                                                                                                                                               (lambda ()
                                                                                                                                                                                                                                                                                                                                 (define-key neotree-mode-map (kbd "RET") 'custom-neotree-enter-hide)))

                                                                                                                                                                                                                                                                                                                              (add-hook
                                                                                                                                                                                                                                                                                                                               'neotree-mode-hook
                                                                                                                                                                                                                                                                                                                               (lambda ()
                                                                                                                                                                                                                                                                                                                                 (define-key neotree-mode-map (kbd "TAB") 'custom-neotree-peek))))201~200~(use-package neotree
                                                                                                                                                                                                                                                                                                                                                                                                            :config
                                                                                                                                                                                                                                                                                                                                                                                                            ;; modified version of https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
                                                                                                                                                                                                                                                                                                                                                                                                            )
(provide 'siren-neotree)
;;; siren-neotree.el ends here
