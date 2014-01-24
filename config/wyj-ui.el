; -*- coding: utf-8 -*-
(require 'wyj-utils)


;; Color Theme
(wyj/plugin:prepend-to-load-path "color-theme-6.6.0")
(require 'color-theme)

;; Choose concrete color-theme
;; (require 'color-theme-ahei)
;; (color-theme-ahei)

;; (require 'color-theme-subdued)
;; (color-theme-subdued)

;; (require 'color-theme-blackboard)
;; (color-theme-blackboard)

;; (require 'color-theme-molokai)
;; (color-theme-molokai)

;; (color-theme-initialize)  ;;对于内置theme，要加这句话
;; (color-theme-blue-mood)

;; tomorrow theme from elpa
;; 因为依赖于elpa, 所以.emacs配置中ui要在packages后加载
(require 'color-theme-sanityinc-tomorrow)
;; blue bright day eighties night
(color-theme-sanityinc-tomorrow--define-theme eighties)

;; Linux下
;; 全屏
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [f6] 'my-fullscreen)
;; 启动时全屏
(my-fullscreen)


(provide 'wyj-ui)
