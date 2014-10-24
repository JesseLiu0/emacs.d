

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-appearance.el
;;
;; Copyright (C) 2013-2014 Nolan Liu
;; 
;; Description: default fonts, color theme, font zoom, etc.
;; Author: Nolan Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set default font
;;
(cond
 ((equal system-type 'gnu/linux)
  (set-face-attribute 'default nil :font "Monaco-11"))
 ((equal system-type 'darwin)
  (set-face-attribute 'default nil :font "Monaco-13"))
 ((equal system-type 'windows-nt)
  ;; (set-face-attribute 'default nil :font "Menlo-11"))
  (set-face-attribute 'default nil :font "Monaco-10"))
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Use variable width font faces in text-like buffer
;;
(defun my-buffer-face-mode-variable ()
"Set font to a variable width (proportional) fonts in current buffer"
(interactive)
(setq buffer-face-mode-face '(:family "Times New Roman" :height 140))
(buffer-face-mode))

;; Use monospaced font faces in current buffer
(defun my-buffer-face-mode-fixed ()
"Sets a fixed width (monospace) font in current buffer"
(interactive)
(setq buffer-face-mode-face '(:family "Monaco" :height 100))  ; Unit is 1/10pt, so 100 means 10pt.
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
;;  ;; (color-theme-tty-dark))
;;  (color-theme-tango))
