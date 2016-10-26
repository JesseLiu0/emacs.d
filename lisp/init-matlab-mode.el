;; Description:
;;     Matlab


;; http://www.emacswiki.org/emacs/MatlabMode

(autoload 'matlab-mode "MATLAB" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab -nodesktop -nosplash")
