

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-python.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: Setup python programming environment. 
;;              Based on built-in python.el only, no python-mode anymore.
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Built-in python.el setup
;;
(require 'python)
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "RET") 'newline-and-indent)
            (set-variable 'indent-tabs-mode nil) ;; do not use Tab as identation
            (set-variable 'python-indent-offset 4) ;; 4 is default
	    (require 'smart-operator)
            ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; auto completion by emacs-jedi
;;
(add-to-list 'load-path "~/.emacs.d/el-get/jedi")
(setq jedi:setup-keys t)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
;; legacy ac-sources, not from jedi
;; (add-hook 'python-mode-hook (lambda ()
			      ;; (add-to-list 'ac-sources '(ac-source-semantic ac-source-yasnippet))))


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Pylint: Static Syntax Error Check & Hightlight
;;
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))
(add-hook 'find-file-hook 'flymake-find-file-hook)
;(add-hook 'python-mode-hook 'flymake-mode-off)


