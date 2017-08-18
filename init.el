(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
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

(setq package-selected-packages my/packages)
(global-auto-revert-mode t)
;;Org Mode  语法高亮
(require 'org)
(setq org-src-fontify-natively t)

(setq  org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

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
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c C-f") 'counsel-describe-function)
(global-set-key (kbd "C-c C-v") 'counsel-describe-variable)

;;Smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
(show-paren-mode t)

;;company
(global-company-mode t)

;;hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;高亮当前行
(global-hl-line-mode 1)

;;加载主题
(load-theme 'monokai 1)

;;关闭工具栏
(tool-bar-mode -1)

;;关闭文件滑动控江
(scroll-bar-mode -1)

;;显示行号
(global-linum-mode 1)

;;更改光标的样式
(setq-default cursor-type 'bar)

;;关闭启动帮助画面
(setq inhibit-splash-screen 1)

;;打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
)

;;将open-init-file绑定在F2键上
(global-set-key (kbd "<f2>") 'open-init-file)

;;禁止生成备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)
;;打开最近的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;;选择一段文字后 输入一个字符会替换选中的部分
(delete-selection-mode 1)

;;popwin
(require 'popwin)
(popwin-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(package-selected-packages
   (quote
    (company hungry-delete swiper counsel smartparens js2-mode nodejs-repl exec-path-from-shell monokai-theme popwin))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "#FD971F"))))
 '(js2-warning ((t (:underline "#FD971F")))))
