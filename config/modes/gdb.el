;; -*- coding: utf-8 -*-

;; 参考Meteor Liu http://emacser.com/emacs-gdb.htm
;; 用工具提示显示变量值
(add-hook 'gdb-mode-hook (lambda () (gud-tooltip-mode 1)))
(defadvice gud-kill-buffer-hook (after gud-tooltip-mode activate)
  "After gdb killed, disable gud-tooltip-mode."
  (gud-tooltip-mode -1))

;; 按键绑定
(add-hook 'gdb-mode-hook '(lambda ()
                            (define-key c-mode-base-map [(f5)] 'gud-go)
                            (define-key c-mode-base-map [(f11)] 'gud-step)
                            (define-key c-mode-base-map [(f10)] 'gud-next)))
