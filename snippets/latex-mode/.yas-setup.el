(defun drmrd/show-first-if-second-is-non-empty(first second)
  "Return `FIRST' if `SECOND' is not an empty string and an empty string otherwise."
  (if (not (string-empty-p second)) first ""))
