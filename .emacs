;;;; .emacs --- Where all the magic begins
;;;;
;;;; This file loads Org-mode and then loads the rest of our Emacs
;;;; initialization from Emacs lisp embedded in literate Org-mode files.

;;; Initialize package before calling Org Mode to ensure the ELPA
;;; version of Org is loaded instead of the built-in one.
(require 'package)
(setq package-enable-at-startup nil
      package-archives
        '(("melpa"        . "http://melpa.org/packages/")
          ("org"          . "http://orgmode.org/elpa/")
          ("gnu"          . "http://elpa.gnu.org/packages/")
          ("melpa-stable" . "https://stable.melpa.org/packages/"))
      package-archive-priorities
        '(("org"          . 30)
          ("melpa-stable" . 25)
          ("gnu"          . 20)
          ("melpa"        . 15))
      package-menu-hide-low-priority t)
(package-initialize)

;;; Load `epa-file' for full-file encryption using EasyPG
(require 'epa-file)
; (epa-file-enable)

;;; Load the ELPA-installed `org' package
(require 'org)

;;; Load org-crypt for encryption of text beneath headlines in org
;;; files with the :encrypted: tag.
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "drmrd@drmrd.xyz")

;;; Now begin the rest of the configuration process
(org-babel-load-file (expand-file-name "~/.emacs.d/init.org"))
