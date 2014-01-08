;;Package.el customization
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; install packages
(defvar my-packages '(
  auto-complete
  clojure-mode
  clojure-test-mode
  cider
  ac-nrepl
  paredit
  rainbow-delimiters
))

(dolist (p my-packages)
  (when (not (package-installed-p p))
  (package-refresh-contents)
    (package-install p)))
;; The following line can be removed after first install to speed up startup
(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(cursor-type 'bar t)
 '(column-number-mode t)
 '(delete-selection-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(tool-bar-mode nil)
 '(xterm-mouse-mode 1))

;; rainbow delimiters
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; paredit
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(global-set-key [f7] 'paredit-mode)

;; clojure-mode
(global-set-key [f9] 'cider-jack-in)

;; cider
(require 'cider)
(setq nrepl-hide-special-buffers t)

;; Auto complete
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-completing-map "\M-/" 'ac-stop)

;; ac-nrepl
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'nrepl-mode))
