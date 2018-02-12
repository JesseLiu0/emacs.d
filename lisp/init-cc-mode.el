;; Description:
;;     Programming environment for C++ and C


;; ----------------------------------------------------------------------------
;; Config cc-mode

(require 'cc-mode)

;; (add-hook 'c-initialization-hook
	  ;; (lambda ()
	    ;; (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
	    ;; ))

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-toggle-auto-hungry-state 1)     ; turn on auto newline and hungry delete
	    (setq compilation-scroll-output t) ; *compilation* buffer auto-scrolls to the end of new output
	    (imenu-add-menubar-index)          ; Load imenu menubar
	    (setq-local comment-auto-fill-only-comments t) ; use auto-fill-mode only for comments
	    (auto-fill-mode t)                 ; turn on auto-fill-mode
	   ))

;; Add custom include
;; (semantic-add-system-include "/usr/local/boost_1_54_0/" 'c++-mode)


;; ----------------------------------------------------------------------------
;; Config function-args

(require 'function-args)
(fa-config-default)

;; Open .h file in C++ mode instead of C mode.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


;; ----------------------------------------------------------------------------
;; Config irony-mode
;;https://oremacs.com/2017/03/28/emacs-cpp-ide/

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map
      [remap completion-at-point] 'counsel-irony)
  (define-key irony-mode-map
      [remap complete-symbol] 'counsel-irony))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
