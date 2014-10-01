

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-cc-mode.el
;;
;; Copyright (C) 2013-2014 Ning Liu
;; 
;; Description: cc-mode setup
;; Author: Ning Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; cc-mode supports C, C++, Java
(require 'cc-mode)

;; Initialize function-args for C/C++
(require 'function-args)
(fa-config-default)

;; Open .h file in C++ mode instead of C mode.
;;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Customize c-initialization-hook. Mainly for define-key.
(add-hook 'c-initialization-hook
	  (lambda ()
	    (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
	    ;; By company-mode
	    ;; (define-key c-mode-map  [(tab)] 'company-complete)
	    ;; (define-key c++-mode-map  [(tab)] 'company-complete)
	    ;; By function-args
	    (define-key c-mode-map (kbd "M-o")  'fa-show)
	    (define-key c++-mode-map (kbd "M-o")  'fa-show)
	    (define-key c-mode-map (kbd "<C-tab>") 'moo-complete)
	    (define-key c++-mode-map (kbd "<C-tab>") 'moo-complete)
	    ))

;; Customize c-mode-common-hook
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-toggle-auto-hungry-state 1)     ; turn on auto newline and hungry delete
	    (setq compilation-scroll-output t) ; *compilation* buffer auto-scrolls to the end of new output
	    (imenu-add-menubar-index)          ; Load imenu menubar
	    (setq-local comment-auto-fill-only-comments t) ; use auto-fill-mode only for comments
	    (auto-fill-mode 1)                 ; turn on auto-fill-mode
	   ))

;; Customize C/C++ mode hooks
(defun my-c-c++-hook ()
  ;; (c-set-style "my-style")        ; use my-style defined above
  (add-to-list 'company-backends 'company-c-headers)
  )

(add-hook 'c-mode-hook 'my-c-c++-hook)
(add-hook 'c++-mode-hook 'my-c-c++-hook)


;; C++ function definitions in a header file are expanded to definitions
;; in acorresponding source file
(require 'member-functions)
(setq mf--source-file-extension "cpp")
