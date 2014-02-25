

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-elpy.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: Python support by elpy
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(elpy-enable)
(elpy-use-ipython)
;;  (elpy-clean-modeline))

;; permanatenly use jedi as rpc backend
(setq elpy-rpc-backend "jedi")

;; Remove flymake-mode from elpy-default-minor-modes because of performance issue
(setq elpy-default-minor-modes (quote (eldoc-mode highlight-indentation-mode yas-minor-mode auto-complete-mode)))


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
