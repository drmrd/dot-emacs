
(setq user-mail-address "moore@math.osu.edu")

(setq redisplay-dont-pause t)

(require 'package)
(package-initialize)
(setq package-archives
'(("ELPA" . "http://tromey.com/elpa/")
  ("gnu" . "http://elpa.gnu.org/packages/")
  ("melpa" . "http://melpa.milkbox.net/packages/")
  ("marmalade" . "http://marmalade-repo.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/lib")

(set-register ?e (cons 'file "~/.emacs.d/init.org"))
(set-register ?l (cons 'file "~/.emacs.d/lib/latex/latex.org"))
;; Also set a register for Preferences.el if on a Mac
(if (eq system-type 'darwin)
  (set-register ?p (cons 'file "~/Library/Preferences/Aquamacs Emacs/Preferences.el")))

(setq default-directory "~/workspace/")

(setq default-major-mode 'text-mode)
(remove-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'kill-auto-fill-mode-hook)

(setq require-final-newline t)

(ido-mode t)

(setq ido-everywhere            t
      ido-enable-prefix         nil
      ido-enable-flex-matching  t
      ido-auto-merge-work-directories-length nil
      ido-use-filename-at-point t
      ido-max-prospects         10
      ido-create-new-buffer     'always
      ;; ido-use-virtual-buffers   t
      ;; ido-handle-duplicate-virtual-buffers 2
      ido-default-buffer-method 'selected-window
      ido-default-file-method   'selected-window)

(defun ido-my-keys ()
  (define-key ido-completion-map (kbd "<up>")   'ido-prev-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match))

(add-hook 'ido-setup-hook 'ido-my-keys)

(setq ido-file-extensions-order     '(".tex" ".org" ".log" ".cc"
                                      ".h" ".sh" ".el" ".png"))

(setq completion-ignored-extensions '(".o" ".elc" "~" ".bin" ".bak"
                                      ".obj" ".map" ".a" ".so"
                                      ".mod" ".aux" ".out" ".pyg"
                                      ".bbl" ".blg" ".idx" ".ilg"
                                      ".ind" ".rel" ".synctex.gz"
                                      "_flymake.bcf" "_flymake.dvi"
                                      "_flymake.run.xml"
                                      "_flymake.tex" ".fdb_latexmk"
                                      ".fls" ".DS_Store"))
(setq ido-ignore-extensions t)
(setq ido-ignore-buffers (list (rx (or (and bos  " ")
                                       (and bos
                                            (or "*Completions*"
                                                "*Shell Command Output*"
                                                "*vc-diff*")
                                            eos)))))

(add-hook 'ido-make-file-list-hook
          (lambda ()
            (define-key ido-file-dir-completion-map (kbd "SPC") 'self-insert-command)))

(setq ido-decorations (quote ("\n-> "   ""      ; The "brackets" around the
                                                ; entire prospect list
                              "\n "             ; The prospect separator
                              "\n ..."          ; String inserted at end of a
                                                ; truncated list of prospects
                              "["       "]"     ; Brackets around the common
                                                ; match string (that can be
                                                ; completed using [Tab])
                              " [No match]"     ; The string to display when
                                                ; there are no matches
                              " [Matched]"      ; The string to display when
                                                ; there is a unique match (and
                                                ; faces are not being used)
                              " [Not readable]" ; The string to display when
                                                ; the current directory is not
                                                ; readable
                              " [Too big]"      ; The string to display when
                                                ; the current directory
                                                ; is > ido-max-directory-size
                              " [Confirm]"      ; The string to display when
                                                ; creating a new file buffer
                              ; Absent 12th & 13th strings:
                              ; Brackets around the sole remaining completion,
                              ; if they should differ from 5 and 6.
                      )))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)

(require 're-builder)
(setq reb-re-syntax 'string)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'magit)
(global-set-key "\C-x\ g" 'magit-status)

(defun my-reb-copy ()
        "Copy current RE into the kill ring without quotes and single
backslashes for later insertion."
        (interactive)
        (reb-update-regexp)
        (let* ((re (with-output-to-string
                (print (reb-target-binding reb-regexp))))
                (str (substring re 2 (- (length re) 2))))
        (with-temp-buffer
            (insert str)
            (goto-char (point-min))
            (while (search-forward "\\\\" nil t)
                (replace-match "\\" nil t))
                (kill-new (buffer-substring (point-min) (point-max))))
                (message "Regexp copied to kill-ring")))

(defun nolinums ()
    (global-linum-mode 0)
    (global-nlinum-mode 0)
)

(defun kill-auto-fill-mode-hook ()
  "Disables auto-fill-mode when used as a hook"
  (auto-fill-mode -1)
  ; Remove the auto-detect-wrap function from the text-mode-hook if
  ; on Mac OS X (in case you're running Aquamacs)
  (if (eq system-type 'darwin)
      (remove-hook 'text-mode-hook 'auto-detect-wrap)
  )
)

(defun kill-aquamacs-autoface-mode ()
  "Disables Aquamacs's built-in `aquamacs-autoface-mode' when used as a hook."
  (let ((os system-type)
        (modeIsOn (if (eq os 'darwin) aquamacs-autoface-mode nil)))
    (if (eq os 'darwin)
      (if (modeIsOn)
        (aquamacs-autoface-mode)
        (message "Aquamacs Autoface Mode is already disabled.")
      )
      (message "Attempted to disable Aquamacs Autoface Mode, but there's no need; you're not using Aquamacs!")
    )
  )
)

(defun org-babel-reload-file (FILE &optional COMPILE)
  "Tangle and load a specified file, with the current buffer's file as
  default.

  Tangle the Emacs Lisp source code in the indicated Org-mode file
  FILE or the file corresponding to the active buffer if FILE is nil
  and the current buffer corresponds to an existing file. This works
  in precisely the same way as `org-babel-load-file'--calling
  `org-babel-tangle' on FILE and then `load-file' on the output elisp
  file--with the only difference being that this function defaults to
  the current file if no argument is provided."
  (interactive (let*
                 (
                   (insert-default-directory nil)
                   (filename
                     (read-file-name 
                       (concat "File to load" 
                         (if (not (null (buffer-file-name)))
                           (concat " [Default: '" (buffer-file-name) "']: ")
                           ": "
                         )
                       )
                       (file-name-directory (if (not (null (buffer-file-name))) (buffer-file-name) ""))   ; DIR
                       (buffer-file-name) ; DEFAULT-FILENAME
                       t                  ; REQUIRE-MATCH
                       nil                ; PREDICATE
                     )
                   )
                 )
                 (message "The file name is '%s'" filename)
                 (list filename)
               )) 
  (message "Reloading '%s'" FILE)
  (org-babel-load-file FILE COMPILE)
)

(require 'color-theme)
(color-theme-initialize)

;(color-theme-bharadwaj-slate)
(color-theme-charcoal-black)
;(color-theme-classic)
;(color-theme-deep-blue )
;(color-theme-ld-dark)        
;(color-theme-midnight)
;(color-theme-pok-wog)
;(color-theme-resolve)        
;(color-theme-shaman)
;(color-theme-subtle-hacker)

(display-time)

(add-hook 'find-file-hook (lambda () (nlinum-mode 1)))
;(setq linum-format "%4d \u2502 ")
;(set-face-attribute 'fringe nil :background "#333333")
;(set-face-attribute 'linum nil :background "#CCC")

(if (eq system-type 'darwin)
  (set-default-font "-apple-bitstream
    vera sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman"))
(if (eq system-type 'gnu/linux)
  (set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))

(blink-cursor-mode (- (*) (*) (*)))

;; make return key also do indent, globally
; (electric-indent-mode 1)

;; Set tab width to 4
(setq tab-stop-list (number-sequence 4 200 4))

;; Force emacs to only indent with spaces and never tabs
(setq-default indent-tabs-mode nil)

;;
;  Makes M-q indent from cursor to the space prior to the next
;  non-whitespace character on the previous line.
;
;  Example: If the current buffer looks as follows (with the cursor denoted by *)...
;
;          sample text is entertaining to write
;          I completely agree* with you
;
;      Then the result of hitting M-q will be
;
;          sample text is entertaining to write
;          I completely agree          with you
;
;      with the cursor right before the "w" in "with".
(global-set-key (kbd "M-q") 'indent-relative)

(defun electric-indent-mode-remove-newline-from-indent-chars ()
       "Delete newline (?\n) from `electric-indent-chars'."
       (setq electric-indent-chars (delq 10 electric-indent-chars)))
(add-hook 'emacs-lisp-mode-hook #'electric-indent-mode-remove-newline-from-indent-chars)

(org-babel-load-file
  (expand-file-name "~/.emacs.d/lib/latex/latex.org"))

(setq org-directory "~/org")
(setq org-agenda-files '("~/org"))
(setq org-default-notes-file "~/org/inbox.org")

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
    (quote (("t" "todo" entry (file "~/org/inbox.org")
             "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
            ("r" "respond" entry (file "~/org/inbox.org")
             "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
            ("n" "note" entry (file "~/org/inbox.org")
             "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
            ("j" "Journal" entry (file+datetree "~/org/diary.org")
             "* %?\n%U\n" :clock-in t :clock-resume t)
            ("w" "org-protocol" entry (file "~/org/inbox.org")
             "* TODO Review %c\n%U\n" :immediate-finish t)
            ("m" "Meeting" entry (file "~/org/inbox.org")
             "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
            ("p" "Phone call" entry (file "~/org/inbox.org")
             "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
            ("h" "Habit" entry (file "~/org/inbox.org")
             "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

(message "Reminder: You can toggle org-capture mode for easy task
management using \"C-c c\". While org-capture mode is active, use
\"C-c C-c\" followed by one of the letters t, r, n, j, w, m, p,
and h to start capturing a todo, response-needed, note, journal,
org-protocols, logging a meeting, logging a phonecall, and
logging a habit (resp.).")

;; Remove empty LOGBOOK drawers on clock out
(defun bh/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)

(setq org-log-done 'time)

(setq org-babel-default-header-args
  (cons '(:results . "silent")
        (assq-delete-all :results org-babel-default-header-args)))

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on

(setq org-src-fontify-natively t)

;(add-hook 'org-mode-hook 'nolinums)

;; Access the Org Agenda with "C-c a"
;; 
;;     From the Agenda, you can view all todos and other things in org that
;;     have looming deadlines.
(global-set-key "\C-ca" 'org-agenda)

;; Store an org-link to the current location in org-stored-links
;; with "C-c l"
;;
;;     The same link can be inserted elsewhere later from the
;;     org-stored-links variable using "C-c C-l"
(global-set-key "\C-cl" 'org-store-link)

;; Switch to another org buffer with "C-c b"
;;
;;     Switches to the org buffer with a given name.
(global-set-key "\C-cb" 'org-iswitchb)

;; Creates an "el" Easy Template in Org Mode.
;; 
;;     Typing "<el" followed by [TAB] replaces <el with
;;
;;         #+BEGIN_SRC emacs-lisp
;;           [Cursor Here]
;;         #+END_SRC
(add-to-list 'org-structure-template-alist
     '("el" "#+BEGIN_SRC emacs-lisp\n  ?\n#+END_SRC" ""))
