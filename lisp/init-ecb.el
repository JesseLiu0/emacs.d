

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-ecb.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: ECB
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; load the complete ECB at (X)Emacs-loadtime
(require 'ecb)
(require 'ecb-autoloads)

(setq-default ecb-tip-of-the-day nil)
(setq-default ecb-layout-name "leftright1")
(setq-default ecb-layout-window-sizes
	      (quote (("leftright1"
		       (ecb-directories-buffer-name 0.2097560975609756 . 0.39285714285714285)
		       (ecb-sources-buffer-name 0.2097560975609756 . 0.2857142857142857)
		       (ecb-history-buffer-name 0.2097560975609756 . 0.30357142857142855)
		       (ecb-methods-buffer-name 0.1951219512195122 . 0.9821428571428571)))))

;; Show source files in directories buffer
(setq ecb-show-sources-in-directories-buffer 'always)

;; keep a persistent compile window in ECB
;; instead of using editing buffer to display compilation information
;(setq ecb-compile-window-height 12)


;;------------ ECB keybindigns -------------;;
;;; activate and deactivate ecb
(global-set-key (kbd "C-x C-;") 'ecb-activate)
(global-set-key (kbd "C-x C-'") 'ecb-deactivate)
;;; show/hide ecb window
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key (kbd "C-)") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-^") 'ecb-goto-window-directories)
(global-set-key (kbd "C-&") 'ecb-goto-window-sources)
(global-set-key (kbd "C-(") 'ecb-goto-window-methods)
(global-set-key (kbd "C-*") 'ecb-goto-window-compilation)


;;; replacement for built-in ecb-deactive, ecb-hide-ecb-windows and
;;; ecb-show-ecb-windows functions
;;; since they hide/deactive ecb but not restore the old windows for me
(defun tnl/ecb-deactivate ()
  "deactive ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-deactivate)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tnl/ecb-hide-ecb-windows ()
  "hide ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-hide-ecb-windows)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tnl/ecb-show-ecb-windows ()
  "show ecb windows and then delete all other windows except the current one"
  (interactive)
  (ecb-show-ecb-windows)
  (delete-other-windows))

