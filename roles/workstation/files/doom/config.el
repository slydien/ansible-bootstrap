(setq doom-theme 'doom-ayu-mirage)

(setq doom-font (font-spec :family "Fira Mono" :size 22 :weight 'Medium)
      doom-variable-pitch-font (font-spec :family "Fira Sans Book" :size 22)
      doom-big-font (font-spec :family "Fira Mono" :size 28))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq user-full-name "Lydien SANDANASAMY"
      user-mail-address "s.lydien@icloud.com")

;; (defconst doom-frame-transparency 93)
;; (set-frame-parameter (selected-frame) 'alpha doom-frame-transparency)
;; (add-to-list 'default-frame-alist `(alpha . ,doom-frame-transparency))
;; (defun dwc-smart-transparent-frame ()
;;   (set-frame-parameter
;;     (selected-frame)
;;     'alpha (if (frame-parameter (selected-frame) 'fullscreen)
;;               100
;;              doom-frame-transparency)))

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(defun lydien/org-mode-setup ()
  (org-indent-mode)
  (visual-line-mode 1)
  (hide-mode-line-mode 1)
  (display-line-numbers-mode 0))

(defun lydien/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(add-hook! org-mode
      (lydien/org-mode-setup)
      (lydien/org-mode-visual-fill))

(setq org-directory "~/Documents/org/"
      org-archive-location (concat org-directory ".archive/%s::")
      org-roam-directory (concat org-directory "notes/")
      org-roam-db-location (concat org-roam-directory ".org-roam.db")
      org-journal-encrypt-journal t
      org-journal-file-format "%d%m%Y.org"
      org-startup-folded 'overview
      org-ellipsis " ⤵" )

(setq org-roam-capture-templates
      '(("d" "default" plain "%?"
       :target (file+head "%<%d-%m-%Y_%HH%M>-${slug}.org"
                          "#+title: ${title}\n")
       :unnarrowed t)))

(setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(map! "C-c C-s" 'counsel-tramp)
(setq explicit-shell-file-name "/bin/bash")
