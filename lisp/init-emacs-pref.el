;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-emacs-pref.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: Customizing Emacs preferences and apperance.
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; set start-up folder
;;
(setq default-directory "~")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Common preferences
;;
(custom-set-variables
 ;; disable welcome message
 '(inhibit-startup-message t)
 '(inhibit-startup-echo-area-message t)
 '(initial-scratch-message "") 

 ;; Format the title-bar to always include the buffer name
 ;;(setq frame-title-format "Emacs - %b")
 '(frame-title-format "%b")

 ;; Line numbering
 '(linum-format "%4d")
 '(global-linum-mode t)

 ;; Scroll line by line
 '(scroll-step 1)

 ;; disable toolbar, scrollbars and menu bar
 (tool-bar-mode -1)
 '(scroll-bar-mode t)
 ;; (menu-bar-mode -1)

 ;; Transient Mark mode (Highlight marked region) is enabled in Delete Selection mode.
 '(delete-selection-mode t)   

 ;; Highlight current line
 '(global-hl-line-mode 1)

 ;; Columns
 '(column-number-mode t)
 '(fill-column 90)

 ;; Auto fill without keep hitting M-q
 '(auto-fill-mode t)

 ;; C-k at the very beginning of a line kills the entire line including the following newline. 
 '(kill-whole-line t)

 ;; Don't add newlines to end of buffer when scrolling (C-n) to the last line.
 '(next-line-add-newlines nil)

 ;; Always end a file with a newline
 '(require-final-newline t)

 ;; Parenthesis matching
 '(show-paren-mode t)
 '(show-paren-delay 0)           ; how long to wait?
 '(show-paren-style 'mixed) ; optionss are 'parenthesis','expression' and 'mixed'

 ;; flash instead of that annoying bell
 '(visible-bell t)

 ;; Display time
 '(display-time-mode t)

 ;;Never put tabs in files, use spaces instead
 ;;Note: Use C-q C-i to put a real tab should the need ever arise.
 '(indent-tabs-mode -1)

 ;; Save bookmarks to file regularly
 '(bookmark-save-flag 1)

 ;;Allow fetching files from HTTP servers
 '(url-handler-mode t)
 '(url-cookie-file "~/.emacs.d/metadata/url/cookies")

 ;;TRAMP should default to ssh
 '(tramp-default-method "ssh")

 ;; !!! not working with emacs --daemon !!!
 ;; delete files to ~/.Trash/
 '(delete-by-moving-to-trash t)

 ;; disable version control backend as opening a GIT repo file is really slow
 '(vc-handled-backends ())
 )


;; use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)

;; turn on syntax highlight
(cond ((fboundp 'global-font-lock-mode)
        ;; Turn on font-lock in all modes that support it
        (global-font-lock-mode t)
        ;; Maximum colors
        (setq font-lock-maximum-decoration t)
        ;; limit the file size on which font-lock works
        (setq font-lock-maximum-size 50000)))



;; Enable "set-goal-column (C-x C-n)"
(put 'set-goal-column 'disabled -1)

;; Enable "upcase-region (C-x C-u)"
(put 'upcase-region 'disabled -1)

;; Enable "downcase-region (C-x C-l)"
(put 'downcase-region 'disabled -1)


;; Enable narrow-to-region
(put 'narrow-to-region 'disabled -1)

;; shell-command - enables tab-completion for "shell-command"
;; (included in Debian "emacs-goodies-el" package)
;;(shell-command-completion-mode)


;; auto save prefix (directory)
(setq auto-save-list-file-prefix "~/.emacs.d/save-backup/auto-save-list/.saves-")


;;Place all backup copies of files in a common location
(defconst use-backup-dir t)   
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/save-backup/backups/")))
      version-control t                ; Use version numbers for backups
      kept-new-versions 16             ; Number of newest versions to keep
      kept-old-versions 2              ; Number of oldest versions to keep
      delete-old-versions t            ; Ask to delete excess backup versions?
      backup-by-copying-when-linked t) ; Copy linked files, don't rename.



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Show newlines at end of file
;;
(define-fringe-bitmap 'empty-line [0 0 #x3c #x3c #x3c #x3c 0 0])
(set-default 'indicate-empty-lines nil)



