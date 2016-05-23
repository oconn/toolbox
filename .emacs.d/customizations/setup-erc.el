;;
;; ERC Config
;;

;; Determins if erc should auto join on start up
(erc-autojoin-mode t)

;; Set default nick
(setq erc-nick "mocon")

;; Set default channels to join
(setq erc-autojoin-channels-alist
  '((".*\\.freenode.net" "#clojure" "##javascript" "#reactjs")))
