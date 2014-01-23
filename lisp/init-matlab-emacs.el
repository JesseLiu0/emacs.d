

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; rc-matlab-emacs.el
;;
;; Copyright (C) 2013 Eric N. Liu
;; 
;; Description: matlab-emacs
;; Author: Eric N. Liu (eenliu@gmail.com)
;; Keywords:
;; Requirements:
;; Version: 0.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;(add-to-list 'load-path "~/path/to/matlab-emacs")
(load-library "matlab-load")

;; Enable CEDET feature support for MATLAB code. (Optional)
(matlab-cedet-setup)
