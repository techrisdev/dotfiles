;; Load the configuration file.
(org-babel-load-file
  (expand-file-name
	"config.org"
	user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(xwwp-follow-link-ivy xwwp racer exec-path-from-shell toml-mode flycheck lsp-rust lsp-ui rustic yasnippet lsp-jedi jedi org-bullets language-id format-all all-the-icons-ivy-rich undo-tree irony irony-mode which-key rainbow-delimiters evil-collection lsp-sourcekit vterm lsp-mode swift-mode company-org-block counsel ivy-rich ivy evil))
 '(recentf-mode t)
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
