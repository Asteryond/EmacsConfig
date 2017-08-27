;;Org Mode  语法高亮
(require 'org)
(setq org-src-fontify-natively t)

(setq  org-agenda-files '("~/org"))
(org-indent-mode t)
(setq org-startup-indented t)

(add-hook 'org-mode-hook 'turn-on-cdlatex)
(provide 'init-org)

