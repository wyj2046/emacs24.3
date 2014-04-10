;; -*- coding: utf-8 -*-
(setq-default c-basic-offset 4)

(defun wyj/cc-mode:basic-setup ()
  "Set setting for cc mode"
  (c-set-style "stroustrup")
  (local-set-key (kbd "RET") (key-binding (kbd "M-j")))
  (local-set-key (kbd "<S-return>") 'newline)
  )

(add-hook 'c-mode-hook 'wyj/cc-mode:basic-setup)
(add-hook 'c++-mode-hook 'wyj/cc-mode:basic-setup)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
