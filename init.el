

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init.el
;;
;; Copyright (C) 2013-2014 Ning Liu
;; 
;; Description: Emacs init.
;; Author: Ning Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load develpment version CEDET
;; This must be loaded at the beginning to prevent built-in CEDET loading.
;;
(load "~/.emacs.d/lisp/init-cedet.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set system environment variables
;;
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (push "/usr/local/bin" exec-path)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Library Paths
;; Note: Keep every emacs library underneath ~/.emacs.d and 
;;   shun loading them from the system paths. This makes it 
;;   easier to use this config on multiple systems.
;;
;; (push "~/.emacs.d" load-path)
;;
;; recursively add the sub-directories to load-path
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; set init file for custom settings
;;
(setq custom-file "~/.emacs.d/lisp/init-emacs-custom.el")
(load custom-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load RCs
;;

;; elpa package management
(load "~/.emacs.d/lisp/init-elpa.el")

;; basic preferences
(load "~/.emacs.d/lisp/init-emacs-pref.el")     ; Emacs Preferences
(load "~/.emacs.d/lisp/init-key-bindings.el")   ; key bindings
(load "~/.emacs.d/lisp/init-decor.el")          ; fonts, color-theme, font zoom, etc.
(load "~/.emacs.d/lisp/init-server-windows.el") ; Set up server mode on Windows.

;; extensions
(load "~/.emacs.d/lisp/init-desktop.el")        ; desktop package for saving buffer list and window management
(load "~/.emacs.d/lisp/init-dired.el")          ; dired, ibuffer, etc. for file management
(load "~/.emacs.d/lisp/init-swiss-knife.el")
(load "~/.emacs.d/lisp/init-helm.el")

;; mode configs
(load "~/.emacs.d/lisp/init-shell-mode.el")
(load "~/.emacs.d/lisp/init-text-mode.el")
(load "~/.emacs.d/lisp/init-lisp-mode.el")
(load "~/.emacs.d/lisp/init-cc-mode.el")
(load "~/.emacs.d/lisp/init-ess-mode.el")
(load "~/.emacs.d/lisp/init-python-mode.el")    ; Use elpy
;; (load "~/.emacs.d/lisp/init-matlab-mode.el") ; matlab-emacs make failed
;; (load "~/.emacs.d/lisp/init-css-mode.el")    ; comment out because GNU ELPA unavilable to install rainbow-mode


