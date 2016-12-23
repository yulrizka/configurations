(defun icas-go ()
  (interactive)
  (ido-find-file-in-dir "~/dev/ecg-icas/icas/src/go/src/cas"))

(defun icas-java ()
  (interactive)
  (ido-find-file-in-dir "~/dev/ecg-icas/icas/src/java"))

(defun icas-service ()
  (interactive)
  (ido-find-file-in-dir "~/dev/ecg-icas/icas/src/go/src/cas/svc"))

(defun icas-lib ()
  (interactive)
  (ido-find-file-in-dir "~/dev/ecg-icas/icas/src/go/src/cas/lib"))

(provide `icas)
