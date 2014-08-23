

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-key-bindings.el
;;
;; Copyright (C) 2006-2014 N. Liu
;; 
;; Description: global key bindings
;; Author: N. Liu (eenliu@gmail.com)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Mark-ring (bookmarks) is navigable by typing C-u C-SPC and then repeating C-SPC forever
;; Push marks to mark-ring by C-SPC C-SPC
(setq set-mark-command-repeat-pop t)

;Suspend-frame is stupid
(global-set-key "\C-z" 'ignore)
(global-set-key "\C-x\C-z" 'ignore)

(global-set-key [S-left] 'windmove-left)          ; move to left window
(global-set-key [S-right] 'windmove-right)        ; move to right window
(global-set-key [S-up] 'windmove-up)              ; move to upper window
(global-set-key [S-down] 'windmove-down)          ; move to lower window

;The generic apropos (of any symbol) is MUCH more useful than apropos-command
(global-set-key "\C-ha" 'apropos)

;; fix delete behavior
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; use F1 and F2 to skip between buffers
(global-set-key [f1] 'yic-next-buffer) ;see below CUSTOM FUNCTIONS
(global-set-key [f2] 'yic-prev-buffer) ;see below CUSTOM FUNCTIONS

;;use F3 key to kill buffer
(global-set-key [f3] 'kill-this-buffer)

(global-set-key [f4] 'comment-line) ;;see below CUSTOM FUNCTIONS
(global-set-key [f5] 'uncomment-line) ;;see below CUSTOM FUNCTIONS
(global-set-key [f6] 'query-replace)
(global-set-key [f7] 'next-error)
;;(global-set-key [f7] 'xterm-mouse-mode)
;;(global-set-key [f8] 'menu-bar-mode)
;;(global-set-key [f9] 'hs-hide-block)
;;(global-set-key [f10] 'hs-show-block)

;; set "home" and "end" keys
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [(meta g)] 'goto-line) ;; original is M-g g. 

;; Scrolling up/down by 1 row
(global-set-key (kbd "M-p") 'scroll-down-line)
(global-set-key '[M-up]  'scroll-down-line)
(global-set-key '[M-kp-8]  'scroll-down-line)
(global-set-key (kbd "M-n")'scroll-up-line)
(global-set-key '[M-down]  'scroll-up-line)
(global-set-key '[M-kp-2]  'scroll-up-line)

(global-set-key [(control x) r j] 'bookmark-jump) ;; originally C-x r b bookmark <RET>

;;(global-set-key [(control tab)] 'other-window)
;;(global-set-key [(meta +)] 'enlarge-window)

;; set mark key to C- . instead of C-@
(global-set-key (kbd "C-,") 'set-mark-command)

;Make other-frame instinctive
(global-set-key "\C-co"	   'other-frame)

;Make dabbrev completion a little easier to hit
(global-set-key (kbd "M-RET") 'dabbrev-expand)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     CUSTOM FUNCTIONS for switching buffers
;;     Original yic-buffer.el
;;     From: choo@cs.yale.edu (young-il choo)
(defun yic-ignore (str)
  (or
   ;;buffers I don't want to switch to 
   (string-match "\\*Buffer List\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^ " str)

   ;;Test to see if the window is visible on an existing visible frame.
   ;;Because I can always ALT-TAB to that visible frame, I never want to 
   ;;Ctrl-TAB to that buffer in the current frame.  That would cause 
   ;;a duplicate top-level buffer inside two frames.
   (memq str               
         (mapcar 
          (lambda (x) 
            (buffer-name 
             (window-buffer 
              (frame-selected-window x))))
          (visible-frame-list)))
   ))

(defun yic-next (ls)
  "Switch to next buffer in ls skipping unwanted ones."
  (let* ((ptr ls)
         bf bn go
         )
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (yic-ignore bn))        ;skip over
          (setq go bf)
        (setq ptr (cdr ptr))
        )
      )
    (if go
        (switch-to-buffer go))))

(defun yic-prev-buffer ()
  "Switch to previous buffer in current window."
  (interactive)
  (yic-next (reverse (buffer-list))))

(defun yic-next-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (bury-buffer (current-buffer))
  (yic-next (buffer-list)))

;; comment line below the cursos
(defun comment-line ()
    (interactive)
    (beginning-of-line)
    (setq st (point))
    (end-of-line)
    (setq en (point))
    (if (> en st)
       (comment-region st en))
    (next-line 1)
)

;; uncomment line below the cursos
(defun uncomment-line ()
    (interactive)
    (beginning-of-line)
    (setq st (point))
    (end-of-line)
    (setq en (point))
    (if (> en st)
       (uncomment-region st en))
     (next-line 1)
)


