;; Description:
;;     Shell mode


;; Interpret and use ansi color codes in shell output windows. Fix colors (like ls --color, etc)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;Make the prompt read only
(setq comint-prompt-read-only t)

(setq comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
(setq comint-scroll-to-bottom-on-output t) ; always add output at the bottom
(setq comint-scroll-show-maximum-output t) ; scroll to show max possible output
(setq comint-completion-autolist t)        ; show completion list when ambiguous
(setq comint-input-ignoredups t)           ; no duplicates in command history
(setq comint-completion-addsuffix t)       ; insert space/slash after file completion


;; (define-key comint-mode-map [(meta p)]
;;   'comint-previous-matching-input-from-input)
;; (define-key comint-mode-map [(meta n)]
;;    'comint-next-matching-input-from-input)
;; (define-key comint-mode-map [(control meta n)]
;;    'comint-next-input)
;; (define-key comint-mode-map [(control meta p)]
;;    'comint-previous-input)


(setq eshell-directory-name "~/.emacs.d/cache/eshell")

(if (eq system-type 'windows-nt)
    (progn 
      (setq
       explicit-shell-file-name "C:/apps/msysgit/bin/bash.exe"
       explicit-bash.exe-args '("--noediting" "--login" "-i")
       )
      (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
      (add-to-list 'exec-path "C:/apps/msysgit/bin") ;support shell-command
      )
  )    
