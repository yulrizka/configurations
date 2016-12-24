(require 'helm-files)

(defun icas-go ()
  (interactive)
  (let ((default-directory "~/dev/ecg-icas/icas/src/go/"))
    (helm-find-files nil)))

(defun icas-java ()
  (interactive)
  (let ((default-directory "~/dev/ecg-icas/icas/src/java/"))
    (helm-find-files nil)))

(defun icas-service ()
  (interactive)
  (let ((default-directory "~/dev/ecg-icas/icas/src/go/src/cas/svc/"))
    (helm-find-files nil)))

(defun icas-lib ()
  (interactive)
  (let ((default-directory "~/dev/ecg-icas/icas/src/go/src/cas/lib/"))
    (helm-find-files nil)))

(provide `icas)
