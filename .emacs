;;; .emacs --- Where all the magic begins
;;
;; This file loads Org-mode and then loads the rest of our Emacs
;; initialization from Emacs lisp embedded in literate Org-mode files.

(require 'org)
(org-babel-load-file
 (expand-file-name "~/.emacs.d/init.org"))
