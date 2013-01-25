;;;; CC-mode配置  http://cc-mode.sourceforge.net/  
(require 'cc-mode)  
(c-set-offset 'inline-open 0)  
(c-set-offset 'friend '-)  
(c-set-offset 'substatement-open 0)  

;;;;C/C++语言编辑策略  
(defun my-c-mode-common-hook()  
  (setq tab-width 4 indent-tabs-mode nil)  
  ;;; hungry-delete and auto-newline  
  (c-toggle-auto-hungry-state 1)  
  ;;按键定义  
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)  
  (define-key c-mode-base-map [(return)] 'newline-and-indent)  
  (define-key c-mode-base-map [(f7)] '(compile-command "make"))  
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)  
  ;;(define-key c-mode-base-map [(tab)] 'hippie-expand)  
  ;;(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)  
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)  
  
  ;;预处理设置  
  (setq c-macro-shrink-window-flag t)  
  (setq c-macro-preprocessor "cpp")  
  (setq c-macro-cppflags " ")  
  (setq c-macro-prompt-flag t)  
  (setq hs-minor-mode t)  
  (setq abbrev-mode t)  
)  
  
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)  

;;;;我的C++语言编辑策略  
(defun my-c++-mode-hook()  
  (setq tab-width 4 indent-tabs-mode nil)  
    (c-set-style "stroustrup")  
  ;;  (define-key c++-mode-map [f3] 'replace-regexp)  
)

;;括号自动插入
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?` ?` _ "''")
    (?\( ?  _ " )")
    (?\[ ?  _ " ]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair) 