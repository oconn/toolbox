(setq org-directory "~/Dropbox/ORG/")
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Enable spell check by default
(add-hook 'org-mode-hook 'turn-on-flyspell)

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "|" "DONE(d)")))

;; (define-key global-map "\C-cl" 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Insert timestamp
(define-key org-mode-map (kbd "C-i") (kbd "C-u C-c !"))

(setq org-agenda-files (list (concat org-directory "todos")))
(setq org-log-done t)
(setq org-tag-alist '())

(setq org-agenda-include-diary t)
