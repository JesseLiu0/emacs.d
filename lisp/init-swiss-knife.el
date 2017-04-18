;; Description:
;;     Small utilities improve user experience.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs-async
;;
(setq async-byte-compile-log-file "~/.emacs.d/cache/async-bytecomp.log")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dired-details+
;; Use '(' or ')' keys to toggle file/dir details.
;;
(require 'dired-details+)
(dired-details-show)
;;enable recursive deletion of dirs, but doubly ask if it's not empty.
(setq dired-recursive-deletes 'top)
;; ibuffer by default
(global-set-key (kbd "C-x C-b") 'ibuffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flycheck
;;
(add-hook 'after-init-hook #'global-flycheck-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippet
;; Snippets directory list is defined in yas-snippet-dirs.
;;
(require 'yasnippet)
(yas-global-mode 1)    


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company-mode
;;
(require 'company)
(setq company-minimum-prefix-length 1)
;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)
(setq company-show-numbers t)  ; display serial number
(setq company-idle-delay 0.2)  ; menu delay
(add-hook 'after-init-hook 'global-company-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tabbar-ruler
;;
(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
;; (setq tabbar-ruler-global-ruler t) ; if you want a global ruler
;; (setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
;; (setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the scroll bar when your mouse is moving.
(require 'tabbar-ruler)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto insert parenthesis paris
;;
(require 'autopair)
(autopair-global-mode 1) ;; enable autopair in all buffers
(setq autopair-autowrap t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Column marker
;;
(require 'column-marker)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; volatile-highlights
;;
(require 'volatile-highlights)
(volatile-highlights-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; expand-region
;;
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; slick copy. 
;; Copy (M-w) or Cut (C-w) the whole line when mark not set. 
;; Paste (C-y) the whole line before the current line regardless cursor position.
;; (require 'whole-line-or-region) ;; unnecessary.elpa init
(whole-line-or-region-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; CUA Mode. Do not use cua keys. Enable only for rectangular selection.
;;
(setq cua-enable-cua-keys nil) ;I really don't care to emulate windows keybindings, so lets turn those off.
(cua-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Removes the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings.
;;
(defun remove-dos-eol ()
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rainbow delimiters
;;
;; (require 'rainbow-delimiters) ;; elpa init
;;- To enable in all programming-related modes (Emacs 24+):
;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Magit for GIT
;;
;; Bind magit-status to C-x g
(global-set-key (kbd "C-x g") 'magit-status)
;; Refine diff level to word-by-word for all hunks. "t" for current hunk only.
(setq magit-diff-refine-hunk 'all)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; desktop+ for session management
;;
(setq desktop+-base-dir "~/.emacs.d/cache/desktops")
(setq desktop-save nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; undo tree
;; C-x u ; visualize undo tree
;;
(global-undo-tree-mode)  ; Enable global undo tree mode.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Ivy, Counsel, Swiper
;;
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c C-f") 'counsel-recentf)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

(require 'ivy-hydra)  ; Use hydra to select an action for the current command.
(setq counsel-yank-pop-separator "\n------------------------------\n")
