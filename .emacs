(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      clojure-mode
                      slime
                      slime-repl
                      auto-complete
                      ac-slime)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq visible-bell nil)

(require 'slime)
(require 'auto-complete)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(add-hook 'clojure-mode-hook 'auto-complete-mode)
(add-hook 'slime-repl-mode-hook 'auto-complete-mode)
