;; (setq rails-minor-mode-local-prefix-key "\C-c ;")
;; (setq rails-minor-mode-global-prefix-key "\C-c ; ;")
(defun rails-core:view-erbs (format_ext)
  "Return a list of Rails models."
  (mapcar
   #'rails-core:class-by-file
   (delete-if
    #'(lambda (file) (or (rails-core:observer-p file)
                         (rails-core:mailer-p file)))
    (directory-files-recursive (rails-core:file "app/views/") nil (format "\\%s$" format_ext)))))

(defun rails-core:view-file (format_ext view-name)
  "Return the view file from the view name."
  (when view-name
    (let* ((stripped-view-file
            (format "%s"
                    (rails-core:partial-name (rails-core:file-by-class view-name t))
                    ))
           (view-file (format "%s.%s"
                              (rails-core:file-by-class view-name t)
                              format_ext)))
      (message stripped-view-file)
      (cond
       ((file-exists-p
         (rails-core:file (concat "app/views/" view-file)))
        (concat "app/views/" view-file))
       ((file-exists-p
         (rails-core:file stripped-view-file))
        stripped-view-file)
       (t
        (concat "app/views/" view-file))))))

(defun rails-nav:goto-view-erb ()
  "Go to helpers."
  (interactive)
  (rails-nav:goto-file-with-menu-from-list
   (rails-core:view-erbs "erb")
   "Go to helper.."
   (apply-partially 'rails-core:view-file "erb")))

(define-keys rails-minor-mode-map
  ((rails-global-key "g v h") 'rails-nav:goto-view-erb))

(defun rails-nav:goto-view-js ()
  "Go to helpers."
  (interactive)
  (rails-nav:goto-file-with-menu-from-list
   (rails-core:view-erbs "js.erb")
   "Go to helper.."
   (apply-partially 'rails-core:view-file "js")))

(define-keys rails-minor-mode-map
  ((rails-global-key "g v j") 'rails-nav:goto-view-js))

(defun rails-nav:goto-view-coffee ()
  "Go to view coffee."
  (interactive)
  (rails-nav:goto-file-with-menu-from-list
   (rails-core:view-erbs "coffee")
   "Go to coffee view.."
   (apply-partially 'rails-core:view-file "coffee")))

(define-keys rails-minor-mode-map
  ((rails-global-key "g v c") 'rails-nav:goto-view-coffee))


;; overwrite rails javascripte and stylesheets directory
(defun rails-nav:goto-stylesheets ()
  "Go to stylesheets."
  (interactive)
  (rails-nav:goto-file-with-menu "app/assets/stylesheets/" "Go to stylesheet.." "scss" t))
(rails-find:gen "stylesheets" "app/assets/stylesheets")

(defun rails-nav:goto-javascripts ()
  "Go to JavaScripts."
  (interactive)
  (rails-nav:goto-file-with-menu "app/assets/javascripts/" "Go to javascript.." "coffee" t))
(rails-find:gen "javascripts" "app/assets/javascripts")

(defun rails-nav:goto-livescripts ()
  "Go to Livescripts."
  (interactive)
  (rails-nav:goto-file-with-menu "app/assets/javascripts/" "Go to livescipt.." "ls" t))
(rails-find:gen "livescripts" "app/assets/livescripts")

(define-keys rails-minor-mode-map
  ((rails-global-key "g i") 'rails-nav:goto-livescripts))

(define-key rails-minor-mode-map
  (kbd "\C-c 1") 'rails-lib:run-primary-switch)

(define-key rails-minor-mode-map
  (kbd "\C-c 2") 'rails-lib:run-secondary-switch)

(define-key rails-minor-mode-map
  (kbd "\C-c \C-s") 'rinari-console)
(provide 'rails-ext)
