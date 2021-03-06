;; Description:
;;     default fonts, color theme, font zoom, etc.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color theme
;;
;; (load-theme 'darcula t)
;; Set selection region face
;; (set-face-attribute 'region nil :background "#666" :foreground "#f5deb3")
;;
(load-theme 'sanityinc-tomorrow-night t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set default font
;;
(cond
 ((equal system-type 'gnu/linux)
 (add-to-list 'default-frame-alist '(font . "Monaco-11")))
 ((equal system-type 'darwin)
 (add-to-list 'default-frame-alist '(font . "Monaco-13")))
 ((equal system-type 'windows-nt)
 (add-to-list 'default-frame-alist '(font . "Monaco-10")))
 ;;(add-to-list 'default-frame-alist '(font . "Menlo-11")))
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Use variable width font faces in text-like buffer
;;
(defun my-buffer-face-mode-variable ()
"Set font to a variable width (proportional) fonts in current buffer"
(interactive)
(setq buffer-face-mode-face '(:family "Times New Roman" :height 140))
(buffer-face-mode))

;; Use monospaced font faces in current buffer
(defun my-buffer-face-mode-fixed ()
"Sets a fixed width (monospace) font in current buffer"
(interactive)
(setq buffer-face-mode-face '(:family "Monaco" :height 100))  ; Unit is 1/10pt, so 100 means 10pt.
(buffer-face-mode))

;; Set default font faces for text-like modes
(add-hook 'erc-mode-hook 'my-buffer-face-mode-variable)
(add-hook 'Info-mode-hook 'my-buffer-face-mode-variable)
(add-hook 'TeX-mode-hook 'my-buffer-face-mode-variable)
;;(add-hook 'text-mode-hook 'my-buffer-face-mode-variable)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set startup frame size and position.
;;
;; Windows
(if (eq system-type 'windows-nt)
    (add-to-list 'default-frame-alist '(fullscreen . fullboth)))
    ;; (toggle-frame-fullscreen) ; F11

;; OSX or Linux
(when (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
 (progn
 (add-to-list 'default-frame-alist '(height . 60))
 (add-to-list 'default-frame-alist '(width . 120))
 (add-to-list 'default-frame-alist '(left . 480))
 (add-to-list 'default-frame-alist '(top . 0))
 ))


;; Duplicate effect of --natural-title-bar in Emacs-plus 25
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
