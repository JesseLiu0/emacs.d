;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-helm.el
;;
;; Copyright (C) 2014 Ning Liu
;; 
;; Description: Set up Helm.
;; Author: Ning Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'helm-config)
(require 'helm-grep)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; Rebind M-x (default: execute-extended-command) with helm-M-x.
(global-set-key (kbd "M-x") 'helm-M-x)

;; Rebind helm-show-kill-ring (default: "C-h v kill-ring") with M-y.
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; Rebind C-x b (default: switch-to-buffer) with helm-mini.
(global-set-key (kbd "C-x b") 'helm-mini)

;; Rebind C-x C-f (default: find-file) with helm-find-files.
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Bind helm-occur to short keys (default: <prefix> M-s o)
(global-set-key (kbd "C-c h o") 'helm-occur)

;; Rebind helm-all-mark-rings to C-h SPC (default: <prefix> C-c SPC).
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

;; Rebind helm-register to C-c h x (default: <prefix C-x r i).
(global-set-key (kbd "C-c h x") 'helm-register)

;; Rebind helm-google-suggest to C-c h g (default: <prefix> C-c g).
(global-set-key (kbd "C-c h g") 'helm-google-suggest)

;; Rebind helm-persistent-action and helm-select-action for more convenient use of TAB
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; helm-grep-mode key bindings for easier navigation
(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

;; Enable man page at point
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;; Use curl for Google suggest
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     nil ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)
