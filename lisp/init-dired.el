

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-dired.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: dired, ibuffer, etc.  packages for file management.
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; toggle file/dir details to be displayed in dired
;; use '(' or ')' key
;;
(require 'dired-details+)
(if (not (eq system-type 'windows-nt))
    (dired-details-show))

;;enable recursive deletion of dirs, but doubly ask if it's not empty.
(setq dired-recursive-deletes 'top)

;; ibuffer by default
(global-set-key (kbd "C-x C-b") 'ibuffer)
