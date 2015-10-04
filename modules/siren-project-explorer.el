;;
;; project-explorer
;;

(siren-require-packages '(project-explorer))

(require 'project-explorer)
(setq pe/follow-current t)
(setq pe/width 54)
(setq pe/cache-directory (expand-file-name
                          "project-explorer-cache" siren-savefile-dir))

(global-set-key (kbd "C-x p") 'project-explorer-open)

;; Make Project Explorer open selected file in last used buffer
(setq pe/display-content-buffer-function
      (lambda (buffer)
        (let* (( last-buffer
                 (car (cl-remove 'project-explorer-mode
                                 (buffer-list)
                                 :key (apply-partially 'buffer-local-value
                                                       'major-mode))))
               ( window (get-buffer-window last-buffer)))
          (if window
              (set-window-buffer window buffer)
            (pe/show-buffer buffer)))
        ))


(provide 'siren-project-explorer)
