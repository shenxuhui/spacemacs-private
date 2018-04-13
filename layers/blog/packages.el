;;; packages.el --- blog layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: ShenXuhui <shenxuhui@lol.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `blog-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `blog/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `blog/pre-init-PACKAGE' and/or
;;   `blog/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst blog-packages
      '(blog-admin
        org-page
        ))

(defun blog/init-blog-admin ()
  (use-package blog-admin
    :init
    (progn
      (setq blog-admin-backend-path "/Users/shenxuhui/Workspace/github.io/XuhuiShen.github.io")
      (setq blog-admin-backend-type 'org-page)
      (setq blog-admin-backend-new-post-in-drafts t)
      (setq blog-admin-backend-new-post-with-same-name-dir t)
      (setq blog-admin-backend-org-page-drafts "_drafts")
      (add-hook 'blog-admin-backend-after-new-post-hook 'find-file)
      )))

(defun blog/init-org-page ()
  (use-package org-page
    :init
    (progn
      ;; (setq op/theme 'default)
      (setq op/repository-directory "/Users/shenxuhui/Workspace/github.io/XuhuiShen.github.io")
      (setq op/site-domain "https://xuhuishen.github.io")
      (setq op/personal-github-link "https://github.com/XuhuiShen")
      (setq op/personal-google-analytics-id "UA-89932835-1")
      (setq op/personal-disqus-shortname "xuhuishen")
      (setq op/site-main-title "Shen")
      (setq op/site-sub-title "=============> There is no god, our creed is but for ourselves.")

      (setq op/category-config-alist
            '(("blog" ;; this is the default configuration
               :show-meta t
               :show-comment t
               :uri-generator op/generate-uri
               :uri-template "/blog/%y/%m/%d/%t/"
               :sort-by :date     ;; how to sort the posts
               :category-index t) ;; generate category index or not
              ("wiki"
               :show-meta t
               :show-comment nil
               :uri-generator op/generate-uri
               :uri-template "/wiki/%t/"
               :sort-by :mod-date
               :category-index t)
              ("index"
               :show-meta nil
               :show-comment nil
               :uri-generator op/generate-uri
               :uri-template "/"
               :sort-by :date
               :category-index nil)
              ("about"
               :show-meta nil
               :show-comment nil
               :uri-generator op/generate-uri
               :uri-template "/about/"
               :sort-by :date
               :category-index nil))))))
