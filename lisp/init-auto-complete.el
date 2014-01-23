

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-auto-complete.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: auto complete package
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; default config
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")

;; move data file
(setq ac-comphist-file "~/.emacs.d/metadata/ac-comphist-file.dat")

;; set the delay time (seconds) of showing selectin menu
(setq ac-auto-show-menu 0.5)

;; Change the height (lines) of completion menu
(setq ac-menu-height 20)

;; Select candidates with C-n/C-p only when completion menu is displayed
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; Add ac-sources of all buffers
(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
