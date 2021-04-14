; https://github.com/raxod502/straight.el#getting-started
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; https://github.com/raxod502/straight.el#integration-with-use-package
(straight-use-package 'use-package)

; https://github.com/emacs-evil/evil
(use-package evil
  :straight (evil
              :type git
              :host github
              :repo "emacs-evil/evil")
  :init
  ; https://github.com/emacs-evil/evil-collection#installation
  ; pre-set some evil vars prior to package load
  (setq evil-want-keybinding nil)
  :config
  (evil-mode t))

; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :after evil
  :ensure t
  :straight (evil-collection
	     :type git
	     :host github
	     :repo "emacs-evil/evil-collection")
  :config
  (evil-collection-init))

; https://github.com/hlissner/emacs-doom-themes#manually
(use-package doom-themes
  :straight (doom-themes
              :type git
              :host github
              :repo "hlissner/emacs-doom-themes")
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

; https://orgmode.org/manual/Structure-Templates.html
(load-library "org-tempo")
