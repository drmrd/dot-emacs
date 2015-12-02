
(sit-for 1)
(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)

(add-hook 'TeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq reftex-label-alist '((nil ?e nil "~\\eqref{%s}" nil nil)))

(setq reftex-default-bibliography
        '("~/workspace/citations/library.bib"))

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'visual-line-mode-hook 'adaptive-wrap-prefix-mode)

(add-hook 'LaTeX-mode-hook
  (lambda ()
    (LaTeX-add-environments
      '("thm" LaTeX-env-label)
      '("lem" LaTeX-env-label)
      '("proof" LaTeX-env-label)
          '("cor" LaTeX-env-label)
          '("rem" LaTeX-env-label)
          '("claim" LaTeX-env-label))))

(remove-hook 'latex-mode-hook 'turn-on-auto-fill)
(remove-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(auto-fill-mode -1)
;(setq-default fill-column 99999)
;(setq fill-column 99999)

(defun fill-sentence ()
  "Fill an individual sentence instead of a paragraph."
  (interactive)
  (save-excursion
    (or (eq (point) (point-max)) (forward-char))
    (forward-sentence -1)
    (indent-relative)
    (let ((beg (point)))
      (forward-sentence)
      (fill-region-as-paragraph beg (point))
    )
  )
)
(global-set-key "\ej" 'fill-sentence)

(defadvice LaTeX-fill-region-as-paragraph (around LaTeX-sentence-filling)
  "Start each sentence on a new line."
  (let ((from (ad-get-arg 0))
        (to-marker (set-marker (make-marker) (ad-get-arg 1)))
        tmp-end)
    (while (< from (marker-position to-marker))
      (forward-sentence)
      ;; might have gone beyond to-marker --- use whichever is smaller:
      (ad-set-arg 1 (setq tmp-end (min (point) (marker-position to-marker))))
      ad-do-it
      (ad-set-arg 0 (setq from (point)))
      (unless (or
               (bolp)
               (looking-at "\\s *$"))
        (LaTeX-newline)))
    (set-marker to-marker nil)))
(ad-activate 'LaTeX-fill-region-as-paragraph)

(setq-default LaTeX-default-offset 4)

;;
;; Customizing general indentation commands
;;
; Set indentation of current line by 4n where n is the sum of the
; number of unmatched instances of "\begin{<environment>}" and "{":
(setq-default LaTeX-indent-level 4)
(setq-default TeX-brace-indent-level 4)
; Add 4m to indentation level of current line where m is the number
; currently-unmatched, enumerate-like environments at our current
; location (and the cursor is on a line beginning with "\item" or
; something "\item-like":
(setq-default LaTeX-item-indent 4)

(defadvice LaTeX-indent-line (after LaTeX-indent-line-in-sections-advice activate)
  "A function designed to advise the indent command to indent within
   parts, chapters, sections, subsections, etc." 
  (interactive)
  (let (
         (section-list ; Make a copy of LaTeX-section-headers
           (copy-list LaTeX-section-list)
         )
         (prevline ; Set equal to the previous line as a string
           (save-excursion 
             (forward-line -1)
             (thing-at-point 'line t)
           )
         )
       ) 
       ; If the previous line is the start of a section, indent
       ; the current line by an additional LaTeX-default-offset
       ; spaces.
       (while section-list 
         (if (string-match (concat "\s-+\\" (caar section-list) ".*\s-") prevline)
           (message (concat "prevline matches regexp with section key " (caar section-list)))
           (progn
             ; Move to first non-whitespace character in line
             (back-to-indentation)
             ; Insert LaTeX-default-offset many spaces
             (indent-to 0 LaTeX-default-offset)
             (setq section-list nil)
           )
         )
         (setq section-list (cdr section-list))
       )
  )
)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook 
    (lambda ()
        (push
            '("latexmk" "latexmk -outdir=/tmp %t -pdf %s" TeX-run-TeX nil t
                :help "Run latexmk on file")
            TeX-command-list
        )
    )
)
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

(setq tex-dvi-print-command "dvips")
(setq tex-dvi-view-command "xdvi")

;(load "~/workspace/elisp/emacs_latex_reftex")

;; AucTeX
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
