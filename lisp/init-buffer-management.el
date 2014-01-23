

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-buffer-management.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: set up packages for easy buffer management.
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;; Load iswitchb Library. Enhance C-x b.
(iswitchb-mode 1) 
(setq iswitchb-buffer-ignore '("^ " "*scratch*" "*Messages" "*Buffer List"))

;; Ido mode with fuzzy matching
(require 'ido) ;; Emacs 24 built-in
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;; enable uniquify
(require 'uniquify) ;; Emacs 24 built-in
(setq uniquify-buffer-name-style 'forward)
