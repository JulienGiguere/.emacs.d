;;
;; ███████╗███╗   ███╗ █████╗  ██████╗███████╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
;; ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
;; █████╗  ██╔████╔██║███████║██║     ███████╗    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
;; ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
;; ███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
;; ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indent-guides-auto-character-face-perc 20)
 '(highlight-indent-guides-auto-even-face-perc 15)
 '(highlight-indent-guides-auto-odd-face-perc 15)
 '(highlight-indent-guides-method 'character)
 '(package-selected-packages
  '(svg-lib svg-tag-mode sideline-blame git-blamed highlight-indentation markdown-mode simple-httpd websocket org-roam helm yaml-mode which-key vue-mode undo-tree try treemacs-tab-bar treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil swiper rust-mode php-mode org-bullets multiple-cursors image-dired+ auto-complete highlight-indent-guides drag-stuff company-restclient all-the-icons-dired lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode zenburn-theme json-mode)))

;; Custom Commands
  ;; Refreshes Emacs config
  (global-set-key (kbd "C-c r") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))

  ;;Renders Images inline of an org file
  (defun do-org-show-all-inline-images ()
    (interactive)
    (org-display-inline-images t t))
  (global-set-key (kbd "C-c i")
                'do-org-show-all-inline-images)

  (global-set-key (kbd "C-c c")
                     'comment-region)
  (global-set-key (kbd "C-c u")
                     'uncomment-region)

;; Write backups to ~/.emacs.d/backup/ to no clutter working directories
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

;; Package Management
(require 'package)
    (add-to-list 'package-archives
		 '("melpa"."https://melpa.org/packages/"))
  (package-initialize)
    ;; Bootstrap use-package
    (unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;; UI
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)

  (global-hl-line-mode t)

;; Startup - Start Page
  (setq inhibit-startup-message t)
  (setq inhibit-splash-screen t)
  (setq initial-buffer-choice "~/.emacs.d/start.org")

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/julien-theme.el")  

;; Set colors of marked region & color of marked text
(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")
(set-face-background hl-line-face "gray13") 

;;(set-frame-parameter (selected-frame) 'alpha '(80 . 79))

(defvar blink-cursor-colors (list "#FFFFFF" "#FF7F00")
  "On each blink the cursor will cycle to the next color in this list.")
(setq blink-cursor-count 0)
(defun blink-cursor-timer-function ()
  (when (not (internal-show-cursor-p))
    (when (>= blink-cursor-count (length blink-cursor-colors))
      (setq blink-cursor-count 0))
    (set-cursor-color (nth blink-cursor-count blink-cursor-colors))
    (setq blink-cursor-count (+ 1 blink-cursor-count)))
  (internal-show-cursor nil (not (internal-show-cursor-p))))

;; Displays the key bindings following your currently entered incomplete command (a prefix) in a popup
(use-package which-key
:ensure t
:config
(which-key-mode))

;; Treemacs -Only using the icons from treemacs into dired
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
	  treemacs-deferred-git-apply-delay        0.5
	  treemacs-directory-name-transformer      #'identity
	  treemacs-display-in-side-window          t
	  treemacs-eldoc-display                   'simple
	  treemacs-file-event-delay                2000
	  treemacs-file-extension-regex            treemacs-last-period-regex-value
	  treemacs-file-follow-delay               0.2
	  treemacs-file-name-transformer           #'identity
	  treemacs-follow-after-init               t
	  treemacs-expand-after-init               t
	  treemacs-find-workspace-method           'find-for-file-or-pick-first
	  treemacs-git-command-pipe                ""
	  treemacs-goto-tag-strategy               'refetch-index
	  treemacs-header-scroll-indicators        '(nil . "^^^^^^")
	  treemacs-hide-dot-git-directory          t
	  treemacs-indentation                     2
	  treemacs-indentation-string              " "
	  treemacs-is-never-other-window           nil
	  treemacs-max-git-entries                 5000
	  treemacs-missing-project-action          'ask
	  treemacs-move-forward-on-expand          nil
	  treemacs-no-png-images                   nil
	  treemacs-no-delete-other-windows         t
	  treemacs-project-follow-cleanup          nil
	  treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
	  treemacs-position                        'left
	  treemacs-read-string-input               'from-child-frame
	  treemacs-recenter-distance               0.1
	  treemacs-recenter-after-file-follow      nil
	  treemacs-recenter-after-tag-follow       nil
	  treemacs-recenter-after-project-jump     'always
	  treemacs-recenter-after-project-expand   'on-distance
	  treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
	  treemacs-project-follow-into-home        nil
	  treemacs-show-cursor                     nil
	  treemacs-show-hidden-files               t
	  treemacs-silent-filewatch                nil
	  treemacs-silent-refresh                  nil
	  treemacs-sorting                         'alphabetic-asc
	  treemacs-select-when-already-in-treemacs 'move-back
	  treemacs-space-between-root-nodes        t
	  treemacs-tag-follow-cleanup              t
	  treemacs-tag-follow-delay                1.5
	  treemacs-text-scale                      nil
	  treemacs-user-mode-line-format           nil
	  treemacs-user-header-line-format         nil
	  treemacs-wide-toggle-width               70
	  treemacs-width                           35
	  treemacs-width-increment                 1
	  treemacs-width-is-initially-locked       t
	  treemacs-workspace-switch-cleanup        nil)

    ;; Uuncomment this to double the icon size.
    ;; (treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
(treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
		 (not (null treemacs-python-executable)))
(`(t . t)
 (treemacs-git-mode 'deferred))
(`(t . _)
 (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
	("M-0"       . treemacs-select-window)
	("C-x t 1"   . treemacs-delete-other-windows)
	("C-x t t"   . treemacs)
	("C-x t d"   . treemacs-select-directory)
	("C-x t B"   . treemacs-bookmark)
	("C-x t C-t" . treemacs-find-file)
	("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

;;Identation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(setq js-indent-level 2)
  
;;defun custom-tab-mode-hook ()
;;  (setq tab-width 2))
;;add-hook 'prog-mode-hook #'jpk/c-mode-common-hook)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;;drag-struff
(use-package drag-stuff
  :ensure t )

;;Org-mode
(use-package org-bullets
	:ensure t
	:init
	(setq org-bullets-bullet-list
	      '("◉" "◎" "◇" "○" "►" "•"))
	:config
	(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-todo-keywords
  '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "PROJ(p)" "LOOP(l)" "DONE(d)")))

;; Org svg

(defun svg-progress-percent (value)
  (save-match-data
   (svg-image (svg-lib-concat
               (svg-lib-progress-bar  (/ (string-to-number value) 100.0)
                                 nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
               (svg-lib-tag (concat value "%")
                            nil :stroke 0 :margin 0)) :ascent 'center)))

(defun svg-progress-count (value)
  (save-match-data
    (let* ((seq (split-string value "/"))           
           (count (if (stringp (car seq))
                      (float (string-to-number (car seq)))
                    0))
           (total (if (stringp (cadr seq))
                      (float (string-to-number (cadr seq)))
                    1000)))
      (svg-image (svg-lib-concat
                  (svg-lib-progress-bar (/ count total) nil
                                        :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                  (svg-lib-tag value nil
                               :stroke 0 :margin 0)) :ascent 'center))))

(defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
(defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
(defconst day-re "[A-Za-z]\\{3\\}")
(defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))

(use-package svg-tag-mode
  :ensure t
  :hook org-mode
  :config
  (setq svg-tag-tags
        '(
          ;; (":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
          ;; (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))

          ;;TODOs
          ("TODO" . ((lambda (tag) (svg-tag-make tag :face '(:foreground "IndianRed" :weight bold) :inverse t))))
	        ("NEXT" . ((lambda (tag) (svg-tag-make tag :face '(:foreground "#007acc" :weight bold) :inverse t))))
	        ("WAIT" . ((lambda (tag) (svg-tag-make tag :face '(:foreground "GoldenRod" :weight bold) :inverse t))))
	        ("PROJ" . ((lambda (tag) (svg-tag-make tag :face '(:foreground "DarkMagenta" :weight bold) :inverse t))))
	        ("LOOP" . ((lambda (tag) (svg-tag-make tag :face '(:foreground "Salmon" :weight bold) :inverse t))))
	        ("DONE" . ((lambda (tag) (svg-tag-make tag :face '(:foreground "DarkSeaGreen" :weight bold :strike-through t) :inverse t))))

          ;; Citation of the form [cite:@Knuth:1984] 
          ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)
                                            (svg-tag-make tag
                                                          :inverse t
                                                          :beg 7 :end -1
                                                          :crop-right t))))
          ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)
                                                     (svg-tag-make tag
                                                                   :end -1
                                                                   :crop-left t))))
          ;; Commands
          ("{[0-9a-zA-Z- ]+?}" . ((lambda (tag)
                                    (svg-tag-make tag :face 'font-lock-comment-face
                                                  :margin 0 :beg 1 :end -1))))
          ;; Active date (with or without day name, with or without time)
          ;; (,(format "\\(<%s>\\)" date-re) .
          ;;  ((lambda (tag)
          ;;     (svg-tag-make tag :beg 1 :end -1 :margin 0))))
          ;; (,(format "\\(<%s \\)%s>" date-re day-time-re) .
          ;;  ((lambda (tag)
          ;;     (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))
          ;; (,(format "<%s \\(%s>\\)" date-re day-time-re) .
          ;;  ((lambda (tag)
          ;;     (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))
          ;; ;; Inactive date  (with or without day name, with or without time)
          ;; (,(format "\\(\\[%s\\]\\)" date-re) .
          ;;  ((lambda (tag)
          ;;     (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))
          ;; (,(format "\\(\\[%s \\)%s\\]" date-re day-time-re) .
          ;;  ((lambda (tag)
          ;;     (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))
          ;; (,(format "\\[%s \\(%s\\]\\)" date-re day-time-re) .
          ;;  ((lambda (tag)
          ;;     (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date))))
          ;; ;; Progress
          ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
                                              (svg-progress-percent (substring tag 1 -2)))))
          ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
                                            (svg-progress-count (substring tag 1 -1)))))
          )
        )
  )
  
;; org-roam dependencies
(use-package websocket
  :ensure t)

(use-package simple-httpd
  :ensure t)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Documents/RoamNotes")
  :bind (("C-c n l" . org-roam-buffer-toggle)
	       ("C-c n f" . org-roam-node-find)
	       ("C-c n i" . org-roam-node-insert)
	       ("C-c n g" . org-roam-ui-mode)
	       ("C-c n a" . org-roam-alias-add)
	       ;; Dailies
	       ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (require 'org-roam-protocol)
  (org-roam-setup))
(add-to-list 'load-path "~/.emacs.d/gitclone/org-roam-ui/")
(load-library "org-roam-ui")

;; LSP - InteliSense
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))
;;(helm-mode)
(require 'helm-xref)
;;(define-key global-map [remap find-file] #'helm-find-files)
;;(define-key global-map [remap execute-extended-command] #'helm-M-x)
;;(define-key global-map [remap switch-to-buffer] #'helm-mini)
(which-key-mode)
(add-hook 'prog-mode-hook #'lsp)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'
(with-eval-after-load 'lsp-mode
  (require 'dap-chrome)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; Restclient
(use-package restclient
       :ensure t)
      (use-package try
	      :ensure t)
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

;; helm
(use-package helm
:ensure t)

;; avy
(use-package avy
    :ensure t)

;; ivy
(use-package ivy
    :ensure t
    :config
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "(%d/%d) "))

;; multiple-cursors
(use-package multiple-cursors
    :ensure t
    :config
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; swiper
(use-package swiper
    :ensure t
    :bind ("C-s" . swiper))

;; (use-package auto-complete
;;     :ensure t
;;    :config
;;    (ac-config-default)
;;    (global-auto-complete-mode 1))

(use-package company
   :ensure t
   :config
   (setq company-idle-delay 0)
   (setq company-minimum-prefix-length 3)
   (global-company-mode 1))

;; Auto closing pairs of characters
(electric-pair-mode 1)

;; Example of auto insert code in a c or c++ file.
  (eval-after-load 'autoinsert
    '(define-auto-insert
       '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
       '("Short description: "
	 "/*" \n
	 (file-name-nondirectory (buffer-file-name))
	 " -- " str \n
	 "  Date -- "(format-time-string "%Y-%m-%d") \n
	 "  Auteur(s) -- "
	 " */" > \n \n
	 "#include <iostream>" \n \n
	 "using namespace std;" \n \n
	 "main() " 
	 "{" \n
	 > _ \n
	 "}" > \n)))
