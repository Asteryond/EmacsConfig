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

;;将open-init-file绑定在F2键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; (global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)


;;google-translate
;;(global-set-key (kbd "C-c t") 'google-translate-at-point)
;;(global-set-key (kbd "C-c T") 'google-translate-query-translate)

;; youdao-dictionary
(global-set-key (kbd "C-c f") 'youdao-dictionary-search-at-point)
(global-set-key (kbd "C-c v") 'youdao-dictionary-play-voice-at-point)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;js2-refactor
(js2r-add-keybindings-with-prefix "C-c C-m")

;;expand-region
(global-set-key (kbd "C-=") 'er/expand-region)
(provide 'init-keybindings)

;;iedit
(global-set-key (kbd "C-;") 'iedit-mode)

(global-set-key (kbd "C-c r") 'org-capture)

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "M-s i") 'counsel-imenu)

;; (global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(global-set-key (kbd "C-w") 'backward-kill-word)
