;;; .emacs --- Where all the magic begins -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;;;
;;; This file loads Org-mode and then loads the rest of my Emacs
;;; initialization from Emacs Lisp embedded in literate Org-mode files.


;;; Code:

;; Have Emacs prefer newer package source, even over byte compiled files
(setq load-prefer-newer t)

;; Initialize package before calling Org Mode to ensure the ELPA version of Org
;; is loaded instead of the built-in one.
(require 'package)
(setq package-enable-at-startup nil
      package-archives
        '(("melpa"        . "http://melpa.org/packages/")
          ("org"          . "http://orgmode.org/elpa/")
          ("gnu"          . "http://elpa.gnu.org/packages/")
          ("melpa-stable" . "https://stable.melpa.org/packages/"))
      package-archive-priorities
        '(("org"          . 30)
          ("melpa-stable" . 15) ; lower than melpa for now due to weird bugs
          ("gnu"          . 20)
          ("melpa"        . 25))
      package-menu-hide-low-priority t)
(package-initialize)

;; On macOS, ensure that the environment variables Emacs is seeing are what
;; they're supposed to be. There's a package for that.
(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :ensure t
    :config (exec-path-from-shell-initialize)))

;; Load `cl-lib' here, since we use Common Lisp constructs frequently
(require 'cl-lib)

;; Load `epa-file' for full-file encryption using EasyPG
(require 'epa-file)
(epa-file-enable)

;; Load the ELPA-installed `org' package
(require 'org)

;; Load org-crypt for encryption of text beneath headlines in org
;; files with the :encrypted: tag.
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "drmrd@drmrd.xyz")

;; Now begin the rest of the configuration process
(org-babel-load-file (expand-file-name "~/.emacs.d/init.org"))

;;; .emacs ends here
