

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-python-mode.el
;;
;; Copyright (C) 2014-2016 Jesse Liu
;; 
;; Description: Setup python programming environment. 
;;              Based on built-in python.el and elpy.
;; Author: Jesse Liu (jesse@liu.onl)
;; Keywords:
;; Requirements:
;; Version: 1.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; Enable elpy
(elpy-enable)

;; Use jedi as rpc backend
(setq elpy-rpc-backend "jedi")

;; Use IPython as interactive environment
(when (executable-find "ipython")
 (elpy-use-ipython))

;; Interpreter
(if (eq system-type 'windows-nt)
    (setq
     python-shell-interpreter "C:\\apps\\python\\Scripts\\ipython.exe"
     python-shell-interpreter-args "-i --matplotlib=qt5"
     elpy-rpc-python-command "C:\\apps\\python\\python.exe"
     )
  (setq elpy-rpc-python-command "/usr/local/bin/python3")
  (setq python-shell-interpreter-args "--matplotlib")
  )


;; Fine tune editing behavior
(define-key python-mode-map (kbd "RET") 'newline-and-indent)
(add-hook 'python-mode-hook #'electric-spacing-mode)

(defun python-mode-editing ()
  "My editing preferences for python-mode."
  (interactive)
  (set (make-local-variable 'comment-inline-offset) 2)
  )
(add-hook 'python-mode-hook 'python-mode-editing)


;; Set identation colors not too intrusive
(set-face-background 'highlight-indentation-face "#282828")
(set-face-background 'highlight-indentation-current-column-face "#383838")


;; use python-mode for *.pyw and *.wsgi
(add-to-list 'auto-mode-alist '("\\.pyw\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))


;; Use flycheck to replace flymake
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
