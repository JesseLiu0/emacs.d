

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-pabbrev.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: pabbrev expansion
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'pabbrev)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Change the abbreviation table on the fly depending on mode
;; as well as if we are in a comment or quoted string
;;
(add-hook 'pre-abbrev-expand-hook 'abbrev-table-change)

(defun abbrev-table-change (&optional args)
  (setq local-abbrev-table
        (if (eq major-mode 'jde-mode)
            (if (jde-parse-comment-or-quoted-p)
                text-mode-abbrev-table
              java-mode-abbrev-table)
          (if (eq major-mode 'python-mode)
              (if (py-in-literal)
                  text-mode-abbrev-table
                python-mode-abbrev-table)
          )
        )
  )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Normally hitting TAB a second time after a completion will take you 
;; to a suggestions buffer where you can select from alternate completions.
;; This bit of elisp hackery will instead use a pop-up list via
;; auto-competion mode. Make sure this is executed after pabbrev is loaded. 
;;
(require 'popup) ;from auto-complete

(defun pabbrevx-suggestions-goto-buffer (suggestions)
  (let* ((candidates (mapcar 'car suggestions))
         (bounds (pabbrev-bounds-of-thing-at-point))
         (selection (popup-menu* candidates
                                 :point (car bounds)
                                 :scroll-bar t)))
    (when selection
      ;; modified version of pabbrev-suggestions-insert
      (let ((point))
        (save-excursion
          (progn
            (delete-region (car bounds) (cdr bounds))
            (insert selection)
            (setq point (point))))
        (if point
            (goto-char point))
        ;; need to nil this so pabbrev-expand-maybe-full won't try
        ;; pabbrev expansion if user hits another TAB after ac aborts
        (setq pabbrev-last-expansion-suggestions nil)
        ))))
      
(fset 'pabbrev-suggestions-goto-buffer 'pabbrevx-suggestions-goto-buffer)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
