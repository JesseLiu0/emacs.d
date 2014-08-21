

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-shell-mode.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: config shell mode
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;; Fix colors (like ls --color, etc)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;Make the prompt read only
(setq comint-prompt-read-only t)

;; (define-key comint-mode-map [(meta p)]
;;   'comint-previous-matching-input-from-input)
;; (define-key comint-mode-map [(meta n)]
;;    'comint-next-matching-input-from-input)
;; (define-key comint-mode-map [(control meta n)]
;;    'comint-next-input)
;; (define-key comint-mode-map [(control meta p)]
;;    'comint-previous-input)


;; In term or ansi-term mode, disable autopair because its bug remaps the return key to an autopair function
;; http://lukeshu.ath.cx/1/wordpress/2011/08/fixing-wrong-type-argument-characterp-return-in-emacs/
(add-hook 'term-mode-hook
	  '(lambda () (autopair-mode -1)))


(setq eshell-directory-name "~/.emacs.d/cache/eshell")
