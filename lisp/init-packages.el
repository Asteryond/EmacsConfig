
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
		js2-refactor
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		solarized-theme
		
		popwin
		auctex
		cdlatex
		org-download
		youdao-dictionary
		yasnippet
		web-mode
		expand-region
		iedit
		org-pomodoro
		helm-ag
		flycheck
		auto-yasnippet
		evil-leader
		evil
		window-numbering
		evil-surround
		evil-nerd-commenter
		which-key
		;;ycmd
		;;company-ycmd
		;;flycheck-ycmd
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
;;(require 'ycmd)
;;(add-hook 'after-init-hook #'global-ycmd-mode)
;;(set-variable 'ycmd-server-command '("python" "/home/asteryond/ycmd/ycmd/"))
;;(set-variable 'ycmd-global-config "~/ycmd/examples/.ycm_extra_conf.py")

;;(require 'company-ycmd)
;;(company-ycmd-setup)
;;(add-hook 'after-init-hook #'global-company-mode)

;;(require 'flycheck-ycmd)
;(flycheck-ycmd-setup)
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;Nodejs
(require 'nodejs-repl)

;;config for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;;config for web mode
(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  
  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  
  (setq indent-tabs-mode nil))

;;config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;;Swiper
(ivy-mode 1)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;Smartparens
(smartparens-global-mode t)
;;(show-paren-mode t)

(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)


;;company
(global-company-mode t)


;;yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'org-mode-hook #'yas-minor-mode)
;;hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;加载主题
; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch t)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use less bolding
(setq solarized-use-less-bold nil)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)
;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)
(load-theme 'solarized-light 1)

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

;;flycheck
(add-hook 'js-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)

;;evil
(evil-mode t)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;evil-leader
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":" 'counsel-M-x
  "wm" 'delete-other-windows
  "qq" 'save-buffers-kill-terminal)

;;evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;;evil-nerd-commanter
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(evilnc-default-hotkeys)


(window-numbering-mode 1)

(add-hook 'occur-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/") 'evil-search-forward
	      (kbd "n") 'evil-search-next
	      (kbd "N") 'evil-search-previous
	      (kbd "C-d") 'evil-scroll-down
	      (kbd "C-u") 'evil-scroll-up
	      )))


;;which-key
(which-key-mode 1)
