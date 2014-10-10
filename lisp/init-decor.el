

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-visual-nicities.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: default fonts, color theme, font zoom, etc.
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set default font
;;
(cond
 ((equal system-type 'gnu/linux)
  (add-to-list 'default-frame-alist '(font . "Courier-13")))
 ((equal system-type 'darwin)
  (add-to-list 'default-frame-alist '(font . "Monaco-13")))
 ((equal system-type 'windows-nt)
  (add-to-list 'default-frame-alist '(font . "Inconsolata-12")))
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Use variable width font faces in text-like buffer
;;
(defun my-buffer-face-mode-variable ()
"Set font to a variable width (proportional) fonts in current buffer"
(interactive)
(setq buffer-face-mode-face '(:family "Times New Roman" :height 130))
(buffer-face-mode))

;; Use monospaced font faces in current buffer
(defun my-buffer-face-mode-fixed ()
"Sets a fixed width (monospace) font in current buffer"
(interactive)
(setq buffer-face-mode-face '(:family "Monaco" :height 80))
(buffer-face-mode))

;; Set default font faces for text-like modes
(add-hook 'erc-mode-hook 'my-buffer-face-mode-variable)
(add-hook 'Info-mode-hook 'my-buffer-face-mode-variable)
(add-hook 'TeX-mode-hook 'my-buffer-face-mode-variable)
;;(add-hook 'text-mode-hook 'my-buffer-face-mode-variable)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color theme
;;
;;--- use Emacs 24 built-in tango ---;;
;; (load-theme 'tango t)
;;
;;--- use customized tango---;;
;(require 'color-theme) ;; unnecessary if installed with elpa
;(color-theme-initialize) ;; unnecessary if installed with elpa
(load-library "~/.emacs.d/lisp/init-tango-theme-custom")
;;(if (window-system)
(color-theme-tango-light)
    ;; ;; (color-theme-tty-dark))
;;  (color-theme-tango))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Increase/Decrease font size on the fly
;; Taken from: http://is.gd/iaAo

;; (defun customfunc/increase-font-size ()
;;   (interactive)
;;   (set-face-attribute 'default
;;                       nil
;;                       :height
;;                       (ceiling (* 1.10
;;                                   (face-attribute 'default :height)))))
;; (defun customfunc/decrease-font-size ()
;;   (interactive)
;;   (set-face-attribute 'default
;;                       nil
;;                       :height
;;                       (floor (* 0.9
;;                                   (face-attribute 'default :height)))))
;; (global-set-key (kbd "C-+") 'customfunc/increase-font-size)
;; (global-set-key (kbd "C--") 'customfunc/decrease-font-size)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set startup frame size and position.

;; Maximize frame in Windows. It has be placed after set-default-font.
(when (eq system-type 'windows-nt)
  (w32-send-sys-command 61488))

;; OS X
(when (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
  (progn
    (add-to-list 'default-frame-alist '(height . 60))
    (add-to-list 'default-frame-alist '(width . 120))
    (add-to-list 'default-frame-alist '(left . 480))
    (add-to-list 'default-frame-alist '(top . 0))
    )
  )
