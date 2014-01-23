

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
     python-shell-interpreter "C:\\apps\\Python27\\python.exe"
     python-shell-interpreter-args "-i C:\\apps\\Python27\\Scripts\\ipython-script.py"
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
