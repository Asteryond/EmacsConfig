(provide 'init-better-defaults)

;;显示行号
(global-linum-mode 1)

(global-auto-revert-mode t)

(setq ring-bell-function nil)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8at" "ASterynd")
					    ))

;;禁止生成备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;;打开最近的文件
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;;选择一段文字后 输入一个字符会替换选中的部分
(delete-selection-mode t)

;;将yes/no 改为 y/n
(fset 'yes-or-no-p 'y-or-n-p)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region"))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))
