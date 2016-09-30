(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
	       (nnimap-server-port "imaps")
               (nnimap-stream ssl)))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "gmail"
                      (nnimap-stream ssl)
                      (nnimap-address "imap.gmail.com")
                      (nnimap-server-port 993)
                      (nnir-search-engine imap)))

(setq smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; Replace [ and ] with _ in ADAPT file names
(setq nnheader-file-name-translation-alist '((?[ . ?_) (?] . ?_)) )
