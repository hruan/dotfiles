; Use utf-8
(set-terminal-coding-system   'utf-8)
(set-keyboard-coding-system   'utf-8)
(prefer-coding-system         'utf-8)
(setq slime-net-coding-system 'utf-8-unix)

;; OS X meta key fix
(when (eq system-type 'darwin)
  (setq mac-option-modifier  'none
	mac-command-modifier 'meta
	default-input-method "MacOSX")
  (global-set-key [kp-delete] 'delete-char))

(require 'package)
(setq load-prefer-newer t
      package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-verbose t
      use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

(setq inferior-lisp-program "/usr/local/bin/ros run")

(use-package lispy
  :ensure t
  :diminish lispy-mode
  :init
  (dolist (hook '(emacs-lisp-mode-hook
		  lisp-mode-hook
		  clojure-mode-hook
		  clojurescript-mode-hook))
    (add-hook hook #'lispy-mode)))

(use-package clojure-mode
  :ensure t)

(use-package slime
  :ensure t)

(use-package linum-relative
  :ensure t
  :init
  (setq linum-relative-current-symbol "")
  :config
  (linum-relative-global-mode))

;; Emulate the superior editor
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t
	evil-want-fine-undo 'no
	evil-cross-lines nil)
  :config
  (evil-mode))

(use-package evil-anzu
  :ensure t)

(use-package evil-commentary
  :ensure t
  :diminish evil-commentary-mode
  :config (evil-commentary-mode))

(use-package evil-surround
  :ensure t
  :config (global-evil-surround-mode))

(use-package lispyville
  :ensure t
  :diminish lispyville-mode
  :init
  (setq lispyville-motions-put-into-special nil)
  (add-hook 'lispy-mode-hook #'lispyville-mode)
  :config
  (lispyville-set-key-theme '(operators
			      additional
			      additional-movement
			      slurp/barf-cp)))

(use-package evil-lion
  :ensure t
  :config
  (evil-lion-mode))

(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t)

(setq calendar-week-start-day 1)

;; disable bell
(setq ring-bell-function 'ignore
      visible-bell t)

;; Disable backup files
(setq make-backup-files nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode 0)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(when (window-system)
  (cond ((eq system-type 'darwin)
	 (set-default-font "Fira Code-12"))
	((eq system-type 'windows-nt)
	 (set-default-font "Consolas-10"))
	(t
	 (set-default-font "Courier-12"))))

(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
	       (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
	       (36 . ".\\(?:>\\)")
	       (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)"))))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (clojure-mode evil-lion lispyscript-mode lispyville evil-anzu evil-surround evil-lispy lispy evil-paredit paredit ac-slime slime use-package swiper rainbow-delimiters linum-relative iedit evil color-theme-sanityinc-tomorrow ac-geiser ac-cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
