(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.2)
 '(ac-delay 0.05)
 '(ac-menu-height 15)
 '(ack-arguments (quote ("--ignore-dir=vendor/ruby" "--ignore-dir=vendor/bundle" "--ignore-dir=coverage" "--ignore-dir=docs" "--ignore-dir=doc")))
 '(ack-project-root-file-patterns (quote (".project\\'" ".xcodeproj\\'" ".sln\\'" "\\`Project.ede\\'" "\\`.git\\'" "\\`.bzr\\'" "\\`_darcs\\'" "\\`.hg\\'" "\\`Gemfile\\'" "\\`Rakefile\\'")))
 '(ack-prompt-for-directory (quote unless-guessed))
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 211 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(autopair-global-mode t)
 '(backup-directory-alist (quote (("." . "~/.saves"))))
 '(column-number-mode t)
 '(display-time-24hr-format t)
 '(display-time-day-and-date nil)
 '(display-time-interval 10)
 '(display-time-load-average-threshold 1.0)
 '(display-time-mode t)
 '(ecb-create-layout-file "~/.emacs.d/ecb-user-layouts.el")
 '(ecb-layout-name "left13")
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-source-path (quote (("~/Projects" "Projects") ("~/Projects/api" "api") ("~/.emacs.d" ".emacs.d") ("~/.dotfiles" ".dotfiles") ("~/src" "src") ("~/Projects/globaldev" "globaldev") ("~/Sites" "Sites") ("~" "~") ("/" "/"))))
 '(ecb-tip-of-the-day nil)
 '(ecb-toggle-layout-sequence (quote ("left13" "left15")))
 '(ecb-tree-make-parent-node-sticky nil)
 '(ecb-windows-width 0.17)
 '(egg-enable-tooltip t)
 '(egg-git-command "git")
 '(egg-mode-key-prefix "C-x g")
 '(egg-patch-command "/usr/bin/patch")
 '(egg-refresh-index-in-backround t)
 '(elscreen-display-tab t)
 '(elscreen-tab-display-control t)
 '(elscreen-tab-display-kill-screen nil)
 '(eproject-completing-read-function (quote eproject--ido-completing-read))
 '(escreen-number-mode t)
 '(evil-default-cursor (quote (t)))
 '(fci-handle-truncate-lines nil)
 '(fci-rule-width 1)
 '(fill-column 78)
 '(fringe-mode (quote (4 . 4)) nil (fringe))
 '(global-auto-revert-mode t)
 '(global-undo-tree-mode t)
 '(history-length 500)
 '(icomplete-mode t)
 '(ispell-program-name "aspell")
 '(markdown-command "redcarpet")
 '(ns-tool-bar-display-mode nil t)
 '(ns-tool-bar-size-mode nil t)
 '(org-agenda-files (list "~/.org-files/todos.org" "~/.org-files/notes.org" "~/.org-files/events.org"))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-files "~/.org-files/notes.org")
 '(org-directory "~/.org-files/")
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-log-done t)
 '(org-remember-store-without-prompt t)
 '(org-remember-templates (quote (("Todo" 116 "** TODO %?
" "~/.org-files/todos.org" "Tasks") ("Note" 110 "** %?
" "~/.org-files/notes.org" "Notes"))))
 '(org-reverse-note-order t)
 '(php-mode-dot-property-warning t)
 '(ruby-deep-indent-paren nil)
 '(ruby-use-encoding-map nil)
 '(safe-local-variable-values (quote ((eval rainbow-mode 1))))
 '(show-paren-mode t)
 '(speedbar-show-unknown-files t)
 '(standard-indent 2)
 '(tabbar-mode nil)
 '(textmate-mode t)
 '(tool-bar-mode nil)
 '(undo-limit 800000)
 '(undo-strong-limit 1200000)
 '(undo-tree-mode-lighter "")
 '(visual-line-mode nil t)
 '(whitespace-action nil)
 '(winner-mode t nil (winner))
 '(yas/global-mode t nil (yasnippet))
 '(yas/snippet-dirs (quote ("~/.emacs.d/snippets" "~/.emacs.d/el-get/yasnippet/snippets")) nil (yasnippet))
 '(yas/use-menu t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-default-highlight-face ((t (:background "dark red")))))
