

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-server-windows.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: Setup server mode on Windows. Use -daemon for *nix.
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; On windows, hide Emacs to background when exit
;; and make use of the client mode.
;; Need a shortcut on tasbar defined as:
;; C:\apps\emacs\bin\emacsclientw.exe -na C:\apps\runemacs.exe -c
;;
(when (eq system-type 'windows-nt)
  (progn
    (require 'server)
    ;; start server
    (when (and (fboundp 'server-running-p) (not (server-running-p)))
	  (server-start))
    ;; define a function to hide emacs frame while keep server running
    (defun my-done ()
      (interactive)                 
      (server-edit)
      (make-frame-invisible nil t))
    ;; bind the hiding function to exit shortcut key
    (global-set-key (kbd "C-x C-c") 'my-done)
    )
  )
