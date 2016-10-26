;; Description:
;;     file management.


;; toggle file/dir details to be displayed in dired
;; use '(' or ')' key
;;
(require 'dired-details+)
(dired-details-show)

;;enable recursive deletion of dirs, but doubly ask if it's not empty.
(setq dired-recursive-deletes 'top)

;; ibuffer by default
(global-set-key (kbd "C-x C-b") 'ibuffer)
