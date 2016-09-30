(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-comment-start-regexp "%" nil nil "This could provide a hacky solution to some indentation issues.")
 '(TeX-newline-function (quote newline) nil nil "A custom function here could be used to check if the current line matches any of a list of regular expressions and indent in different ways accordingly. Setting up a check for lines containing parts, chapters, sections, etc. would be super easy.")
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
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(bibtex-BibTeX-entry-alist
   (quote
    (("article" "Article in Journal"
      (("author")
       ("title" "Title of the article (BibTeX converts it to lowercase)"))
      (("journal")
       ("year"))
      (("volume" "Volume of the journal")
       ("number" "Number of the journal (only allowed if entry contains volume)")
       ("pages" "Pages in the journal")
       ("month")
       ("note")))
     ("inproceedings" "Article in Conference Proceedings"
      (("author")
       ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)"))
      (("booktitle" "Name of the conference proceedings")
       ("year"))
      (("editor")
       ("volume" "Volume of the conference proceedings in the series")
       ("number" "Number of the conference proceedings in a small series (overwritten by volume)")
       ("series" "Series in which the conference proceedings appeared")
       ("pages" "Pages in the conference proceedings")
       ("month")
       ("address")
       ("organization" "Sponsoring organization of the conference")
       ("publisher" "Publishing company, its location")
       ("note")))
     ("incollection" "Article in a Collection"
      (("author")
       ("title" "Title of the article in book (BibTeX converts it to lowercase)")
       ("booktitle" "Name of the book"))
      (("publisher")
       ("year"))
      (("editor")
       ("volume" "Volume of the book in the series")
       ("number" "Number of the book in a small series (overwritten by volume)")
       ("series" "Series in which the book appeared")
       ("type" "Word to use instead of \"chapter\"")
       ("chapter" "Chapter in the book")
       ("pages" "Pages in the book")
       ("edition" "Edition of the book as a capitalized English word")
       ("month")
       ("address")
       ("note")))
     ("inbook" "Chapter or Pages in a Book"
      (("author" nil nil 0)
       ("editor" nil nil 0)
       ("title" "Title of the book")
       ("chapter" "Chapter in the book"))
      (("publisher")
       ("year"))
      (("volume" "Volume of the book in the series")
       ("number" "Number of the book in a small series (overwritten by volume)")
       ("series" "Series in which the book appeared")
       ("type" "Word to use instead of \"chapter\"")
       ("address")
       ("edition" "Edition of the book as a capitalized English word")
       ("month")
       ("pages" "Pages in the book")
       ("note")))
     ("proceedings" "Conference Proceedings"
      (("title" "Title of the conference proceedings")
       ("year"))
      nil
      (("booktitle" "Title of the proceedings for cross references")
       ("editor")
       ("volume" "Volume of the conference proceedings in the series")
       ("number" "Number of the conference proceedings in a small series (overwritten by volume)")
       ("series" "Series in which the conference proceedings appeared")
       ("address")
       ("month")
       ("organization" "Sponsoring organization of the conference")
       ("publisher" "Publishing company, its location")
       ("note")))
     ("book" "Book"
      (("author" nil nil 0)
       ("editor" nil nil 0)
       ("title" "Title of the book"))
      (("publisher")
       ("year"))
      (("volume" "Volume of the book in the series")
       ("number" "Number of the book in a small series (overwritten by volume)")
       ("series" "Series in which the book appeared")
       ("address")
       ("edition" "Edition of the book as a capitalized English word")
       ("month")
       ("note")))
     ("booklet" "Booklet (Bound, but no Publisher)"
      (("title" "Title of the booklet (BibTeX converts it to lowercase)"))
      nil
      (("author")
       ("howpublished" "The way in which the booklet was published")
       ("address")
       ("month")
       ("year")
       ("note")))
     ("phdthesis" "PhD. Thesis"
      (("author")
       ("title" "Title of the PhD. thesis")
       ("school" "School where the PhD. thesis was written")
       ("year"))
      nil
      (("type" "Type of the PhD. thesis")
       ("address" "Address of the school (if not part of field \"school\") or country")
       ("month")
       ("note")))
     ("mastersthesis" "Master's Thesis"
      (("author")
       ("title" "Title of the master's thesis (BibTeX converts it to lowercase)")
       ("school" "School where the master's thesis was written")
       ("year"))
      nil
      (("type" "Type of the master's thesis (if other than \"Master's thesis\")")
       ("address" "Address of the school (if not part of field \"school\") or country")
       ("month")
       ("note")))
     ("techreport" "Technical Report"
      (("author")
       ("title" "Title of the technical report (BibTeX converts it to lowercase)")
       ("institution" "Sponsoring institution of the report")
       ("year"))
      nil
      (("type" "Type of the report (if other than \"technical report\")")
       ("number" "Number of the technical report")
       ("address")
       ("month")
       ("note")))
     ("manual" "Technical Manual"
      (("title" "Title of the manual"))
      nil
      (("author")
       ("organization" "Publishing organization of the manual")
       ("address")
       ("edition" "Edition of the manual as a capitalized English word")
       ("month")
       ("year")
       ("note")))
     ("unpublished" "Unpublished"
      (("author")
       ("title" "Title of the unpublished work (BibTeX converts it to lowercase)")
       ("note"))
      nil
      (("month")
       ("year")))
     ("misc" "Miscellaneous" nil nil
      (("author")
       ("title" "Title of the work (BibTeX converts it to lowercase)")
       ("howpublished" "The way in which the work was published")
       ("month")
       ("year")
       ("note"))))))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes
   (quote
    ("427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "f9574c9ede3f64d57b3aa9b9cef621d54e2e503f4d75d8613cbcc4ca1c962c21" "1bacdd5d24f187f273f488a23c977f26452dffbc82d4ac57250aa041f14159da" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "959a77d21e6f15c5c63d360da73281fdc40db3e9f94e310fc1e8213f665d0278" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(delete-selection-mode t)
 '(fci-rule-color "#383838")
 '(fixmee-cache-refresh-interval 5)
 '(fixmee-notice-regexp
   "\\(@@@+\\|\\_<\\(?:[Tt][Oo][Dd][Oo]+\\|[Ff][Ii][Xx][Mm][Ee]+\\|[Cc][Ii][Tt][Ee][Mm][Ee]+\\|[Mm][Aa][Yy][Bb][Ee]+\\|XXX+\\|[Ss][Tt][Aa][Rr][Tt][Ee][Dd]+\\)\\)\\(?:[/:?!. 	
]+\\|-+\\(?:\\s-\\|[
]\\)\\|\\_>\\)")
 '(flycheck-chktexrc ".chktexrc")
 '(flyspell-highlight-properties nil)
 '(flyspell-lazy-window-idle-seconds 10)
 '(flyspell-tex-command-regexp
   "\\(\\(begin\\|end\\)[ 	]*{\\|\\(cite[a-z*]*\\|label\\|ref\\|eqref\\|usepackage\\|documentclass\\)[ 	]*\\(\\[[^]]*\\]\\)?{[^{}]*\\)")
 '(gnus-novice-user t)
 '(icicle-mode nil)
 '(ispell-following-word t)
 '(magit-commit-arguments (quote ("--verbose")))
 '(magit-log-section-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(markdown-list-indent-width 2)
 '(nyan-mode t)
 '(org-enforce-todo-dependencies t)
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (dash dash-functional deferred magit-popup diminish flycheck-pos-tip flycheck-status-emoji flycheck flycheck-color-mode-line flycheck-pkg-config flycheck-tip smart-mode-line smart-mode-line-powerline-theme calfw calfw-gcal org-gcal alert auctex avy company f git-commit hydra ivy loop org package-build projectile request s with-editor yasnippet fci-mode zenburn-theme yaml-mode ws-butler writegood-mode wrap-region use-package undo-tree tomatinho synosaurus swiper suggest strings smooth-scrolling smex rectangle-utils rainbow-mode pomodoro paredit paradox outline-magic origami org-trello org-projectile org-pomodoro org-plus-contrib org-commentary nyan-mode nlinum multiple-cursors minimap material-theme markdown-mode magit latex-preview-pane latex-extra ido-ubiquitous idle-highlight-mode icicles ibuffer-projectile hyde flymd fixmee fireplace find-file-in-project fill-column-indicator ecb dracula-theme dired+ dictionary cyberpunk-theme company-statistics company-shell company-quickhelp company-math company-flx company-auctex color-theme-sanityinc-tomorrow color-theme cmake-project cmake-font-lock cheatsheet cask bug-hunter bookmark+ better-defaults auto-yasnippet all aggressive-indent adaptive-wrap ace-window abyss-theme)))
 '(paradox-automatically-star nil)
 '(safe-local-variable-values (quote ((read-only-mode . t))))
 '(scroll-error-top-bottom t)
 '(sml/col-number-format "%2c")
 '(sml/mode-width (quote right))
 '(sml/modified-char "M")
 '(sml/mule-info "%z")
 '(sml/outside-modified-char "!")
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   (quote powerline-active1)
                   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active1)
                   (quote sml/global))))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   (quote sml/global)
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active2)
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
 '(sml/shorten-modes t)
 '(sml/show-client t)
 '(sml/theme (quote automatic))
 '(sml/vc-mode-show-backend t)
 '(ws-butler-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "lime green"))))
 '(org-tag ((t (:foreground "forest green" :weight bold)))))
