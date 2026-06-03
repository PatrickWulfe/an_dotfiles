;;; my-doom-horizon-2-theme.el --- An original retro-futuristic theme inspired by Horizon: Legacy -*- lexical-binding: t; -*-

;; Copyright (C) 2018-2020 Ian Y.E. Pan

;; Author: Ian Y.E. Pan
;; URL: https://github.com/ianpan870102/my-doom-horizon-2-emacs-theme
;; Version: 2.0.0

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:
;; An original theme for Emacs 24+ inspired by the look and feel of Horizon: Legacy,
;; with further inspirations drawn from Base16-Black-Metal, Grayscale and City Lights.

;;; Code:

(defgroup my-doom-horizon-2-theme nil
  "Options for my-doom-horizon-2 theme."
  :group 'faces)

(defcustom my-doom-horizon-2-theme-dark-fg-bright-comments nil
  "If non-nil, default foreground will be dimmed and comments will be boosted to be brighter than the normal foreground."
  :group 'my-doom-horizon-2-theme
  :type 'boolean)

(defcustom my-doom-horizon-2-theme-vivid-cursor nil
  "If non-nil, the cursor will be bright golden, making it easier to spot."
  :group 'my-doom-horizon-2-theme
  :type 'boolean)

(defcustom my-doom-horizon-2-theme-softer-bg nil
  "If non-nil, the contrast of the background will be slightly lower, instead of being pure black."
  :group 'my-doom-horizon-2-theme
  :type 'boolean)

(deftheme my-doom-horizon-2)
(let ((class '((class color) (min-colors 89)))
      (fg0               "#d5d8da")
      (fg1               (if my-doom-horizon-2-theme-dark-fg-bright-comments "#fdf0ed" "#d5d8da")) ; default fg
      (fg2               "#f43e5c")
      (fg3               "#fac29a")
      (fg4               "#f09483")
      (bg0               "#16161c")
      (bg1               (if my-doom-horizon-2-theme-softer-bg "#16161c" "#1c1e26")) ; default bg
      (bg2               (if my-doom-horizon-2-theme-softer-bg "#232530" "#2e303e"))
      (bg3               "#232530")
      (bg4               "#2e303e")
      (hl-line           "#2e303e") ; hl-line
      (bg-hl             "#232530") ; region, selection
      (vc-r              "#f43e5c")
      (vc-g              "#27d796")
      (vc-b              "#21bfc2")
      (key2              "#9BBDD6")
      (key3              "#AAAAAA")
      (accent            "#6c6f93")
      (numeric           "#25b2bc")
      (mode-line-bg      "#1c1e26")
      (mode-line-bg-dark "#16161c")
      (line-num          "#6c6f93")
      (cursor            (if my-doom-horizon-2-theme-vivid-cursor "#09f7a0" "#21bfc2"))
      (builtin           "#e9436f")
      (keyword           "#b877db")
      (const             "#fac29a")
      (comment           (if my-doom-horizon-2-theme-dark-fg-bright-comments "#21bfc2" "#6c6f93"))
      (doc               "#6c6f93")
      (type              "#f09383")
      (str               "#27d796")
      (func              "#25b2bc")
      (var               (if my-doom-horizon-2-theme-dark-fg-bright-comments "#21bfc2" "#6c6f93")) ; var = fg
      (warning           "#f43e5c")

      ;; standardized palette
      (horizon-yellow         "#fab28e")
      (horizon-bluegreen      "#59e3e3")
      (horizon-magenta        "#6c6f93")
      (horizon-orange         "#f09383")
      (horizon-red            "#f43e5c")
      (horizon-blue           "#21bfc2")
      (horizon-green          "#27d796")
      (horizon-lightred       "#e95379")
      (horizon-lightblue      "#59e3e3")
      (horizon-lightgreen     "#09f7a0")
      (horizon-red-bg         "#e9436f")
      (horizon-blue-bg        "#1eaeae")
      (horizon-green-bg       "#1eb980")
      (horizon-red-bghl       "#462026")
      (horizon-blue-bghl      "#141E4F")
      (horizon-green-bghl     "#13454E"))

  (custom-theme-set-faces
   'my-doom-horizon-2
   `(default                                  ((,class (:background ,bg1 :foreground ,fg1))))

   ;;;;; Font lock basics
   `(font-lock-builtin-face                   ((,class (:foreground ,builtin))))
   `(font-lock-comment-face                   ((,class (:foreground ,comment :italic t))))
   `(font-lock-negation-char-face             ((,class (:foreground ,const))))
   `(font-lock-reference-face                 ((,class (:foreground ,const))))
   `(font-lock-constant-face                  ((,class (:foreground ,const))))
   `(font-lock-doc-face                       ((,class (:foreground ,doc))))
   `(font-lock-function-name-face             ((,class (:foreground ,func :bold nil))))
   `(font-lock-keyword-face                   ((,class (:bold nil :foreground ,keyword))))
   `(font-lock-string-face                    ((,class (:foreground ,str))))
   `(font-lock-type-face                      ((,class (:foreground ,type ))))
   `(font-lock-variable-name-face             ((,class (:foreground ,var))))
   `(font-lock-warning-face                   ((,class (:foreground ,warning :background ,bg2))))

   ;;;;; More built-in UI
   `(region                                   ((,class (:background ,bg-hl :distant-foreground ,fg0 :extend nil))))
   `(highlight                                ((,class (:foreground ,bg3 :background ,fg3))))
   `(hl-line                                  ((,class (:background ,hl-line))))
   `(fringe                                   ((,class (:background ,bg1 :foreground ,fg4))))
   `(cursor                                   ((,class (:background ,cursor))))
   `(show-paren-match-face                    ((,class (:background ,warning))))
   `(show-paren-match                         ((t (:foreground ,accent :background ,bg4 :bold t))))
   `(show-paren-mismatch                      ((t (:background ,warning))))
   `(isearch                                  ((,class (:bold nil :foreground ,accent :background ,bg4))))
   `(vertical-border                          ((,class (:foreground ,fg4))))
   `(minibuffer-prompt                        ((,class (:foreground ,horizon-bluegreen :weight normal))))
   `(default-italic                           ((,class (:italic t))))
   `(link                                     ((,class (:foreground ,const :underline t))))
   `(error                                    ((,class (:foreground ,horizon-lightred))))
   `(warning                                  ((,class (:foreground ,horizon-yellow))))
   `(success                                  ((,class (:foreground ,horizon-bluegreen))))
   `(dired-directory                          ((t (:inherit font-lock-keyword-face))))
   `(line-number                              ((,class (:foreground ,line-num :background nil))))
   `(line-number-current-line                 ((,class (:foreground ,fg1 :background nil))))
   `(trailing-whitespace                      ((,class :foreground nil :background ,warning)))
   `(lazy-highlight                           ((,class (:foreground ,fg2 :background ,bg3))))

   ;;;;; which-func
   `(which-func                               ((t (:foreground ,horizon-orange))))

   ;;;;; mode-line tweaks
   `(mode-line                                ((,class (:bold nil :foreground ,fg4 :background ,mode-line-bg))))
   `(mode-line-inactive                       ((,class (:bold nil :foreground ,fg0 :background ,mode-line-bg-dark))))
   `(mode-line-buffer-id                      ((,class (:bold nil :foreground ,fg4 :background nil))))
   `(mode-line-highlight                      ((,class (:foreground ,keyword :box nil :weight normal))))
   `(mode-line-emphasis                       ((,class (:foreground ,fg1))))

   ;;;;; Company
   `(company-preview-common                   ((t (:foreground unspecified :background ,bg2))))
   `(company-scrollbar-bg                     ((t (:background ,bg2))))
   `(company-scrollbar-fg                     ((t (:background ,bg3))))
   `(company-tooltip                          ((t (:inherit default :background ,bg2))))
   `(company-tooltip-common                   ((t (:foreground ,horizon-blue :bold t))))
   `(company-tooltip-selection                ((t (:background ,bg-hl))))
   `(company-tooltip-annotation               ((t (:foreground ,doc)))) ; parameter hints etc.
   `(company-template-field                   ((t (:foreground ,fg1 :background ,bg-hl))))

   ;;;;; Org mode
   `(org-document-title                       ((,class (:foreground ,type :height 1.2 :bold t))))
   `(org-level-1                              ((,class (:bold nil :foreground ,horizon-bluegreen :height 1.1))))
   `(org-level-2                              ((,class (:bold nil :foreground ,horizon-yellow))))
   `(org-level-3                              ((,class (:bold nil :foreground ,horizon-blue))))
   `(org-level-4                              ((,class (:bold nil :foreground ,horizon-bluegreen))))
   `(org-code                                 ((,class (:foreground ,fg2))))
   `(org-hide                                 ((,class (:foreground ,fg4))))
   `(org-date                                 ((,class (:underline t :foreground ,var) )))
   `(org-footnote                             ((,class (:underline t :foreground ,fg4))))
   `(org-link                                 ((,class (:underline t :foreground ,type ))))
   `(org-special-keyword                      ((,class (:foreground ,horizon-green))))
   `(org-block                                ((,class (:foreground ,fg2 :background ,bg0 :extend t))))
   `(org-quote                                ((,class (:inherit org-block :slant italic))))
   `(org-verse                                ((,class (:inherit org-block :slant italic))))
   `(org-todo                                 ((,class (:box (:line-width 1 :color ,horizon-lightred)
                                                        :foreground ,horizon-lightred))))
   `(org-done                                 ((,class (:box (:line-width 1 :color ,horizon-lightgreen)
                                                        :foreground ,horizon-lightgreen))))
   `(org-warning                              ((,class (:underline t :foreground ,warning))))
   `(org-agenda-structure                     ((,class (:weight normal :foreground ,fg3 :box (:color ,fg4) :background ,bg3))))
   `(org-agenda-date                          ((,class (:foreground ,var :height 1.1 ))))
   `(org-agenda-date-weekend                  ((,class (:weight normal :foreground ,fg4))))
   `(org-agenda-date-today                    ((,class (:weight normal :foreground ,keyword :height 1.2))))
   `(org-agenda-done                          ((,class (:foreground ,bg4))))
   `(org-scheduled                            ((,class (:foreground ,type))))
   `(org-scheduled-today                      ((,class (:foreground ,func :weight normal :height 1.2))))
   `(org-ellipsis                             ((,class (:foreground ,builtin))))
   `(org-verbatim                             ((,class (:foreground ,fg4))))
   `(org-document-info-keyword                ((,class (:foreground ,horizon-green))))
   `(org-sexp-date                            ((,class (:foreground ,fg4))))

   ;;;;; LaTeX
   `(font-latex-bold-face                     ((,class (:foreground ,type))))
   `(font-latex-italic-face                   ((,class (:foreground ,key3 :italic t))))
   `(font-latex-string-face                   ((,class (:foreground ,str))))
   `(font-latex-match-reference-keywords      ((,class (:foreground ,const))))
   `(font-latex-match-variable-keywords       ((,class (:foreground ,var))))

   ;;;;; Ido mode
   `(ido-only-match                           ((,class (:foreground ,keyword))))
   `(ido-subdir                               ((,class (:weight normal :foreground ,fg0))))
   `(ido-first-match                          ((,class (:foreground ,keyword :bold nil))))

   ;;;;; Gnus
   `(gnus-header-content                      ((,class (:foreground ,keyword))))
   `(gnus-header-from                         ((,class (:foreground ,var))))
   `(gnus-header-name                         ((,class (:foreground ,type))))
   `(gnus-header-subject                      ((,class (:foreground ,func :bold nil))))

   ;;;;; Mu4e
   `(mu4e-view-url-number-face                ((,class (:foreground ,type))))
   `(mu4e-cited-1-face                        ((,class (:foreground ,fg2))))
   `(mu4e-cited-7-face                        ((,class (:foreground ,fg3))))
   `(mu4e-header-marks-face                   ((,class (:foreground ,type))))

   ;;;;; FFAP
   `(ffap                                     ((,class (:foreground ,fg4))))

   ;;;;; js2 & js3
   `(js2-private-function-call                ((,class (:foreground ,const))))
   `(js2-jsdoc-html-tag-delimiter             ((,class (:foreground ,str))))
   `(js2-jsdoc-html-tag-name                  ((,class (:foreground ,key2))))
   `(js2-external-variable                    ((,class (:foreground ,type  ))))
   `(js2-function-param                       ((,class (:foreground ,const))))
   `(js2-jsdoc-value                          ((,class (:foreground ,str))))
   `(js2-private-member                       ((,class (:foreground ,fg3))))
   `(js2-warning                              ((t (:underline ,warning))))
   `(js2-error                                ((t (:foreground ,warning :weight normal))))
   `(js2-jsdoc-tag                            ((t (:foreground ,var))))
   `(js2-jsdoc-type                           ((t (:foreground ,var))))
   `(js2-instance-member                      ((t (:foreground ,var))))
   `(js2-object-property                      ((t (:foreground ,func))))
   `(js2-magic-paren                          ((t (:foreground ,const))))
   `(js2-function-call                        ((t (:foreground ,const))))
   `(js2-keywords                             ((t (:foreground ,keyword))))
   `(js3-warning-face                         ((,class (:underline ,keyword))))
   `(js3-error-face                           ((,class (:underline ,warning))))
   `(js3-external-variable-face               ((,class (:foreground ,var))))
   `(js3-function-param-face                  ((,class (:foreground ,key3))))
   `(js3-jsdoc-tag-face                       ((,class (:foreground ,keyword))))
   `(js3-instance-member-face                 ((,class (:foreground ,const))))

   ;;;;; Auto-complete
   `(ac-completion-face                       ((,class (:underline t :foreground ,keyword))))

   ;;;;; Misc
   `(info-quoted-name                         ((,class (:foreground ,builtin))))
   `(info-string                              ((,class (:foreground ,str))))
   `(icompletep-determined                    ((,class :foreground ,builtin)))

   ;;;;; Slime
   `(slime-repl-inputed-output-face           ((,class (:foreground ,type))))

   ;;;;; Undo tree
   `(undo-tree-visualizer-current-face        ((,class :foreground ,builtin)))
   `(undo-tree-visualizer-default-face        ((,class :foreground ,fg2)))
   `(undo-tree-visualizer-unmodified-face     ((,class :foreground ,var)))
   `(undo-tree-visualizer-register-face       ((,class :foreground ,type)))

   ;;;;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face          ((,class :foreground "#BBECEF")))
   `(rainbow-delimiters-depth-2-face          ((,class :foreground "#BBCCDD")))
   `(rainbow-delimiters-depth-3-face          ((,class :foreground "#8Fd4FF")))
   `(rainbow-delimiters-depth-4-face          ((,class :foreground "#BBECEF")))
   `(rainbow-delimiters-depth-5-face          ((,class :foreground "#BBCCDD")))
   `(rainbow-delimiters-depth-6-face          ((,class :foreground "#8Fd4FF")))
   `(rainbow-delimiters-depth-7-face          ((,class :foreground "#BBECEF")))
   `(rainbow-delimiters-depth-8-face          ((,class :foreground "#BBCCDD")))
   `(rainbow-delimiters-depth-9-face          ((,class :foreground "#8Fd4FF")))
   `(rainbow-delimiters-unmatched-face        ((,class :foreground ,warning)))

   ;;;;; Magit
   `(magit-item-highlight                     ((,class (:background ,bg3))))
   `(magit-hunk-heading                       ((,class (:background ,bg3))))
   `(magit-hunk-heading-highlight             ((,class (:background ,bg3))))
   `(magit-bisect-bad                         ((t (:foreground ,horizon-red))))
   `(magit-bisect-good                        ((t (:foreground ,horizon-green))))
   `(magit-bisect-skip                        ((t (:foreground ,horizon-orange))))
   `(magit-blame-date                         ((t (:foreground ,horizon-red))))
   `(magit-blame-heading                      ((t (:foreground ,horizon-orange :background ,bg3 :extend t))))
   `(magit-branch                             ((,class (:foreground ,horizon-blue :weight normal))))
   `(magit-branch-current                     ((t (:foreground ,horizon-blue))))
   `(magit-branch-local                       ((t (:foreground ,horizon-bluegreen))))
   `(magit-branch-remote                      ((t (:foreground ,horizon-green))))
   `(magit-cherry-equivalent                  ((t (:foreground ,horizon-magenta))))
   `(magit-cherry-unmatched                   ((t (:foreground ,horizon-bluegreen))))
   `(magit-diff-added                         ((t (:foreground ,horizon-green :background ,horizon-green-bg :extend t))))
   `(magit-diff-added-highlight               ((t (:foreground ,horizon-lightgreen :background ,horizon-green-bghl :extend t))))
   `(magit-diff-removed                       ((t (:foreground ,horizon-red :background ,horizon-red-bg :extend t))))
   `(magit-diff-removed-highlight             ((t (:foreground ,horizon-lightred :background ,horizon-red-bghl :extend t))))
   `(magit-diff-base                          ((t (:foreground ,bg1 :background ,horizon-red :extend t))))
   `(magit-diff-base-highlight                ((t (:foreground ,horizon-red :background ,bg3 :extend t))))
   `(magit-diff-context                       ((t (:foreground ,comment :extend t))))
   `(magit-diff-file-header                   ((,class (:foreground ,fg2 :background ,bg3))))
   `(magit-diff-file-heading                  ((t (:foreground ,fg1 :extend t))))
   `(magit-diff-file-heading-highlight        ((t (:background ,bg3 :extend t))))
   `(magit-diff-file-heading-selection        ((t (:foreground ,horizon-red :background ,bg3 :extend t))))
   `(magit-diff-hunk-heading                  ((t (:foreground ,fg1 :background ,bg3 :extend t))))
   `(magit-diff-hunk-heading-highlight        ((t (:background ,bg3 :extend t))))
   `(magit-diff-lines-heading                 ((t (:foreground ,horizon-yellow :background ,horizon-red :extend t))))
   `(magit-diff-context-highlight             ((,class (:background ,bg2 :foreground ,fg2))))
   `(magit-diffstat-added                     ((t (:foreground ,horizon-green))))
   `(magit-diffstat-removed                   ((t (:foreground ,horizon-orange))))
   `(magit-dimmed                             ((t (:foreground ,comment))))
   `(magit-filename                           ((t (:foreground ,horizon-magenta))))
   `(magit-hash                               ((t (:foreground ,comment))))
   `(magit-header-line                        ((t (:inherit nil))))
   `(magit-log-author                         ((t (:foreground ,horizon-orange))))
   `(magit-log-date                           ((t (:foreground ,horizon-blue))))
   `(magit-log-graph                          ((t (:foreground ,comment))))
   `(magit-mode-line-process                  ((t (:foreground ,horizon-orange))))
   `(magit-mode-line-process-error            ((t (:foreground ,horizon-red))))
   `(magit-process-ok                         ((t (:inherit success))))
   `(magit-process-ng                         ((t (:inherit error))))
   `(magit-reflog-amend                       ((t (:foreground ,horizon-magenta))))
   `(magit-reflog-checkout                    ((t (:foreground ,horizon-blue))))
   `(magit-reflog-cherry-pick                 ((t (:foreground ,horizon-green))))
   `(magit-reflog-commit                      ((t (:foreground ,horizon-green))))
   `(magit-reflog-merge                       ((t (:foreground ,horizon-green))))
   `(magit-reflog-other                       ((t (:foreground ,horizon-bluegreen))))
   `(magit-reflog-rebase                      ((t (:foreground ,horizon-magenta))))
   `(magit-reflog-remote                      ((t (:foreground ,horizon-bluegreen))))
   `(magit-reflog-reset                       ((t (:inherit error))))
   `(magit-refname                            ((t (:foreground ,comment))))
   `(magit-section-heading                    ((t (:foreground ,horizon-yellow))))
   `(magit-section-heading-selection          ((t (:foreground ,horizon-orange :extend t))))
   `(magit-section-highlight                  ((t (:background ,bg3 :extend t))))
   `(magit-sequence-drop                      ((t (:foreground ,horizon-red))))
   `(magit-sequence-head                      ((t (:foreground ,horizon-blue))))
   `(magit-sequence-part                      ((t (:foreground ,horizon-orange))))
   `(magit-sequence-stop                      ((t (:foreground ,horizon-green))))
   `(magit-signature-bad                      ((t (:inherit error))))
   `(magit-signature-error                    ((t (:inherit error))))
   `(magit-signature-expired-key              ((t (:foreground ,horizon-orange))))
   `(magit-signature-good                     ((t (:inherit success))))
   `(magit-signature-revoked                  ((t (:foreground ,horizon-magenta))))
   `(magit-signature-untrusted                ((t (:foreground ,horizon-bluegreen))))
   `(magit-tag                                ((t (:foreground ,horizon-yellow))))

   ;;;; term-mode (vterm too)
   `(term                                     ((,class (:foreground ,fg1 :background ,bg1))))
   `(term-color-black                         ((,class (:foreground ,bg3 :background ,bg3))))
   `(term-color-blue                          ((,class (:foreground ,horizon-blue :background ,horizon-blue))))
   `(term-color-red                           ((,class (:foreground ,horizon-red :background ,horizon-red))))
   `(term-color-green                         ((,class (:foreground ,horizon-green :background ,horizon-green))))
   `(term-color-yellow                        ((,class (:foreground ,horizon-yellow :background ,horizon-yellow))))
   `(term-color-magenta                       ((,class (:foreground ,horizon-magenta :background ,horizon-magenta))))
   `(term-color-cyan                          ((,class (:foreground ,horizon-bluegreen :background ,horizon-bluegreen))))
   `(term-color-white                         ((,class (:foreground ,fg2 :background ,fg2))))

   ;;;;; diredfl
   `(diredfl-autofile-name                    ((t (:foreground ,fg0))))
   `(diredfl-compressed-file-name             ((t (:foreground ,horizon-yellow))))
   `(diredfl-compressed-file-suffix           ((t (:foreground ,doc))))
   `(diredfl-date-time                        ((t (:foreground ,horizon-bluegreen))))
   `(diredfl-deletion                         ((t (:foreground ,horizon-red :bold t))))
   `(diredfl-deletion-file-name               ((t (:foreground ,horizon-red ))))
   `(diredfl-dir-heading                      ((t (:foreground ,horizon-blue :bold t))))
   `(diredfl-dir-name                         ((t (:foreground ,horizon-blue))))
   `(diredfl-dir-priv                         ((t (:foreground ,horizon-blue))))
   `(diredfl-exec-priv                        ((t (:foreground ,horizon-green))))
   `(diredfl-executable-tag                   ((t (:foreground ,horizon-green))))
   `(diredfl-file-name                        ((t (:foreground ,fg1))))
   `(diredfl-file-suffix                      ((t (:foreground ,doc))))
   `(diredfl-flag-mark                        ((t (:foreground ,horizon-yellow :bold t))))
   `(diredfl-ignored-file-name                ((t (:foreground ,doc))))
   `(diredfl-link-priv                        ((t (:foreground ,horizon-magenta))))
   `(diredfl-no-priv                          ((t (:foreground ,fg1))))
   `(diredfl-number                           ((t (:foreground ,horizon-orange))))
   `(diredfl-other-priv                       ((t (:foreground ,horizon-magenta))))
   `(diredfl-rare-priv                        ((t (:foreground ,fg1))))
   `(diredfl-read-priv                        ((t (:foreground ,horizon-yellow))))
   `(diredfl-symlink                          ((t (:foreground ,horizon-magenta))))
   `(diredfl-tagged-autofile-name             ((t (:foreground ,fg0))))
   `(diredfl-write-priv                       ((t (:foreground ,horizon-red))))

   ;;;;; Helm
   `(helm-header                              ((,class (:foreground ,fg2 :background ,bg1 :underline nil :box nil))))
   `(helm-source-header                       ((,class (:foreground ,keyword :background ,bg1 :underline nil :weight normal))))
   `(helm-selection                           ((,class (:background ,bg2 :underline nil))))
   `(helm-selection-line                      ((,class (:background ,bg2))))
   `(helm-visible-mark                        ((,class (:foreground ,bg1 :background ,bg3))))
   `(helm-candidate-number                    ((,class (:foreground ,bg1 :background ,fg1))))
   `(helm-separator                           ((,class (:foreground ,type :background ,bg1))))
   `(helm-time-zone-current                   ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-time-zone-home                      ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-not-saved                    ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-process                      ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-buffer-saved-out                    ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-buffer-size                         ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-ff-directory                        ((,class (:foreground ,func :background ,bg1 :weight normal))))
   `(helm-ff-file                             ((,class (:foreground ,fg1 :background ,bg1 :weight normal))))
   `(helm-ff-executable                       ((,class (:foreground ,key2 :background ,bg1 :weight normal))))
   `(helm-ff-invalid-symlink                  ((,class (:foreground ,key3 :background ,bg1 :weight normal))))
   `(helm-ff-symlink                          ((,class (:foreground ,keyword :background ,bg1 :weight normal))))
   `(helm-ff-prefix                           ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
   `(helm-grep-cmd-line                       ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-file                           ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-finish                         ((,class (:foreground ,fg2 :background ,bg1))))
   `(helm-grep-lineno                         ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-match                          ((,class (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running                        ((,class (:foreground ,func :background ,bg1))))
   `(helm-moccur-buffer                       ((,class (:foreground ,func :background ,bg1))))
   `(helm-source-go-package-godoc-description ((,class (:foreground ,str))))
   `(helm-bookmark-w3m                        ((,class (:foreground ,type))))

   ;;;;; web-mode
   `(web-mode-html-tag-bracket-face           ((,class (:foreground ,doc))))
   `(web-mode-html-tag-face                   ((,class (:foreground ,type))))
   `(web-mode-html-attr-name-face             ((,class (:foreground ,var))))
   `(web-mode-html-attr-value-face            ((,class (:foreground ,str))))
   `(web-mode-builtin-face                    ((,class (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face                    ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face                   ((,class (:inherit ,font-lock-constant-face))))
   `(web-mode-keyword-face                    ((,class (:foreground ,keyword))))
   `(web-mode-doctype-face                    ((,class (:inherit ,font-lock-doc-face))))
   `(web-mode-function-name-face              ((,class (:inherit ,font-lock-function-name-face))))
   `(web-mode-string-face                     ((,class (:foreground ,str))))
   `(web-mode-type-face                       ((,class (:inherit ,font-lock-type-face))))
   `(web-mode-warning-face                    ((,class (:inherit ,font-lock-warning-face))))
   `(web-mode-json-key-face                   ((,class (:foreground ,horizon-green))))
   `(web-mode-json-context-face               ((,class (:foreground ,horizon-blue))))

   ;;;;; Diff
   `(diff-header                              ((t (:foreground ,horizon-bluegreen :background nil))))
   `(diff-file-header                         ((t (:foreground ,fg3 :background nil))))
   `(diff-hunk-header                         ((t (:foreground ,fg4 :background ,bg4))))
   `(diff-added                               ((t (:foreground ,horizon-green :background ,horizon-green-bg))))
   `(diff-removed                             ((t (:foreground ,horizon-red :background ,horizon-red-bg))))
   `(diff-changed                             ((t (:foreground ,horizon-blue :background ,horizon-blue-bg))))
   `(diff-refine-added                        ((t (:foreground ,horizon-lightgreen :background ,horizon-green-bghl))))
   `(diff-refine-removed                      ((t (:foreground ,horizon-lightred :background ,horizon-red-bghl))))
   `(diff-refine-changed                      ((t (:foreground ,horizon-lightblue :background ,horizon-blue-bghl))))

   ;;;;; Ediff
   `(ediff-current-diff-Ancestor              ((t (:foreground ,horizon-red :background ,horizon-red-bg))))
   `(ediff-current-diff-A                     ((t (:foreground ,horizon-red :background ,horizon-red-bg))))
   `(ediff-current-diff-B                     ((t (:foreground ,horizon-green :background ,horizon-green-bg))))
   `(ediff-current-diff-C                     ((t (:foreground ,horizon-blue :background ,horizon-blue-bg))))
   `(ediff-fine-diff-Ancestor                 ((t (:foreground ,horizon-lightred :background ,horizon-red-bghl))))
   `(ediff-fine-diff-A                        ((t (:foreground ,horizon-lightred :background ,horizon-red-bghl))))
   `(ediff-fine-diff-B                        ((t (:foreground ,horizon-lightgreen :background ,horizon-green-bghl))))
   `(ediff-fine-diff-C                        ((t (:foreground ,horizon-lightblue :background ,horizon-blue-bghl))))
   `(ediff-even-diff-Ancestor                 ((t (:background ,bg2))))
   `(ediff-even-diff-A                        ((t (:background ,bg2))))
   `(ediff-even-diff-B                        ((t (:background ,bg2))))
   `(ediff-even-diff-C                        ((t (:background ,bg2))))
   `(ediff-odd-diff-Ancestor                  ((t (:background ,bg2))))
   `(ediff-odd-diff-A                         ((t (:background ,bg2))))
   `(ediff-odd-diff-B                         ((t (:background ,bg2))))
   `(ediff-odd-diff-C                         ((t (:background ,bg2))))

   ;;;;; Java/JDE
   `(jde-java-font-lock-package-face          ((t (:foreground ,var))))
   `(jde-java-font-lock-public-face           ((t (:foreground ,keyword))))
   `(jde-java-font-lock-private-face          ((t (:foreground ,keyword))))
   `(jde-java-font-lock-constant-face         ((t (:foreground ,const))))
   `(jde-java-font-lock-modifier-face         ((t (:foreground ,key3))))
   `(jde-jave-font-lock-protected-face        ((t (:foreground ,keyword))))
   `(jde-java-font-lock-number-face           ((t (:foreground ,numeric))))

   ;;;;; centaur-tabs
   `(centaur-tabs-default                     ((t (:background ,bg1 :foreground ,fg1))))
   `(centaur-tabs-selected                    ((t (:background ,bg1 :foreground ,fg3 :box nil))))
   `(centaur-tabs-unselected                  ((t (:background ,bg2 :foreground ,fg0 :box nil))))
   `(centaur-tabs-selected-modified           ((t (:background ,bg2 :foreground ,accent :box nil))))
   `(centaur-tabs-unselected-modified         ((t (:background ,bg2 :foreground ,fg4 :box nil))))
   `(centaur-tabs-active-bar-face             ((t (:background ,accent :box nil))))
   `(centaur-tabs-modified-marker-selected    ((t (:inherit 'centaur-tabs-selected-modified :foreground ,accent :box nil))))
   `(centaur-tabs-modified-marker-unselected  ((t (:inherit 'centaur-tabs-unselected-modified :foreground ,accent :box nil))))

   ;;;;; solaire-mode
   `(solaire-default-face                     ((t (:inherit default :background ,bg2))))
   `(solaire-minibuffer-face                  ((t (:inherit default :background ,bg2))))
   `(solaire-hl-line-face                     ((t (:inherit hl-line :background ,bg3))))
   `(solaire-org-hide-face                    ((t (:inherit org-hide :background ,bg2))))

   ;;;;; Ivy
   `(ivy-confirm-face                         ((t (:inherit minibuffer-prompt :foreground ,keyword))))
   `(ivy-current-match                        ((t (:background ,bg-hl :extend t))))
   `(ivy-highlight-face                       ((t (:inherit font-lock-builtin-face))))
   `(ivy-match-required-face                  ((t (:inherit minibuffer-prompt :foreground ,warning))))
   `(ivy-minibuffer-match-face-1              ((t (:foreground ,horizon-lightblue))))
   `(ivy-minibuffer-match-face-2              ((t (:inherit ivy-minibuffer-match-face-1))))
   `(ivy-minibuffer-match-face-3              ((t (:inherit ivy-minibuffer-match-face-2))))
   `(ivy-minibuffer-match-face-4              ((t (:inherit ivy-minibuffer-match-face-2))))
   `(ivy-minibuffer-match-highlight           ((t (:inherit ivy-current-match))))
   `(ivy-modified-buffer                      ((t (:inherit default :foreground ,var))))
   `(ivy-virtual                              ((t (:inherit default :foreground ,doc))))
   `(ivy-posframe                             ((t (:background ,bg3))))

   ;;;;; Counsel
   `(counsel-key-binding                      ((t (:foreground ,var))))

   ;;;;; Swiper
   `(swiper-match-face-1                      ((t (:inherit ivy-minibuffer-match-face-1))))
   `(swiper-match-face-2                      ((t (:inherit ivy-minibuffer-match-face-2))))
   `(swiper-match-face-3                      ((t (:inherit ivy-minibuffer-match-face-3))))
   `(swiper-match-face-4                      ((t (:inherit ivy-minibuffer-match-face-4))))
   `(swiper-line-face                         ((t (:foreground ,fg3 :background ,bg-hl :extend t))))

   ;;;;; Git gutter & git gutter fringe
   `(git-gutter:added                         ((t (:foreground ,vc-g :weight normal))))
   `(git-gutter:deleted                       ((t (:foreground ,vc-r :weight normal))))
   `(git-gutter:modified                      ((t (:foreground ,vc-b :weight normal))))
   `(git-gutter-fr:added                      ((t (:foreground ,vc-g :weight normal))))
   `(git-gutter-fr:deleted                    ((t (:foreground ,vc-r :weight normal))))
   `(git-gutter-fr:modified                   ((t (:foreground ,vc-b :weight normal))))

   ;;;;; diff-hl (git gutter)
   `(diff-hl-insert                           ((t (:background ,vc-g :foreground ,vc-g))))
   `(diff-hl-delete                           ((t (:background ,vc-r :foreground ,vc-r))))
   `(diff-hl-change                           ((t (:background ,vc-b :foreground ,vc-b))))

   ;;;;; Neo tree
   `(neo-dir-link-face                        ((t (:foreground "#cccccc"))))
   `(neo-header-face                          ((t (:foreground "#cccccc"))))
   `(neo-banner-face                          ((t (:foreground "#cccccc"))))
   `(neo-root-dir-face                        ((t (:foreground "#cccccc"))))
   `(neo-file-link-face                       ((t (:foreground "#aaaaaa"))))
   `(neo-expand-btn-face                      ((t (:foreground "#aaaaaa"))))

   ;;;;; smart mode line
   `(sml/line-number                          ((t (:foreground ,fg4 :bold nil))))
   `(sml/modified                             ((t (:foreground ,horizon-lightred :background ,horizon-red-bghl :bold t))))
   `(sml/outside-modified                     ((t (:foreground ,horizon-lightred :background ,horizon-red-bghl :bold nil))))
   `(sml/global                               ((t (:foreground ,fg1 :bold nil))))
   `(sml/filename                             ((t (:foreground ,fg4 :bold t))))
   `(sml/prefix                               ((t (:foreground ,fg1 :bold nil))))
   `(sml/read-only                            ((t (:foreground ,fg1 :bold nil))))
   `(sml/modes                                ((t (:foreground ,fg1 :bold nil))))
   `(sml/charging                             ((t (:foreground ,horizon-green :bold nil))))
   `(sml/discharging                          ((t (:foreground ,horizon-lightred :background ,horizon-red-bghl :bold nil))))

   ;;;;; evil search and replace
   `(evil-ex-substitute-matches               ((t (:foreground ,warning :weight normal :strike-through t))))
   `(evil-ex-substitute-replacement           ((t (:foreground ,horizon-bluegreen :weight normal))))

   ;;;;; highlight todo
   `(hl-todo                                  ((t (:inverse-video t))))

   ;;;;; highlight numbers
   `(highlight-numbers-number                 ((t (:foreground ,numeric))))

   ;;;;; highlight operators
   `(highlight-operators-face                 ((t (:inherit default))))

   ;;;;; highlight symbol
   `(highlight-symbol-face                    ((t (:background ,bg3 :distant-foreground ,fg0))))

   ;;;;; highlight thing
   `(highlight-thing                          ((t (:inherit highlight-symbol-face))))

   ;;;;; tree-sitter
   `(tree-sitter-hl-face:method.call          ((t (:inherit font-lock-function-name-face))))
   `(tree-sitter-hl-face:function.call        ((t (:inherit font-lock-function-name-face))))
   `(tree-sitter-hl-face:operator             ((t (:inherit default))))
   `(tree-sitter-hl-face:type.builtin         ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:number               ((t (:inherit highlight-numbers-number))))
   `(tree-sitter-hl-face:variable.special     ((t (:inherit font-lock-keyword-face))))

   ;;;;; lsp-ui
   `(lsp-ui-doc-background                    ((t (:background ,bg0))))

   ;;;;; flycheck
   `(flycheck-info                            ((t (:underline (:style wave :color ,horizon-green)))))
   `(flycheck-error                           ((t (:underline (:style wave :color ,horizon-lightred)))))
   `(flycheck-warning                         ((t (:underline (:style wave :color ,horizon-yellow)))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'my-doom-horizon-2)
(provide 'my-doom-horizon-2-theme)

;;; my-doom-horizon-2-theme.el ends here
