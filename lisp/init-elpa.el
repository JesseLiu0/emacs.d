;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-elpa.el
;;
;; Copyright (C) 2013-2015 Ning Liu
;;
;; Description: Config ELPA, install missing packages, and initilize them.
;; Author: Ning Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Note: for Emacs 25, package-selected-packages must be defined in custom-file
;; before this file is loaded.


;; initialize packages
(package-initialize)


;; Add a larger package list
(setq package-archives '(
			 ("melpa" . "http://melpa.milkbox.net/packages/")
;;			 ("marmalade" . "http://marmalade-repo.org/packages/")
;;			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ))


;; Following check package installation and install missing packages
(require 'cl)

(defvar prelude-packages package-selected-packages   ;; the latter defined in custom-file
  "A list of packages to ensure installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))
