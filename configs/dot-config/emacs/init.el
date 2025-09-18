;; init.el --- My Emacs Configuration  -*- lexical-binding: t; -*-

;; bootstrap straight package manager
(defvar bootstrap-version)
(let ((bootstrap-file
        (expand-file-name
          "straight/repos/straight.el/bootstrap.el"
          (or (bound-and-true-p straight-base-dir)
              user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t) ;; set use-package to use by straight by default

;; Keybindings
(use-package evil
  :init
  (setq evil-want-integration t)   ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-echo-state nil)       ;; don't show mode at bottom, shown in modeline
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  :config
  (evil-mode)
  (evil-set-leader '(normal treemacs dashboard emacs) " "))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(global-set-key (kbd "<leader> b p") 'previous-buffer)
(global-set-key (kbd "<leader> b n") 'next-buffer)
(global-set-key (kbd "<leader> b k") 'kill-current-buffer)
(global-set-key (kbd "<leader> e") 'elisp-eval-region-or-buffer)
(global-set-key (kbd "<leader> .") 'find-file)

;; LSP support
(use-package eglot
  :hook (prog-mode . eglot-ensure)
  :bind (:map eglot-mode-map
	      ("<leader> l f" . eglot-format)
              ("<leader> l a" . eglot-code-actions)
              ("<leader> l r" . eglot-rename)
              ("<leader> l o" . eglot-code-actions-organize-imports))
  :custom
  (lsp-nix-nil-formatter "alejandra")
  :config
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		 '(nix-ts-mode . "nil"))))

(use-package flycheck
  :after (eglot)
  :init (global-flycheck-mode))

(use-package cape
  :bind ("<leader> c" . cape-prefix-map)
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

;; UI configuration
(set-frame-font "Inconsolata Nerd Font 14" nil t)
(add-to-list 'default-frame-alist
	     '(font . "Inconsolata Nerd Font 14"))

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-nord t)
  (doom-themes-org-config))

(use-package highlight-indent-guides
  :custom
  (highlight-indent-guides-method 'fill)
  (highlight-indent-guides-auto-enabled nil)
  :hook (prog-mode-hook . highlight-indent-guides-mode))

(menu-bar-mode -1)           ;; Disable the menu bar
(scroll-bar-mode -1)         ;; Disable the scroll bar
(tool-bar-mode -1)           ;; Disable the tool bar
(global-hl-line-mode 1)
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package doom-modeline
             :hook (after-init . doom-modeline-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)
  (setq dashboard-items '((recents  . 5)
			  (projects . 5)
			  (agenda   . 5)))
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerdicons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name))))
;; Utils
;; set backup-files directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

(setq vc-follow-symlinks nil)

(use-package eldoc
  :init (global-eldoc-mode))

;; file tree
(use-package treemacs
  :bind ("<leader> t" . treemacs))

(use-package treemacs-evil
  :after (treemacs evil))

;; editor tools
(require 'recentf)
(recentf-mode t)
(setq recentf-max-saved-items 20)
(setq enable-local-eval t)

(electric-pair-mode 1) ;; Turns on automatic parens pairing
(setq indent-tabs-mode nil) ;; use spaces instead of tabs
(setq-default electric-indent-inhibit t)
(setq backward-delete-char-untabify-method 'hungry)
(setq-default evil-shift-width 4)

(use-package indent-bars
  :custom
  (indent-bars-treesit-support t)
  :hook (prog-mode . indent-bars-mode))

(use-package outline-indent
  :commands outline-indent-minor-mode
  :custom
  (outline-indent-ellipsis " ▼")
  :hook (prog-mode . outline-indent-minor-mode))

;; show hex values as colors (ex. #ffffff)
(use-package rainbow-mode
  :diminish
  :hook '((org-mode prog-mode) . rainbow-mode))

;; color match parenthesis for easy visual viewing
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :config (which-key-mode 1))


;; Minibuffer utils:
(use-package vertico
  :custom
  (vertico-cycle t)
  (vertico-resize nil)
  :config (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :init (marginalia-mode))

(use-package consult
  :bind
  ("<leader> b i" . consult-buffer)
  ("<leader> r" . consult-recent-file))

(use-package corfu
  :hook (prog-mode . corfu-mode))

;; settings for corfu
(setq tab-always-indent 'complete)
(setq text-mode-ispell-word-completion nil)
(setq read-extended-command-predicate #'command-completion-default-include-p)
;; Modes
(use-package nix-mode
  :mode "\\.nix\\'")

;; treesitter modes
(use-package treesit-auto
  :custom (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(setq nix-ts-recipe
      (make-treesit-auto-recipe
       :lang 'nix
       :ts-mode 'nix-ts-mode
       :remap '(nix-mode)
       :url "https://github.com/nix-community/tree-sitter-nix"
       :revision "master"
       :source-dir "src"
       :ext "\\.nix\\'"))

(add-to-list 'treesit-auto-recipe-list nix-ts-recipe)

(use-package geiser
  :config
  (use-package geiser-guile)
  (use-package geiser-mit)
  (use-package geiser-racket))

(provide 'init)
;;; init.el ends here
