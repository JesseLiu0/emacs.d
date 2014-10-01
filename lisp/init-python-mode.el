

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-python-mode.el
;;
;; Copyright (C) 2014 N. Liu
;; 
;; Description: Setup python programming environment. 
;;              Based on built-in python.el and elpy.
;; Author: Ning Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; use python-mode for *.pyw
(add-to-list 'auto-mode-alist '("\\.pyw\\'" . python-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; elpy
;;
(elpy-enable)
(elpy-use-ipython)
;;  (elpy-clean-modeline))

;; permanatenly use jedi as rpc backend
(setq elpy-rpc-backend "jedi")

;; Imperfect workaround for solving RPC freezing on Windows.
;; Kill python.exe process if freezing happens.
(if (eq system-type 'windows-nt)
    (setq elpy-rpc-python-command "pythonw"))

;; elpy-default-minor-modes
;; Do not need to add yas-minor-mode as yas-global-mode is enabled.
(setq elpy-default-minor-modes (quote (flymake-mode eldoc-mode highlight-indentation-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; highlight-indentation is called by elpy
;; highlight-indentation-mode displays guidelines indentation (space indentation only).
;; highlight-indentation-current-column-mode displays guidelines for the current-point indentation (space indentation only).
;;
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ipython setup from EmacsWiki
;;
;; OS dependent
(if (eq system-type 'windows-nt)
    (setq
     python-shell-interpreter "C:\\Python27\\python.exe"
     python-shell-interpreter-args "-i C:\\Python27\\Scripts\\ipython-script.py"
     )
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   )
  )
;; common for all OS
(setq
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
 )












;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                               ;;
;;                Obsolete codes before using elpy                               ;;
;;                                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;
;; ;; Built-in python.el setup
;; ;;
;; (require 'python)
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (define-key python-mode-map (kbd "RET") 'newline-and-indent)
;;             (set-variable 'indent-tabs-mode nil) ;; do not use Tab as identation
;;             (set-variable 'python-indent-offset 4) ;; 4 is default
;; 	    (require 'smart-operator)
;;             ))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;
;; ;; Pylint: Static Syntax Error Check & Hightlight
;; ;;
;; (when (load "flymake" t)
;;   (defun flymake-pylint-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 		       'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "epylint" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pylint-init)))
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; ;(add-hook 'python-mode-hook 'flymake-mode-off)


