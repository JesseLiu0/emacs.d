

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-cc-mode.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: cc-mode
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(require 'cc-mode)

;; Open .h file in C++ mode instead of C mode.
;;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Indentation and Tab offset
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; To cause the *compilation* buffer to automatically scroll to the end of new output
(setq compilation-scroll-output t)

;; create a face for function calls
(add-hook 'c-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(\\sw+\\) ?(" 1 font-lock-function-name-face)) t))) 

(add-hook 'c++-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\\<\\(\\sw+\\) ?(" 1 font-lock-function-name-face)) t))) 

;; style I want to use in c++ mode
(c-add-style "my-style" 
	     '("stroustrup"
	       (indent-tabs-mode . nil)        ; use spaces rather than tabs
	       (c-basic-offset . 4)            ; indent by four spaces
	       (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
				   (brace-list-open . 0)
				   (statement-case-open . +)))))

(defun my-c++-mode-hook ()
  (c-set-style "my-style")        ; use my-style defined above
  (auto-fill-mode)         
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)


;; turn on auto newline and hungry delete
(add-hook 'c-mode-hook (lambda () (c-toggle-auto-hungry-state 1)))
(add-hook 'c++-mode-hook (lambda () (c-toggle-auto-hungry-state 1)))

;; Load imenu menubar
(add-hook 'c-mode-hook (lambda () (imenu-add-menubar-index)))
(add-hook 'c++-mode-hook (lambda () (imenu-add-menubar-index)))

(require 'auto-complete-clang)
(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)

;; C++ function definitions in a header file are expanded to definitions
;; in acorresponding source file
(require 'member-functions)
(setq mf--source-file-extension "cpp")
