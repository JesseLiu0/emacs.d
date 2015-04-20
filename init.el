

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init.el
;;
;; Copyright (C) 2013-2014 Nolan Liu
;; 
;; Description: Emacs init.
;; Author: Nolan Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Define the custom-file that contains menu-saved settings.
;;
(defvar my-packages
  '(darcula-theme zenburn-theme elpy ess ess-R-data-view matlab-mode magit helm helm-projectile helm-gtags company company-c-headers function-args yasnippet sr-speedbar autopair column-marker dired-details dired-details+ dired-efap expand-region flymake-cursor pabbrev smart-operator tabbar tabbar-ruler whole-line-or-region volatile-highlights exec-path-from-shell)
  "A list of packages needed and installed by ELPA.")

(if (<= emacs-major-version 24)
    (progn
      (setq custom-file "~/.emacs.d/lisp/init-emacs-custom.el")  ;; Emacs 24
      (defvar package-selected-packages my-packages "Definition to be compatible with Emacs 25.")
      )
  (setq custom-file "~/.emacs.d/lisp/init-emacs-custom-25.el") ;; Emacs 25
  )
(load custom-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; elpa package management
(if (<= emacs-major-version 24)
    (load "~/.emacs.d/lisp/init-elpa.el")
  (load "~/.emacs.d/lisp/init-elpa-25.el")
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Paths for libraries and executables
;; Note: Keep every emacs library underneath ~/.emacs.d and 
;;   shun loading them from the system paths. This makes it 
;;   easier to use this config on multiple systems.
;;
;; (push "~/.emacs.d" load-path)
;;
;; recursively add the sub-directories to load-path
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
;;
;; Steve Purcell's script 'exec-path-from-shell' to set Emacs' `exec-path'
;; and $PATH from the shell path, so that `shell-command', `compile' and
;; the like work as expected.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load develpment version CEDET
;; This must be loaded at the beginning to prevent built-in CEDET loading.
;;
(load "~/.emacs.d/lisp/init-cedet.el")


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Config scripts for preferences, tools, and modes.
;;
;; basic preferences
(load "~/.emacs.d/lisp/init-emacs-pref.el")     ; Emacs Preferences
(load "~/.emacs.d/lisp/init-key-bindings.el")   ; key bindings
(load "~/.emacs.d/lisp/init-appearance.el")          ; fonts, color-theme, font zoom, etc.
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
(load "~/.emacs.d/lisp/init-python-mode.el")    ; Based on elpy
(load "~/.emacs.d/lisp/init-matlab-mode.el")
