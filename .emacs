;; Emacs Lisp Package Path List
;;************************************************************
(add-to-list 'load-path "~/elisp")
(add-to-list 'load-path "~/elisp/popup-el")
(add-to-list 'load-path "~/elisp/auto-complete")
(add-to-list 'load-path "~/elisp/emacs-rails")
(add-to-list 'load-path "~/elisp/emacs-rails-ext")
(add-to-list 'load-path "~/elisp/coffee-mode")
(add-to-list 'load-path "~/elisp/git-modes")
(add-to-list 'load-path "~/elisp/magit")
(add-to-list 'exec-path "/Users/lyanchih/.rvm/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'load-path "~/elisp/jump.el")
(add-to-list 'load-path "~/elisp/rinari")
(add-to-list 'load-path "~/elisp/auto-indent-mode.el")
(add-to-list 'load-path "~/elisp/autopair")
(add-to-list 'load-path "~/elisp/rhtml")
(add-to-list 'load-path "~/elisp/google-maps")
(add-to-list 'load-path "~/elisp/tabbar")
(add-to-list 'load-path "~/elisp/popwin-el")
(add-to-list 'load-path "~/elisp/yasnippet")
(add-to-list 'load-path "~/elisp/emacs-flymake")
(add-to-list 'load-path "~/elisp/slime")
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(add-to-list 'load-path "~/elisp/emacs-google-this")
(add-to-list 'load-path "~/elisp/auto-complete-clang")
(add-to-list 'load-path "~/elisp/cedet-1.1/semantic/semantic.el")
(add-to-list 'load-path "~/elisp/ruby-end/")
(add-to-list 'load-path "~/elisp/yaml-mode/")
(add-to-list 'load-path "~/elisp/cucumber.el/")
(add-to-list 'load-path "~/elisp/livescript-mode/")
(add-to-list 'load-path "~/elisp/jade-mode/")
(add-to-list 'load-path "~/elisp/go-mode.el")
(add-to-list 'load-path "~/elisp/ESS/lisp")
(add-to-list 'load-path "~/elisp/json-snatcher")
(add-to-list 'load-path "~/elisp/json-reformat")
(add-to-list 'load-path "~/elisp/json-mode")
(add-to-list 'load-path "~/elisp/haml-mode")
(add-to-list 'load-path "~/elisp/dash-at-point")
(add-to-list 'load-path "~/elisp/duckduckgo")
(add-to-list 'load-path "~/elisp/know-your-http-well/emacs")
(add-to-list 'load-path "~/elisp/swift-mode")
(add-to-list 'load-path "~/elisp/wsd-mode")
(add-to-list 'load-path "~/elisp/jsx-mode.el/src")
(add-to-list 'load-path "~/elisp/less-css-mode")
(add-to-list 'load-path "~/elisp/dockerfile-mode")
(add-to-list 'load-path "~/elisp/puppet-syntax-emacs")
(add-to-list 'load-path "~/elisp/emacs-jedi")

;; Emacs Lisp Package Require
;;************************************************************
(require 'linum)
(require 'popup)
(require 'auto-complete-config)
(require 'readline-complete)
(require 'auto-complete-extension)
(require 'inf-ruby)
(require 'rhtml-mode)
(require 'rails)
(require 'rails-ext)
(require 'coffee-mode)
(require 'cl-lib)
;; (require 'valgrind)
(require 'dired-single)
;; ***** Dired *****
(add-hook 'dired-load-hook
          '(lambda ()
             (define-key dired-mode-map [return] 'dired-single-buffer)
             (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
             (define-key dired-mode-map "^"
               (function
                (lambda nil (interactive) (dired-single-buffer ".."))))
             (define-key dired-mode-map "f" 'dired-single-buffer)
             (define-key dired-mode-map "b" "^")
             (global-set-key "\C-xd"
                             (lambda ()
                               (interactive)
                               (dired-single-magic-buffer
                                (if (buffer-file-name)
                                    (file-name-directory buffer-file-name)
                                  nil))))
             (global-set-key "\C-x4d" 'dired-single-magic-buffer)))
(require 'magit)
(require 'maxframe)
(require 'jump)
(require 'rinari)
(require 'auto-indent-mode)
(require 'autopair)
(require 'sr-speedbar)
;;(require 'google-maps)
(require 'switch-window)
(require 'tabbar)
(require 'popwin)
(require 'yasnippet)
(require 'ssh)
(require 'flymake)
(require 'slime)
(require 'google-this)
(require 'auto-complete-clang)
(require 'dropdown-list)
(require 'semantic)
(require 'multi-shell)
(require 'ruby-end)
(require 'yaml-mode)
(require 'feature-mode)
(require 'irfc)
(require 'livescript-mode)
(require 'sws-mode)
(require 'jade-mode)
(require 'go-mode)
(require 'ess-site)
(require 'json-mode)
(require 'haml-mode)
(require 'dash-at-point)
(require 'ddg)
(require 'ddg-search)
(require 'ddg-mode)
(require 'know-your-http-well)
(require 'swift-mode)
(require 'wsd-mode)
(require 'jsx-mode)
(require 'less-css-mode)
(require 'dockerfile-mode)
(require 'puppet-mode)

;; Normal Development Enviroment Setting
;;************************************************************
(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)
(global-auto-complete-mode t)

;; Add Hook Setting
;;************************************************************
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(add-hook 'shell-mode-hook
          '(lambda ()
             (local-set-key  "\C-cc" 'clear-shell)))
(add-hook 'window-setup-hook 'maximize-frame t)
(defun local-set-move-line-and-char-key ()
  (local-set-key "n" 'next-line)
  (local-set-key "p" 'previous-line)
  (local-set-key "f" 'forward-char)
  (local-set-key "b" 'backward-char))
(add-hook 'help-mode-hook 'local-set-move-line-and-char-key)
(add-hook 'apropos-mode-hook 'local-set-move-line-and-char-key)
(add-hook 'rails-script:output-mode-hook 'local-set-move-line-and-char-key)

;; Global Key Unsetting
;;************************************************************
(global-unset-key "\C-z")


;; Self Global Key Setting
;;************************************************************
(global-set-key "\C-x\C-z" 'suspend-frame)
(global-set-key "\C-x\M-f" 'next-buffer)
(global-set-key "\C-x\M-p" 'previous-buffer)

;; Normal Development Config Setting
;;************************************************************
(setq ns-command-modifier 'meta)
(setq ns-option-modifier 'super)
(setq standard-indent 2)
(setq-default indent-tabs-mode nil)
(setq make-backup-files nil) 
(setq default-major-mode 'text-mode)
(dolist (frame (frame-list))
  (set-frame-parameter frame 'tool-bar-lines nil))
(fset 'yes-or-no-p 'y-or-n-p)
(setq explicit-bash-args '("--noediting" "--init-file" "/Users/lyanchih/.bash_profile" "-i"))

;; Char Font Color and Size Setting
;;************************************************************
(set-cursor-color "OliveDrab") ;; 107 142 35
(set-mouse-color "goldenrod")
(set-face-background 'region "DeepSkyBlue") ;; 0 191 255
(set-foreground-color "OliveDrab")
(set-background-color "black")
(set-frame-font "-apple-DejaVu_Sans_Mono-medium-r-normal--20-*-*-*-m-0-iso10646-1")
;(set-frame-font "-apple-courier-medium-r-normal--22-240-72-72-m-240-iso10646-1")
(set-language-environment 'UTF-8)

;; Auto Mode Alist
;;************************************************************
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.js.erb$" . javascript-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.feature$" . feature-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; Frame relative setting
;;************************************************************
(setq frame-parameter-options
      '((left . 0) (top . 0) (fullscreen . fullboth) (internal-border-width . 0) (left-fringe . 5)
        (right-fringe . 5) (alpha . 90) (tool-bar-lines . nil) (foreground-color . "OliveDrab")
        (background-color . "black")))
(modify-frame-parameters (selected-frame) frame-parameter-options)
(setq default-frame-alist (append frame-parameter-options '((font . "DejaVu-20"))))

;; Auto Open
;;************************************************************
;; (sr-speedbar-toggle)
;; (yas-global-mode t)

;; Other List Package Config Setting
;;************************************************************
;; ***** Auto Complete *****
(setq ac-auto-start 1)
(setq ac-delay 0.5)
(setq ac-quick-help-delay 0.5)
(add-to-list 'ac-modes 'shell-mode)
(ac-config-default)
(require 'auto-complete-config)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'rhtml-mode 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /usr/llvm-gcc-4.2/bin/../lib/gcc/i686-apple-darwin11/4.2.1/include
 /usr/include/c++/4.2.1
 /usr/include/c++/4.2.1/backward
 /usr/local/include
 /Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include
 /usr/include
 /System/Library/Frameworks (framework directory)
 /Library/Frameworks (framework directory)
"
               )))

;; ***** Shell *****
(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash --init-file /Users/lyanchih/.bash_profile"))
(setq comint-process-echoes t)
(add-hook 'shell-mode-hook 'ac-rlc-setup-sources)
(add-hook 'shell-mode-hook
          (defun clear-shell ()
            (interactive)
            (let ((old-max comint-buffer-maximum-size))
              (setq comint-buffer-maximum-size 0)
              (comint-truncate-buffer)
              (setq comint-buffer-maximum-size old-max))) )

;; ***** Coffee Script *****
(add-hook 'coffee-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq indent-tabs-mode nil)
             (local-set-key "\C-cr" 'coffee-compile-buffer)
             (local-set-key "\C-cs" 'coffee-compile-file)
             ))
(put 'dired-find-alternate-file 'disabled nil)



;; ***** Indent *****
(auto-indent-global-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-indent-next-pair-timer-geo-mean (quote ((default 0.0005 0)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq auto-indent-disabled-modes-list
      (cons 'livescript-mode (cons 'coffee-mode auto-indent-disabled-modes-list)))
(setq auto-indent-disabled-modes-list
      (cons 'makefile-bsdmake-mode auto-indent-disabled-modes-list))
(add-hook 'c-mode-common-hook
          '(lambda ()
             (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq indent-tabs-mode t)))

;; ***** AutoPair *****
(autopair-global-mode)

;; ***** Google Maps *****
(add-hook 'google-maps-static-mode-hook
          '(lambda ()
             (local-set-key "w" 'google-maps-static-move-north)
             (local-set-key "a" 'google-maps-static-move-west)
             (local-set-key "s" 'google-maps-static-move-south)
             (local-set-key "d" 'google-maps-static-move-east)
             (local-set-key "=" 'google-maps-static-zoom-in)))

;; ***** sr-SpeedBar *****
(add-hook 'speedbar-mode-hook
          '(lambda()
             (linum-mode)))

;; ***** pop-win *****
(setq display-buffer-function 'popwin:display-buffer)
(push "*Buffer List*" popwin:special-display-config)
(push "*rails console*" popwin:special-display-config)
(push "*ROutout*" popwin:special-display-config)
(push "*coffee-compiled*" popwin:special-display-config)
(push "*livescript-compiled*" popwin:special-display-config)
(push '("*Man*" :regexp "\\*Man.*\\*") popwin:special-display-config)

;; ***** ssh *****
(lambda ()
  (shell-dirtrack-mode t)
  (setq dirtrackp nil))

;; ***** slime *****
(slime-setup)

;; ***** flymake *****
;; (setq flymake-run-in-place nil)
(setq temporary-file-directory "~/.emacs.d/tmp/")
'(flymake-errline ((((class color)) (:underline "OrangeRed"))))
'(flymake-warnline ((((class color)) (:underline "yellow"))))
(defun my-flymake-show-next-error ()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line))
(add-hook 'c-mode-common-hook
          (lambda ()
            (flymake-mode t)
            (global-set-key "\C-c\C-v" 'my-flymake-show-next-error)))

;; ***** yasnippet *****
(yas-global-mode t)
(setq yas-prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))

(defun my-rhtml-init ()
  (auto-complete-mode t)
  (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-dictionary ac-source-gtags ac-source-css-property)))
(add-hook 'rhtml-mode-hook 'my-rhtml-init)


;; ***** magit *****
(defun mgs ()
  (interactive)
  (call-interactively 'magit-status))
(defun mgl ()
  (interactive)
  (call-interactively 'magit-log))

;; ***** gdb *****
(setq gdb-many-windows t)
(defun gdb-hot-key ()
  (local-set-key (kbd "<f5>") 'gud-run)
  (local-set-key (kbd "<f8>") 'gud-remove)
  (local-set-key (kbd "<f9>") 'gud-break)
  (local-set-key (kbd "<S-f9>") 'gud-remove)
  (local-set-key (kbd "<f10>") 'gud-next)
  (local-set-key (kbd "<f11>") 'gud-step)
  (local-set-key (kbd "<S-f11>") 'gud-finish))
(add-hook 'c-mode-common-hook 'gdb-hot-key)
(add-hook 'gud-mode-hook 'gdb-hot-key)

;; ***** semantic *****
(add-hook 'c-mode-common-hook 'semantic-mode)

;; ***** tramp *****
(setq tramp-default-method "ssh")
(put 'upcase-region 'disabled nil)
(defun tssh()
  (interactive)
  (let ((host-name
         (read-string "Host name(pi):" nil 'minibuffer-history "pi" nil))
        (domain-name
         (read-string "Domain:" nil 'minibuffer-history "" nil))
        (port
         (read-string "Port(22):" nil nil "22" nil))
        (dir
         (read-string "Dir(~/):" nil 'minibuffer-history "~/" nil))
        (is-sudo
         (read-string "Sudo(y or n)?:" nil nil "n" nil)))
    (if (or (equal domain-name "") (equal host-name ""))
        ()
      (let ((ssh-result
             (concat "/ssh:" host-name "@" domain-name "#" port ":" dir)))
        (if (equal is-sudo "y")
            ())
        (dired ssh-result)
        )
      )
    )
  )

(defun tsh()
  (interactive)
  (let ((host-name
         (read-string "Host name:" nil 'minibuffer-history "" nil))
        (domain
         (read-string "Domain:" nil 'minibuffer-history "" nil))
        (port
         (read-string "Port:" nil nil "" nil))
        (is-sudo
         (read-string "Sudo(y or n)?:" nil nil "n" nil))
        (ssh-result "/ssh"))
    (set 'ssh-result (concat "/ssh:" host-name "@" domain))
    (if (and (eq host-name "") (eq domain ""))
        (message "You should enter host name or domain")
      (if (or (eq host-name "") (eq domain ""))
          (set 'ssh-result (concat "/ssh:" (if (eq host-name "") domain host-name))))
      (if (not (eq port ""))
          (set 'ssh-result (concat ssh-result "#" port)))
      (if (eq is-sudo "y") (set 'ssh-result (concat ssh-result "|sudo:")))
      (set 'ssh-result (concat ssh-result ":~/"))
      (dired ssh-result)
      (multi-shell-new))))

;; ***** multi-shell *****
(setq multi-shell-command "/bin/bash")
(defun msn()
  (interactive)
  (call-interactively 'multi-shell-new))

;; ***** xml *****
(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))
(add-hook 'nxml-mode-hook
          '(lambda ()
             (local-set-key "\C-cr" (kbd "C-x h C-w"))))

;; ***** xml *****
(setq irfc-directory "~/tutorial/RFC")
(setq irfc-assoc-mode t)

;; ***** irfc *****
(add-hook 'irfc-mode-hook
          '(lambda ()
             (local-set-key "p" 'previous-line)
             (local-set-key "n" 'next-line)
             (local-set-key "l" 'recenter-top-bottom)))

;; ***** jade *****
(defun flymake-jade-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-intemp))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name)))
         (arglist (list local-file)))
    (list "jade" arglist)))
(setq flymake-err-line-patterns
      (cons '("\\(.*\\): \\(.+\\):\\([[:digit:]]+\\)$"
              2 3 nil 1)
            flymake-err-line-patterns))
(add-to-list 'flymake-allowed-file-name-masks
             '("\\.jade\\'" flymake-jade-init))

;; ***** livescript *****
(add-hook 'livescript-mode-hook '(lambda ()
                                   (local-set-key "\C-cr" 'livescript-compile-buffer)
                                   (setq tab-width 2)))
;; ***** golang *****
(add-hook 'go-mode-hook '(lambda ()
                           (setq indent-tabs-mode nil)
                           (setq tab-width 2)))
;; ***** javascript *****
(defun provideo_conif()
  ""
  (interactive)
  (set-variable 'tab-width 8)
  (set-variable 'indent-tabs-mode t)
  (auto-indent-mode -1))

;; ***** dash-at-point *****
(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t t)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; ***** shell *****
(add-to-list
 'comint-preoutput-filter-functions
 (lambda (output)
   (replace-regexp-in-string "\33\\[[0-9]+[GKJ]" "" output)))

;; ***** apiblueprint *****
(defun even-tab-stop()
  ""
  (interactive)
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60)))

;; ***** jsx *****
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
(custom-set-variables
 '(jsx-indent-level 4)
 '(jsx-cmd-options nil)
 '(jsx-use-flymake nil)
 '(jsx-syntax-check-mode "compile"))

(defun jsx-mode-init ()
  (define-key jsx-mode-map (kbd "C-c d") 'jsx-display-popup-err-for-current-line)
  (when (require 'auto-complete nil t)
    (auto-complete-mode t)))

(add-hook 'jsx-mode-hook 'jsx-mode-init)

;; ***** google dictionary *****
(defun gsh()
  (interactive)
  (let
      ((word-idiom
        (read-string "Word / Idiom : " nil 'minibuffer-history "word" nil)))
    (browse-url (format (google-url) (concat word-idiom " definition")))))

;; ***** python *****
(defun pyoff()
  (interactive)
  (set-variable 'python-indent-offset 4))
