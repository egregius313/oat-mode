;;; oat-mode.el --- Syntax highlighting for the OAT language -*- lexical-binding: t -*-

;; Copyright © 2020, Edward Minnix III

;; Author: Edward Minnix III (egregius313@gmail.com)
;; Version: 0.0.1
;; Created: 4 Apr 2020
;; Keywords: language
;; Homepage: https://gihtub.com/egregius313/oat-mode.el

;; This file is not part of GNU Emacs

;;; License:

;;; Commentary:

;; Major mode for the OAT language

;; OAT is a teaching language for compilers

;;; Code:
(defgroup oat nil
  "Customization variables for Oat mode."
  :tag "Oat"
  :group 'languages)

(defcustom oat-mode-hook nil
  "Hook called by `oat-mode'."
  :type 'hook
  :group 'oat)

(defvar oat-font-lock-keywords
  (let* ((oat-keywords (rx symbol-start (or "if" "if?" "return" "for" "while" "else" "var" "new" "global") symbol-end))
		 (oat-types (rx symbol-start (or "int" "bool" "string" "void") symbol-end))
		 (oat-constants (rx symbol-start (or "true" "false" "null" symbol-end)))
		 (oat-builtins (rx symbol-start
						   (or "length"
							   "array_of_string"
							   "string_of_array"
							   "length_of_string"
							   "string_of_int"
							   "string_cat"
							   "print_string"
							   "print_int"
							   "print_bool")
						   symbol-end)))
	`((,oat-keywords . font-lock-keyword-face)
	  (,oat-types . font-lock-type-face)
	  (,oat-builtins . font-lock-builtin-face)
	  (,oat-constants . font-lock-constant-face))))

(define-derived-mode oat-mode c-mode "Oat"
  "Major mode for editing Oat files."
  :group 'oat
  (setq font-lock-defaults '((oat-font-lock-keywords))))

(add-to-list 'auto-mode-alist `("\\.oat\\'" . oat-mode))

(provide 'oat-mode)
