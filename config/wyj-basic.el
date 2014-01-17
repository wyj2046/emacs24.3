;; -*- coding: utf-8 -*-


;; set user information
(setq user-full-name "wyj2046")
(setq user-mail-address "wyj2046@gmail.com")

;====================================
;  UI
;====================================
;; close startup message
(setq inhibit-startup-message t)

;; turn on syntax hilight
(global-font-lock-mode t)

;; remove toolbar/menu bar/scroll bar
(tool-bar-mode 0)
;(menu-bar-mode 0)
;(set-scroll-bar-mode nil)

;; show clock at statusline
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;; show column number in mode line
(setq column-number-mode t)

;;show-linum
(global-linum-mode t)

;; show parent
(show-paren-mode t)
(setq show-paren-style 'expression)

;; hilight mark area
(transient-mark-mode t)

;; make the title infomation more useful
(setq frame-title-format
      (list "王煜杰 " emacs-version "@" system-name " - " '(buffer-file-name "%f" "%b")))

;===================================
; Control
;===================================
;; don't ring at error
(setq ring-bell-function 'ignore)

;; no backup file, and auto save
(setq-default make-backup-files nil)
(setq auto-save-default nil)

;; use y --> yes
(fset 'yes-or-no-p 'y-or-n-p)

;; setup up a big kill-ring, so i will never miss anything:-)
(setq kill-ring-max 100)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 3)))   ;; one line at a time
(setq mouse-wheel-progressive-speed nil)              ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                    ;; scroll window under mouse
(setq scroll-step 1)                                  ;; keyboard scroll one line at a time
(setq scroll-margin 0)                                ;; stop autoscroll when mouse is close to margin

;; use save mini buffer hisitory
(savehist-mode t)

;; 光标移动到鼠标下时，鼠标自动弹开
(mouse-avoidance-mode 'animate)


(provide 'wyj-basic)
