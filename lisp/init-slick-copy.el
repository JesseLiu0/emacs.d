

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-slick-copy.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: copy or cut the whole if mark not set.
;;              http://www.emacswiki.org/emacs/WholeLineOrRegion

;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; (defadvice kill-ring-save (around slick-copy activate)
;;   "When called interactively with no active region, copy a single line instead."
;;   (if (or (use-region-p) (not (called-interactively-p 'any)))
;;       ad-do-it
;;     (kill-new (buffer-substring (line-beginning-position)
;; 				(line-beginning-position 2))
;; 	      nil '(yank-line))
;;     (message "Copied line")))

;; (defadvice kill-region (around slick-copy activate)
;;   "When called interactively with no active region, kill a single line instead."
;;   (if (or (use-region-p) (not (called-interactively-p 'any)))
;;       ad-do-it
;;     (kill-new (filter-buffer-substring (line-beginning-position)
;; 				       (line-beginning-position 2) t)
;; 	      nil '(yank-line))))

;; (defun yank-line (string)
;;   "Insert STRING above the current line."
;;   (beginning-of-line)
;;   (unless (= (elt string (1- (length string))) ?\n)
;;     (save-excursion (insert "\n")))
;;   (insert string))
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'whole-line-or-region)
(whole-line-or-region-mode t)
