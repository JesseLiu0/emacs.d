

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-ess-mode.el
;;
;; Copyright (C) 2013-2016 Jesse Liu
;; 
;; Description: ESS for statistics languages
;; Author: Jesse Liu (jesse@liu.onl)
;; Keywords:
;; Requirements:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



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
