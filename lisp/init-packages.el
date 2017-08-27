
(provide 'init-packages)

(when (>= emacs-major-version 24)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

;; Add Packages
 (defvar asteryond/packages '(
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
		auctex
		cdlatex
		org-download
		youdao-dictionary
		yasnippet
		ycmd
		company-ycmd
		flycheck-ycmd
		;; solarized-theme
		) "Default packages")

(setq package-selected-packages asteryond/packages)

 (defun asteryond/packages-installed-p ()
     (loop for pkg in asteryond/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (asteryond/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg asteryond/packages)
       (when (not (package-installed-p pkg))
	 (package-install
	  pkg))))

;;ycmd
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)
(set-variable 'ycmd-server-command '("python" "/home/asteryond/ycmd/ycmd/"))
(set-variable 'ycmd-global-config "~/ycmd/examples/.ycm_extra_conf.py")

(require 'company-ycmd)
(company-ycmd-setup)
(add-hook 'after-init-hook #'global-company-mode)

(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
(add-hook 'after-init-hook #'global-flycheck-mode)

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
(smartparens-global-mode t)
(show-paren-mode t)

;;company
(global-company-mode t)


;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)


;;hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;加载主题
(load-theme 'monokai 1)

;;popwin
(require 'popwin)
(popwin-mode t)

;;google-translate
;;(require 'google-translate)
;;(require 'google-translate-default-ui)
;;(setq-default google-translate-default-source-language "en")
;;(setq-default google-translate-default-target-language "zh_CH")

;;youdao-dictionary
;; Enable Cache
(setq url-automatic-caching t)
;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
(push "*Youdao Dictionary*" popwin:special-display-config)


