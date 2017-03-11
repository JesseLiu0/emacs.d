;; Description:
;;     Emacs built-in preferences, apperance and behaviors.


;; set start-up folder
(setq default-directory "~")

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; disable toolbar, scrollbars and menu bar
(tool-bar-mode -1)
(scroll-bar-mode t)
;; (menu-bar-mode -1)

;; disable welcome message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message "Emacs started successfully.") 

;; Format the title-bar to always include the buffer name
;;(setq frame-title-format "Emacs - %b")
(setq frame-title-format "%b")

;; Line numbering
(setq linum-format "%4d")
(global-linum-mode t)

;; Transient Mark mode (Highlight marked region) is enabled in Delete Selection mode.
(delete-selection-mode t)

;; ;; Highlight current line
;; ;; Disabled global mode for a bug. This mode makes rendering very slow when moving cursor.
;; (global-hl-line-mode 1)
;; ;; Set any color as the background face of the current line:
;; (set-face-background 'hl-line "#3e4446")
;; ;; To keep syntax highlighting in the current line:
;; (set-face-foreground 'highlight nil)

;; Columns
(column-number-mode t)
(setq fill-column 90)

;; Auto fill without keep hitting M-q
(auto-fill-mode t)

;; C-k at the very beginning of a line kills the entire line including the following newline. 
(setq kill-whole-line t)

;; Don't add newlines to end of buffer when scrolling (C-n) to the last line.
(setq next-line-add-newlines nil)

;; Always end a file with a newline
(setq require-final-newline t)

;; Show Paren mode for parenthesis matching
(show-paren-mode t)
(setq show-paren-delay 0)           ; how long to wait?
(setq show-paren-style 'mixed) ; optionss are 'parenthesis','expression' and 'mixed'

;; flash instead of that annoying bell
(setq visible-bell t)

;; Display time
(display-time-mode t)

;;Never put tabs in files, use spaces instead
;;Note: Use C-q C-i to put a real tab should the need ever arise.
(setq-default indent-tabs-mode nil)

;; Save bookmarks to file regularly
(setq bookmark-save-flag 1)

;;Allow fetching files from HTTP servers
(url-handler-mode t)
(setq url-cookie-file "~/.emacs.d/cache/url/cookies")

;;TRAMP should default to ssh
(setq tramp-default-method "ssh")

;; Move files to system trash for deleting.
;; !!! not working with emacs --daemon !!!
;; delete files to ~/.Trash/
(setq delete-by-moving-to-trash t)
;; specify certain files that should skip the system trash.
;; Otherwise, emacs will fill your trash directory with countless
;; backup files and other temp files.
(setq system-trash-exclude-matches '("#[^/]+#$" ".*~$" "\\.emacs\\.desktop.*"))
(setq system-trash-exclude-paths '("/tmp" "C:\\Temp"))
;; Mac OSX support.
;; Use the tool "trash" to move FILE to the system trash on OS X.
;; See: http://www.emacswiki.org/emacs/SystemTrash
;; When using Homebrew, install it using \"brew install trash\"."
(if (eq system-type 'darwin)
    (defun system-move-file-to-trash (file)
      (call-process (executable-find "trash")
                    nil 0 nil
                    file))
)

;; disable version control backend as opening a GIT repo file is really slow
(setq vc-handled-backends ())

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
(setq auto-save-list-file-prefix "~/.emacs.d/cache/auto-save-list/.saves-")

;;Place all backup copies of files in a common location
(defconst use-backup-dir t)   
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/cache/backups/")))
      version-control t                ; Use version numbers for backups
      kept-new-versions 16             ; Number of newest versions to keep
      kept-old-versions 2              ; Number of oldest versions to keep
      delete-old-versions t            ; Ask to delete excess backup versions?
      backup-by-copying-when-linked t) ; Copy linked files, don't rename.

;; recentf-save-file location. After 24.4.
(setq recentf-save-file "~/.emacs.d/cache/recentf")

;; Show newlines at end of file
(define-fringe-bitmap 'empty-line [0 0 #x3c #x3c #x3c #x3c 0 0])
(set-default 'indicate-empty-lines nil)

;; Enable uniquify
(require 'uniquify) ;; Emacs 24 built-in
(setq uniquify-buffer-name-style 'forward)

