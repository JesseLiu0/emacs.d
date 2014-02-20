

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
;; (load-file "~/.emacs.d/site-lisp/cedet-bzr/cedet-devel-load.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Sematic
;;
;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for all the features.
;; 
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
;;
;; Enable Semantic
;(semantic-mode 1)

;; Change database directory
;(setq semanticdb-default-save-directory "~/.emacs.d/metadata/semanticdb/")

;; if you want to enable support for gnu global
;(semanticdb-enable-gnu-global-databases 'c-mode)
;(semanticdb-enable-gnu-global-databases 'c++-mode)
;(semanticdb-enable-gnu-global-databases 'python-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Enable EDE (Project Management) features
;(global-ede-mode 1)
