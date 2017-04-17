;; Description:
;;     ELPA initialization and installing all specified packages.
;;

;; initialize packages
(package-initialize)

;; Package repos
(setq package-archives '(
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ))

;; Packages installed explicitly by user
(setq package-selected-packages
      '(ac-anaconda
	autopair
	column-marker
	company-c-headers
	darcula-theme
        desktop+
	dired-efap
	dired-details+
	ein
	electric-spacing
	elpy
	ess-R-data-view
	ess
	exec-path-from-shell
	expand-region
	flycheck
	function-args
	helm-gtags
	helm-projectile
	helm
	magit
	markdown-preview-mode
	matlab-mode
	pabbrev
	python-docstring
	realgud
	sphinx-doc
	sr-speedbar
	tabbar-ruler
        undo-tree
	volatile-highlights
	whole-line-or-region
	))

;; Check if any required package not installed
(require 'cl)
(defun packages-installed-p ()
  (loop for p in package-selected-packages
        when (not (package-installed-p p)) do (return nil)
	finally (return t)))

;; Install missing packages
(unless (packages-installed-p)
  ;; check for new package versions
  (message "%s" "ELPA is refreshing package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p package-selected-packages)
    (when (not (package-installed-p p))
      (package-install p))))
