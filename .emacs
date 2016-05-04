;;; .emacs --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs
;; initialization from Emacs lisp embedded in literate Org-mode files.

; Initialize package before calling Org Mode to ensure the ELPA
; version of Org is loaded instead of the built-in one.
(require 'package)
(setq
 package-enable-at-startup nil
 package-archives
 '(("melpa-stable" . "https://stable.melpa.org/packages/")
   ("melpa"        . "https://melpa.org/packages/")
   ("marmalade"    . "http://marmalade-repo.org/packages/")
   ("org"          . "http://orgmode.org/elpa/")
   ("gnu"          . "http://elpa.gnu.org/packages/")))
(package-initialize)

; Now begin the rest of the configuration process
(require 'org)
(org-babel-load-file
 (expand-file-name "~/.emacs.d/init.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Okular" "okular --unique %o#src:%n%b"))))
 '(TeX-view-program-selection
   (quote
    ((engine-omega "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open"))))
 '(custom-safe-themes
   (quote
    ("959a77d21e6f15c5c63d360da73281fdc40db3e9f94e310fc1e8213f665d0278" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(delete-selection-mode t)
 '(paradox-automatically-star nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
