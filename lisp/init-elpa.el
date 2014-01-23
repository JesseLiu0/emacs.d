

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-elpa.el
;;
;; Copyright (C) 2013 Tony Liu
;; 
;; Description: Config ELPA, install missing packages, and initilize them.
;; Author: Tony Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; initialize packages
;;
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Following check package installation and install missing packages
;;
(require 'cl)

;; Add a larger package list
(setq package-archives '(
			 ("melpa" . "http://melpa.milkbox.net/packages/")
;;			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 )) 

(defvar prelude-packages
  '(magit elpy yasnippet auto-complete auto-complete-clang find-file-in-project fuzzy highlight-indentation idomenu  ecb iedit nose popup virtualenv ess ess-R-data-view ctable autopair color-theme column-marker dired-details dired-details+ dired-efap expand-region flymake-cursor pabbrev rainbow-mode rainbow-delimiters smart-operator tabbar tabbar-ruler volatile-highlights whole-line-or-region)
  "A list of packages to ensure are installed at launch.")

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



