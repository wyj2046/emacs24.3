;; -*- coding: utf-8 -*-
;; 需要从elpa安装php-mode, flymake-php

;; php-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
;; 参考网址http://sachachua.com/blog/2008/07/emacs-and-php-tutorial-php-mode/
;; 增加了Drupal风格的PHP缩进模式
(defun wicked/php-mode-init ()
  "Set some buffer-local variables."
  (setq case-fold-search t) 
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0)
  ;; (setq php-completion-file "~/.emacs.d/elpa/php-mode-1.5.0/php-completion-file")
  ;; (setq tags-file-name "~/TAGS") ;让emacs自动读取tag文件内容
  (define-key php-mode-map
    [(control tab)]
    'php-complete-function)  
  )
(add-hook 'php-mode-hook 'wicked/php-mode-init)
(add-hook 'php-mode-hook 'hs-minor-mode)    ;; 开启代码折叠功能


;; flymake-php
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)
