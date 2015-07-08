
(setq user-mail-address "moore@math.osu.edu")

(require 'package)
(package-initialize)
(setq package-archives
'(("ELPA" . "http://tromey.com/elpa/")
  ("gnu" . "http://elpa.gnu.org/packages/")
  ("melpa" . "http://melpa.milkbox.net/packages/")
  ("marmalade" . "http://marmalade-repo.org/packages/")))

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/workspace/elisp")
(add-to-list 'load-path "~/.emacs.d/lib")

(set-register ?e (cons 'file "~/.emacs.d/init.org"))
(set-register ?l (cons 'file "~/.emacs.d/lib/latex.org"))
(set-register ?p (cons 'file "~/Library/Preferences/Aquamacs Emacs/Preferences.el"))

(setq default-directory "~/workspace/")

(setq default-major-mode 'text-mode)
(remove-hook 'text-mode-hook 'auto-fill-mode)

(setq require-final-newline t)

(ido-mode t)

(setq ido-everywhere            t
      ido-enable-prefix         nil
      ido-enable-flex-matching  t
      ido-auto-merge-work-directories-length nil
      ;;ido-use-filename-at-point t
      ido-max-prospects         10
      ido-create-new-buffer     'always
      ;; ido-use-virtual-buffers   t
      ;; ido-handle-duplicate-virtual-buffers 2
      ido-default-buffer-method 'selected-window
      ido-default-file-method   'selected-window)

(setq ido-file-extensions-order     '(".cc" ".h" ".tex" ".sh" ".org"
                                    ".el" ".tex" ".png"))

(setq completion-ignored-extensions '(".o" ".elc" "~" ".bin" ".bak"
                                      ".obj" ".map" ".a" ".so"
                                      ".mod" ".aux" ".out" ".pyg"
                                      "_flymake.tex" ".fdb_latexmk"
                                      ".log" ".fls"))
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

(setq ido-decorations (quote ("\n-> " "" "\n " "\n ..." "[" "]" "
  [No match]" " [Matched]" " [Not readable]" " [Too big]" "
  [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)

(require 're-builder)
(setq reb-re-syntax 'string)

(require 'color-theme)
(color-theme-initialize)

(load-theme 'cyberpunk t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(display-time)

(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

(global-hl-line-mode 1); Highlight current row
(set-face-background hl-line-face "#0e1717"); Same color as greyness in gtk

(set-default-font "-apple-bitstream vera sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman")

(blink-cursor-mode (- (*) (*) (*)))

;;      
;  global_indentation
;
;      Contains all global customizations pertaining to indentation,
;      whitespace, and fill commands.
(load-library "global_indentation") 

;; Set tab width to 4
(setq tab-stop-list (number-sequence 4 200 4))

;; Force emacs to only indent with spaces and never tabs
(setq-default indent-tabs-mode nil)

(defun electric-indent-mode-configure ()
       "Delete newline (?\n) from `electric-indent-chars'."
       (setq electric-indent-chars (delq 10 electric-indent-chars)))
(add-hook 'emacs-lisp-mode-hook #'electric-indent-mode-configure)

;(org-babel-load-file
;  (expand-file-name "~/.emacs.d/lib/latex.org"))

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on

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
