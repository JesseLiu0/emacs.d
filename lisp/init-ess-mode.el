

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-ess-mode.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: ESS for statistics languages
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(push "~/.emacs.d/elpa/ess-20130628.1043/lisp" load-path)
(require 'ess-site) 

;; customize font lock in ESS mode 
(setq-default ess-R-font-lock-keywords
	      (quote ((ess-R-fl-keyword:modifiers . t)
		      (ess-R-fl-keyword:fun-defs . t)
		      (ess-R-fl-keyword:keywords . t)
		      (ess-R-fl-keyword:assign-ops . t)
		      (ess-R-fl-keyword:constants . t)
		      ;; (ess-fl-keyword:fun-calls . t)
		      ;; (ess-fl-keyword:numbers . t)
		      ;; (ess-fl-keyword:operators . t)
		      ;; (ess-fl-keyword:parentheses . t)
		      ;; (ess-fl-keyword:= . t)
		      ;; (ess-R-fl-keyword:F&T . t)
		      )))
