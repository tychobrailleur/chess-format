;;; chess-format.el --- Chess format manipulation    -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Sébastien Le Callonnec

;; Author: Sébastien Le Callonnec <sebastien@weblogism.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Chess format manipulation utilities.

;;; Code:

(defun chess-format--invert-case (ch)
  (if (and (>= ch 65) (<= ch 90))
      (+ ch 32)
    (if (and (>= ch 97) (<= ch 122))
        (- ch 32)
      ch)))


(defun chess-format--invert-case-string (str)
  (concat (mapcar #'chess-format--invert-case str) ""))

(defun chess-format--swap-colours (fen)
  "Swap colours and rotate the board."
  (let ((rows (split-string fen "/")))
    (chess-format--invert-case-string
     (mapconcat 'identity
                (nreverse (mapcar (lambda (r) (nreverse r)) rows)) "/"))))

(provide 'chess-format)
;;; chess-format.el ends here
