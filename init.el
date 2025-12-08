;;
;; ██╗███╗   ██╗██╗████████╗███████╗██╗
;; ██║████╗  ██║██║╚══██╔══╝██╔════╝██║
;; ██║██╔██╗ ██║██║   ██║   █████╗  ██║
;; ██║██║╚██╗██║██║   ██║   ██╔══╝  ██║
;; ██║██║ ╚████║██║   ██║██╗███████╗███████╗
;; ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝╚══════╝
;;

(package-initialize)

(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/elpa/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(julien))
 '(custom-safe-themes
   '("b99846c178e46711cf33b628930915659c8b9848a47b085e1f91623a08e6cc4b"
     "2eaf2917992a73b10838b0224c54042570eeb894f52e6dc4b98f9d109d9ebe31"
     "e1bb83b1b09acfbc2806438f849d371d17e2b08cb3bd9f6a9cea71f08ca97f80"
     "78c3ccacbd7bddb472bb0a4c6d1195b3046a2fd1d7eb94ba33c44103a57038ce"
     "8b8d09791e6774ed53203f578fd0a7e92af3548573efdaeaec096ee62459e67e"
     default))
 '(elcord-display-buffer-details nil)
 '(elcord-display-elapsed nil)
 '(elcord-idle-message "Out touching grass...")
 '(elcord-idle-timer 36000000)
 '(elcord-mode t nil (elcord))
 '(elcord-use-major-mode-as-main-icon t)
 '(org-agenda-files '("~/Documents/RoamNotes/20240429181824-ets.org"))
 '(package-selected-packages
   '(2048-game aider avy chatgpt-shell company crdt drag-stuff elcord
               flycheck-yamllint flymake-yamllint gptel helm ivy
               json-mode lsp-java lsp-ui lsp-yaml magik8s magit
               multiple-cursors nix-mode org-bullets org-roam-ui
               projectile pug-mode restclient simple-httpd swiper
               tree-sitter-langs treemacs-icons-dired treemacs-magit
               treemacs-persp treemacs-projectile treemacs-tab-bar
               treesit-auto try tsc vterm vue-mode websocket wikinforg
               wsd-mode yaml yaml-mode yaml-pro)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq my/package-list
      '(
        ;; adoc-mode
        ;; aggressive-indent
	      ;; auctex
	      ;; auto-complete
	      ;; cider
	      ;; circe
	      ;; clj-refactor
	      ;; clojure-mode
	      ;; coffee-mode
	      ;; company
	      ;; csv-mode
	      ;; dash
        ;; diminish
	      ;; exec-path-from-shell
	      ;; flycheck
	      ;; fringe-helper
	      ;; git
	      ;; git-gutter
	      ;; git-gutter-fringe
	      ;; graphviz-dot-mode
	      ;; haml-mode
	      ;; highlight-parentheses
        ;; ;;	htmlize
	      ;; inf-ruby
        ;; ledger-mode
        ;; flycheck
	      ;; inflections
	      ;; js2-mode
	      ;; json-mode
	      ;; json-reformat
	      ;; less-css-mode
        ;; ;;	leuven-theme
	      ;; magit
	      ;; makey
	      ;; markdown-mode
	      ;; multiple-cursors
	      ;; names
	      ;; neotree
	      ;; paredit
        ;; php-mode
	      ;; pkg-info
	      ;; popup
	      ;; powerline
        ;; ;;	pretty-symbols
	      ;; projectile
	      ;; plantuml-mode
	      ;; rainbow-delimiters
	      ;; rainbow-mode
	      ;; rspec-mode
	      ;; ruby-compilation
	      ;; rvm
	      ;; s
        ;; scss-mode
	      ;; sass-mode
	      ;; shut-up
	      ;; slamhound
	      ;; smart-mode-line
	      ;; smartparens
	      ;; smex
	      ;; tracking
	      ;; undo-tree
	      ;; nyan-mode
        ;; web-mode
	      ;; writeroom-mode
	      yaml-mode
	      ;; yasnippet
	      ))

;; fetch the list of packages available
(unless (file-exists-p package-user-dir)
  (package-refresh-contents))

;; install the missing packages
(dolist (package my/package-list)
  (unless (package-installed-p package)
    (message "Installing %s" package)
    (package-install package)))

(require 'org)
(when (string-match "^[1234567]" (org-version))
  (warn "Org-Mode is out of date. We expect org 8 or higher, but instead we have %s" (org-version)))

(org-babel-load-file "~/.emacs.d/emacs.org")

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
