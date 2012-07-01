(setq load-path (cons "~/.emacs.d/elisp" load-path))

;http://d.hatena.ne.jp/tomoya/20090121/1232536106
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp")
;M-x install-elisp
;M-x install-elisp-from-emacswiki
;M-x dired-install-elisp-from-emacswiki

(show-paren-mode t)

(setq scheme-program-name "gosh")
(require 'cmuscheme)

(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(define-key global-map
  "\C-cS" 'scheme-other-window)

(setq make-backup-files nil)

;key-bind
