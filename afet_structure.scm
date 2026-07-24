
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "source" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "drain" 4 (color:rgb 0 1 0 )"##" )
(sdegeo:define-contact-set "gate" 4 (color:rgb 0 0 1 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "Win.Source" "Cuboid" (position 0 -0.05 0) (position 0.02 0.05 0.03))
(sdedr:define-refeval-window "Win.Drain" "Cuboid" (position 0.04 -0.05 0) (position 0.06 0.05 0.03))

;; Restore GUI session parameters:
(sde:set-window-position 0 0)
(sde:set-window-size 840 800)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Liberation Sans" "Normal" 8 251 )
