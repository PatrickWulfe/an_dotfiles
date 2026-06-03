;;; create-bloc.el --- Function to create a dart bloc, state, and event file.  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Patrick Wulfe

;; Author: Patrick Wulfe <wulfep@gmail.com>
;; Keywords: files

(defun create-dart-bloc (blocSubject)
  "Create dart bloc files (bloc, state, event)"
  (interactive "sBloc Subject: \n")
  (write-file (concat "./" blocSubject "_bloc.dart"))
  )
