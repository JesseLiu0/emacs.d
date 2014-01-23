

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-ess-mode.el
;;
;; Copyright (C) 2013 Tony Liu
;; 
;; Description: Config CSS mode
;; Author: Tony Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun all-css-modes() (css-mode)
  (rainbow-mode))
(add-to-list 'auto-mode-alist '("\.css$" . all-css-modes))
