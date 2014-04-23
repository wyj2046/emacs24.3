;; -*- coding: utf-8 -*-

;; 参考CEDET官方安装说明, Meteor Liu, winterTT
;; http://emacser.com/cedet.htm
(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; which mode is prefer? min -> max
;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
;(semantic-load-enable-gaudy-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

;; 把这个模式关掉，因为会与tabbar冲突
(global-semantic-stickyfunc-mode nil)


;; 增加头文件解析路径
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))

(defconst redis-include-dirs
  (list "~/code/redis/src")
  )

(defconst mapdb-include-dirs
  (list "~/project/test_mapdb")
  )

(require 'semantic-c nil 'noerror)
(let ((include-dirs  cedet-user-include-dirs))
  (setq include-dirs (append include-dirs redis-include-dirs))  ;; 增加项目路径
  (setq include-dirs (append include-dirs mapdb-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))


;; 代码跳转
(global-set-key [f12] 'semantic-ia-fast-jump)

(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;; (defun semantic-ia-fast-jump-back ()
;;   (interactive)
;;   (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
;;       (error "Semantic Bookmark ring is currently empty"))
;;   (let* ((ring (oref semantic-mru-bookmark-ring ring))
;;          (alist (semantic-mrub-ring-to-assoc-list ring))
;;          (first (cdr (car alist))))
;;     (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
;;         (setq first (cdr (car (cdr alist)))))
;;     (semantic-mrub-switch-tags first)))

;; (defun semantic-ia-fast-jump-or-back (&optional back)
;;   (interactive "P")
;;   (if back
;;       (semantic-ia-fast-jump-back)
;;     (semantic-ia-fast-jump (point))))
;; (define-key semantic-mode-map [f12] 'semantic-ia-fast-jump-or-back)
;; (define-key semantic-mode-map [C-f12] 'semantic-ia-fast-jump-or-back)
;; (define-key semantic-mode-map [S-f12] 'semantic-ia-fast-jump-back)
;; (define-key c-mode-base-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)


;; 自动补全
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)


;; h/cpp切换
(when (require 'eassist nil 'noerror)
    (setq eassist-header-switches
          '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
            ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
            ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
            ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
            ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
            ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
            ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
            ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
            ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
            ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
            ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
            ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
            ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
            ("c" . ("h"))
            ("m" . ("h"))
            ("mm" . ("h"))))
    (define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)
    (define-key c-mode-base-map (kbd "ESC <f12>") 'eassist-switch-h-cpp))


;; 代码折叠
(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))


;; Enable EDE(Emacs Develpment Enviroment) mode
(global-ede-mode t)
