;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-cedet.el
;;
;; Description:
;;     CEDET setup
;;
;; References:
;;     http://alexott.blogspot.com/2012/10/new-version-of-article-about-emacscedet.html
;;     http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Move SRecode map file. It has to be placed before loading cedet-devel-load.el.
(setq srecode-map-save-file "~/.emacs.d/cache/srecode-map.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load CEDET. Only needed for standalone dev version after 1.1.
;; Built-in CEDET 2.0 is automatically loaded on start.
(load-file "~/.emacs.d/site-lisp/cedet/cedet-devel-load.el")
;; Load CEDET CONTRIB.
(load-file "~/.emacs.d/site-lisp/cedet/contrib/cedet-contrib-load.el")
;;(load-file "~/.emacs.d/site-lisp/cedet/contrib/cedet-contrib.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Semantic
;;
;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode t)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode t)
;;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode t)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-breadcrumbs-mode t)

;; Change database directory
(setq semanticdb-default-save-directory "~/.emacs.d/cache/semanticdb/")

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
  (semantic-load-enable-all-exuberent-ctags-support))

;; Enable Semantic
;; (semantic-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Enable EDE (Project Management) features
;;(global-ede-mode 1)
;;
;; Move EDE project cache file
;;(setq ede-project-placeholder-cache-file "~/.emacs.d/cache/ede-projects.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use CEDET contrib package for code folding
;; global-semantic-tag-folding-mode does not work. Need hacks. See this ref:
;; http://stackoverflow.com/questions/15307113/emacs-cedet-semantic-tag-folding/16507249#16507249
;;
(defun do-after-decorate () (semantic-tag-folding-mode t) )
(add-hook 'semantic-decoration-mode-hook 'do-after-decorate)
(global-set-key [f5] 'semantic-tag-folding-fold-block)
(global-set-key [f6] 'semantic-tag-folding-show-block)
(global-set-key (kbd "C-c f a") 'semantic-tag-folding-fold-all)
(global-set-key (kbd "C-c f s") 'semantic-tag-folding-show-all)
