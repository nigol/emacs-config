(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
 
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;; activate installed packages
(package-initialize)

(defun ensure-package-installed (&rest packages)
  (mapcar
   (lambda (package)
     ;; (package-installed-p 'evil)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed 'company-emacs-eclim 'eclim 'web-mode 'js2-mode 'company 'magit) ;  --> (nil nil) if iedit and magit are already installed

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-dabbrev-downcase nil)
 '(eclim-eclipse-dirs (quote ("~/eclipse")))
 '(eclim-executable "~/eclipse/eclim")
 '(package-selected-packages
   (quote
    (company-emacs-eclim eclim web-mode js2-mode company magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)
 
(add-hook 'java-mode-hook #'eclim-mode)