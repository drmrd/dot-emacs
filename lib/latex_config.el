
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

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

(remove-hook 'latex-mode-hook #'turn-on-auto-fill)
(remove-hook 'LaTeX-mode-hook #'turn-on-auto-fill)
(auto-fill-mode -1)
;(setq-default fill-column 99999)
;(setq fill-column 99999)

(defun fill-sentence ()
(interactive)
(save-excursion
  (or (eq (point) (point-max)) (forward-char))
  (forward-sentence -1)
  (indent-relative)
  (let ((beg (point)))
    (forward-sentence)
    (fill-region-as-paragraph beg (point)))))
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

(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook (lambda ()
(push
  '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
    :help "Run latexmk on file")
  TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

(setq tex-dvi-print-command "dvips")
(setq tex-dvi-view-command "xdvi")

;(load "~/workspace/elisp/emacs_latex_reftex")

;; AucTeX
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)


;;;
;;; SPELL CHECKING
;;;

;; Enable spell-checking on-the-fly

;; Disabled due to causing errors
;(setq ispell-program-name "aspell")
;(setq ispell-dictionary "english")

;; Disabled due to CPU usage and never seeing spelling error highlights
;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

;; Set default indentation level to 4 spaces
