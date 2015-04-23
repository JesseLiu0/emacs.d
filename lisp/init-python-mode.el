

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-python-mode.el
;;
;; Copyright (C) 2014-2015 N. Liu
;; 
;; Description: Setup python programming environment. 
;;              Based on built-in python.el and elpy.
;; Author: Ning Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; elpy
;;
(elpy-enable)
;;  (elpy-clean-modeline))

;; Use jedi as rpc backend
(setq elpy-rpc-backend "jedi")

;; Use IPython as interactive environment
(when (executable-find "ipython")
  (elpy-use-ipython))
(if (eq system-type 'windows-nt)
    (setq python-shell-interpreter-args "console --matplotlib=qt")
  (setq python-shell-interpreter-args "--matplotlib")
  )

;; Fine tuning editing behavior
(define-key python-mode-map (kbd "RET")
  'newline-and-indent)
(add-hook 'python-mode-hook
          (lambda () (set (make-local-variable 'comment-inline-offset) 2)))

;; use python-mode for *.pyw and *.wsgi
(add-to-list 'auto-mode-alist '("\\.pyw\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))

;; Use flycheck to replace flymake
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; highlight-indentation is called by elpy
;; highlight-indentation-mode displays guidelines indentation (space indentation only).
;; highlight-indentation-current-column-mode displays guidelines for the current-point indentation (space indentation only).
;;

;; (set-face-background 'highlight-indentation-face "#e3e3d3")
;; (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
(set-face-background 'highlight-indentation-face "#282828")
(set-face-background 'highlight-indentation-current-column-face "#383838")

;; Turned off highlight-indentation-mode by default as it is distracting.
;;(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
