(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq evil-want-keybinding nil)
;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package company
  :ensure
  :custom
  (company-idle-delay 0) ;; how long to wait until popup
  :bind
  (:map company-active-map
        ("C-n". company-select-next)
        ("C-p". company-select-previous)
        ("M-<". company-select-first)
        ("M->". company-select-last)))

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(unless (package-installed-p 'nord-theme)
  (package-install 'nord-theme))

(unless (package-installed-p 'dracula-theme)
  (package-install 'dracula-theme))

(unless (package-installed-p 'exwm)
  (package-install 'exwm))
(require 'exwm)
(require 'exwm-config)
;;(exwm-config-default)

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode 1))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package lsp-mode
  :hook (
         (python-mode . lsp)
         )
  :commands lsp)

(use-package company)

(unless (package-installed-p 'irony)
  (package-install 'irony))
(require 'irony)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(use-package swift-mode
  :hook (swift-mode . (lambda () (lsp))))
(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))

(use-package vterm)

(use-package xwwp-follow-link-ivy)
  (use-package xwwp
    :custom
    (xwwp-follow-link-completion-system 'ivy)
    :bind (:map xwidget-webkit-mode-map
                ("v" . xwwp-follow-link)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package lsp-jedi
  :ensure t
  :config
  (with-eval-after-load "lsp-mode"
    (add-to-list 'lsp-disabled-clients 'pyls)
    (add-to-list 'lsp-enabled-clients 'jedi)))

(setq inhibit-startup-message t) ;; Disable the startup message and start in a scratch buffer.

    ;; Setup the font.
	(add-to-list 'default-frame-alist '(font . "JetBrains Mono 20"))
    (scroll-bar-mode -1) ;; Disable the scrollbar.
    (tooltip-mode -1) ;; Disable the tooltips.
    (tool-bar-mode -1) ;; Disable the toolbar.
    (menu-bar-mode -1) ;; Disable the menubar.
    (setq-default mode-line-format nil) ;; Hide the mode line on the bottom
    (add-hook 'window-setup-hook 'toggle-frame-fullscreen t) ;; Start in fullscreen mode.
    (setq visible-bell nil) ;; Disable the macOS Error Sound and flash instead.
(setq ring-bell-function 'ignore)

(set-frame-parameter (selected-frame) 'alpha '(75 75))
(add-to-list 'default-frame-alist '(alpha 75 75))

(load-theme 'dracula t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

(setq-default tab-width 4)

(setq split-width-threshold 0)
(setq split-height-threshold nil)

(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-saves/" t)))

(add-to-list 'display-buffer-alist (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

(defun comment-or-uncomment-region-or-line ()
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))

;;  (use-package rust-mode)
;;  (add-hook 'rust-mode-hook
;;            (rust-run-clippy)
;;            (lambda () (setq indent-tabs-mode nil)))
;;  (setq rust-format-on-save t)
;;  (use-package racer)
;;  (setq racer-eldoc-timeout 0.6)
;;  (setq racer-command-timeout 0.6)
;;  (add-hook 'rust-mode-hook #'racer-mode)
;;  (add-hook 'racer-mode-hook #'eldoc-mode)
;;  (add-hook 'racer-mode-hook #'company-mode)
;;
;;  (require 'rust-mode)
;;  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;;  (setq company-tooltip-align-annotations t)
;;  (defun racer-company-backend (command &optional arg &rest ignored)
;;    "`company-mode' completion back-end for racer.
;;          Provide completion info according to COMMAND and ARG.  IGNORED, not used."
;;    (interactive (list 'interactive))
;;    (cl-case command
;;      (interactive (company-begin-backend 'racer-company-backend))
;;      (prefix (and (derived-mode-p 'rust-mode)
;;                   (not (company-in-string-or-comment))
;;                   (or (racer--get-prefix) 'stop)))
;;      (candidates (cons :async (lambda (callback)
;;                                 (funcall callback (racer-complete)))))
;;      (annotation (racer-complete--annotation arg))
;;      (location (racer-complete--location arg))
;;      (meta (racer-complete--docsig arg))
;;      (doc-buffer (racer--describe arg))))

(setq display-line-numbers-type 'relative)

(defun webkit-browse-url (url &rest ignore)
  (interactive)
  (xwidget-webkit-browse-url url))
(setq browse-url-browser-function 'webkit-browse-url)

(use-package undo-tree
  :config
  (turn-on-undo-tree-mode))
(global-undo-tree-mode)    
(evil-set-undo-system 'undo-tree)

(setq evil-ex-search-case 'insensitive)

(defun org-mode-setup ()
  (org-global-cycle)
  (org-indent-mode)
  (setq evil-auto-indent 0))

(use-package org
  :hook (org-mode . org-mode-setup)
  :config (setq org-ellipsis " ▼"))



(defun open-bookmark ()
  (interactive)
  (setq bookmark (read-string "Bookmark: "))
  ;; Get the last line of output.
  (setq url (car (last (butlast (split-string (shell-command-to-string (concat "cd ~/; python3 ~/.emacs.d/decodeBookmarks.py " bookmark)) "\n")))))
  (browse-url url))

(global-set-key (kbd "M-o") #'counsel-M-x)

(global-set-key (kbd "M-f") #'find-file)

(defun open-terminal ()
  (interactive)
  (async-shell-command "urxvt"))
(global-set-key (kbd "M-t") 'open-terminal)

(global-set-key (kbd "M-r") #'counsel-recentf)

(defun create-new-buffer ()
  (interactive) (switch-to-buffer "new"))
(global-set-key (kbd "M-n") #'create-new-buffer)

(global-set-key (kbd "M-/") #'comment-or-uncomment-region-or-line)

(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "M-p") 'indent-buffer)

(defun search-startpage ()
  (interactive)
  (setq search (read-string "Enter your search:"))
  (browse-url (concat "https://www.startpage.com/rvd/search?query=" search)))
(global-set-key (kbd "C-g") 'search-startpage)

(global-set-key (kbd "M-S-k") 'kill-this-buffer)

(global-set-key (kbd "M-b") 'buffer-menu)

(global-set-key (kbd "M-e") 'open-bookmark)

(global-set-key (kbd "M-s") 'split-window-right)

(global-set-key (kbd "C-l") 'evil-window-right)

(global-set-key (kbd "C-h") 'evil-window-left)

(setq exwm-input-prefix-keys
      '(?\M-o
        ?\M-:))
(setq exwm-input-global-keys
      `(
        ([?\s-f] . find-file)
        ([?\s-o] . counsel-M-x)))
