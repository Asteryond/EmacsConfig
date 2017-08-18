



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)
(require 'init-ui)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8at" "ASterynd")
					    ))

(setq ring-bell-function nil)


(global-auto-revert-mode t)
;;Org Mode  语法高亮
(require 'org)
(setq org-src-fontify-natively t)

(setq  org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c C-f") 'counsel-describe-function)
(global-set-key (kbd "C-c C-v") 'counsel-describe-variable)


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
