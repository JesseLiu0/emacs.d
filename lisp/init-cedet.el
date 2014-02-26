

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-cedet.el
;;
;; Copyright (C) 2014 Ning Liu
;; 
;; Description: CEDET setup
;; Author: Ning Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;
;; Ref:
;; http://alexott.blogspot.com/2012/10/new-version-of-article-about-emacscedet.html
;; http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load CEDET. Only needed for standalone dev version after 1.1.
;; Built-in CEDET 2.0 is automatically loaded on start.
(load-file "~/.emacs.d/site-lisp/cedet/cedet-devel-load.el")
;; Load CEDET CONTRIB.
(load-file "~/.emacs.d/site-lisp/cedet/contrib/cedet-contrib-load.elc")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Semantic
;;
;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode t)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-breadcrumbs-mode t)

;; Enable Semantic
(semantic-mode 1)

;; Change database directory
(setq semanticdb-default-save-directory "~/.emacs.d/metadata/semanticdb/")

;; if you want to enable support for gnu global
(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode)
  (semanticdb-enable-gnu-global-databases 'python-mode)
  (semanticdb-enable-gnu-global-databases 'emacs-lisp-mode)
  )

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(when (cedet-ectag-version-check)
  (semantic-load-enable-primary-exuberent-ctags-support))

;; Use CEDET contrib package for code folding
;; global-semantic-tag-folding-mode does not work. Need hacks. See this ref:
;; http://stackoverflow.com/questions/15307113/emacs-cedet-semantic-tag-folding/16507249#16507249
;;
(defun do-after-decorate () (semantic-tag-folding-mode t) )
(add-hook 'semantic-decoration-mode-hook 'do-after-decorate)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Enable EDE (Project Management) features
;(global-ede-mode 1)




