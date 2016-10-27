;; Description:
;;     Session management
;;
;; References:
;;     https://www.emacswiki.org/emacs/DeskTop
;;     https://www.emacswiki.org/emacs/SessionManagement


(desktop-save-mode 1)

;; Add extra variables you want saved across sessions.
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)

;; Specifying files not to be opened
(setq desktop-buffers-not-to-save
      (concat "\\("
              "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
              "\\)$"))
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
