;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-elpa.el
;;
;; Copyright (C) 2013-2014 Ning Liu
;;
;; Description: Config ELPA, install missing packages, and initilize them.
;; Author: Ning Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.2
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
;;			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ))

(defvar prelude-packages
  '(darcula-theme zenburn-theme elpy ess ess-R-data-view magit helm helm-projectile helm-gtags company company-c-headers function-args yasnippet sr-speedbar autopair column-marker dired-details dired-details+ dired-efap expand-region flymake-cursor pabbrev smart-operator tabbar tabbar-ruler whole-line-or-region volatile-highlights exec-path-from-shell)
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
