;;Org Mode  语法高亮

(setq org-src-fontify-natively t)

(setq  org-agenda-files '("~/org"))
(org-indent-mode t)
(setq org-startup-indented t)

(add-hook 'org-mode-hook 'org-cdlatex-mode)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "工作安排")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)))

(require 'org-pomodoro)

(provide 'init-org)

