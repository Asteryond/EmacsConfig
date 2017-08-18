
(provide 'init-packages)

(when (>= emacs-major-version 24)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

;; Add Packages
 (defvar my/packages '(
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		popwin
		;; solarized-theme
		) "Default packages")

(setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install
	  pkg))))


;;Nodejs
(require 'nodejs-repl)

;;config for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;Swiper
(ivy-mode 1)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;Smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
(show-paren-mode t)

;;company
(global-company-mode t)

;;hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;加载主题
(load-theme 'monokai 1)

;;popwin
(require 'popwin)
(popwin-mode t)