

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-auto-complete.el
;;
;; Copyright (C) 2014 Ning Liu
;; 
;; Description: auto complete package
;; Author: Ning Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; Default config. For details, see the ac-config-default function code
;; in aut-complete-config.el.
;(require 'auto-complete-config)
;(ac-config-default)

;; move data file
(setq ac-comphist-file "~/.emacs.d/metadata/ac-comphist-file.dat")

;; set the delay time (seconds) of showing selectin menu
;(setq ac-auto-show-menu 0.1)

;; Change the height (lines) of completion menu
;(setq ac-menu-height 20)

;; Select candidates with C-n/C-p only when completion menu is displayed
;(setq ac-use-menu-map t)
;(define-key ac-menu-map "\C-n" 'ac-next)
;(define-key ac-menu-map "\C-p" 'ac-previous)
