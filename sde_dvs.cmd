; =====================================================================
; AFET Structure Editor Commands
; Paste this in SDE Command Window
; =====================================================================

; Clear existing geometry
(sde:clear)

; Set boolean operation for conformal layers
(sdegeo:set-default-boolean "BAB")

; =====================================================================
; 1. Define AFET Dimensions (in micrometers)
; =====================================================================
(define Lgate 0.020)
(define Lsd 0.020)
(define Wfin 0.010)
(define Hfin 0.030)
(define Tox 0.001)
(define Thk 0.001)
(define Thzo 0.003)
(define Ttin 0.010)

; Coordinates
(define X0 0.0)
(define X1 Lsd)
(define X2 (+ X1 Lgate))
(define X3 (+ X2 Lsd))
(define Yf (/ Wfin 2.0))

; =====================================================================
; 2. Build SOI Base
; =====================================================================
(sdegeo:create-cuboid (position X0 -0.05 -0.05) (position X3 0.05 0.0) "Oxide" "R.BOX")
(sdegeo:create-cuboid (position X0 (- Yf) 0.0) (position X3 Yf Hfin) "Silicon" "R.Fin")

; =====================================================================
; 3. Build Conformal Gate Stack
; =====================================================================
(define Yox (+ Yf Tox))
(define Yhk (+ Yox Thk))
(define Yhzo (+ Yhk Thzo))
(define Ytin (+ Yhzo Ttin))

(define Zox (+ Hfin Tox))
(define Zhk (+ Zox Thk))
(define Zhzo (+ Zhk Thzo))
(define Ztin (+ Zhzo Ttin))

(sdegeo:create-cuboid (position X1 (- Yox) 0.0) (position X2 Yox Zox) "Oxide" "R.IL")
(sdegeo:create-cuboid (position X1 (- Yhk) 0.0) (position X2 Yhk Zhk) "HfO2" "R.HighK")
(sdegeo:create-cuboid (position X1 (- Yhzo) 0.0) (position X2 Yhzo Zhzo) "Insulator1" "R.HZO")
(sdegeo:create-cuboid (position X1 (- Ytin) 0.0) (position X2 Ytin Ztin) "TiN" "R.GateMetal")

; =====================================================================
; 4. Define Contacts
; =====================================================================
(sdegeo:define-contact-set "source" 4 (color:rgb 1 0 0) "##")
(sdegeo:define-contact-set "drain" 4 (color:rgb 0 1 0) "##")
(sdegeo:define-contact-set "gate" 4 (color:rgb 0 0 1) "##")

(sdegeo:set-current-contact-set "source")
(sdegeo:set-contact-faces (find-face-id (position X0 0.0 (/ Hfin 2.0))))
(sdegeo:set-current-contact-set "drain")
(sdegeo:set-contact-faces (find-face-id (position X3 0.0 (/ Hfin 2.0))))
(sdegeo:set-current-contact-set "gate")
(sdegeo:set-contact-faces (find-face-id (position (+ X1 (/ Lgate 2.0)) 0.0 Ztin)))

; =====================================================================
; 5. Doping Profiles
; =====================================================================
(sdedr:define-constant-profile "N.SD" "PhosphorusActiveConcentration" 1e20)
(sdedr:define-constant-profile "P.Chan" "BoronActiveConcentration" 1e16)
(sdedr:define-constant-profile-region "Place.Chan" "P.Chan" "R.Fin")

(sdedr:define-refeval-window "Win.Source" "Cuboid" (position X0 -0.05 0.0) (position X1 0.05 Hfin))
(sdedr:define-constant-profile-placement "Place.Source" "N.SD" "Win.Source")
(sdedr:define-refeval-window "Win.Drain" "Cuboid" (position X2 -0.05 0.0) (position X3 0.05 Hfin))
(sdedr:define-constant-profile-placement "Place.Drain" "N.SD" "Win.Drain")

; =====================================================================
; 6. Mesh Generation
; =====================================================================
(sdedr:define-refinement-size "Ref.Global" 0.015 0.015 0.015 0.008 0.008 0.008)
(sdedr:define-refinement-size "Ref.Channel" 0.005 0.005 0.005 0.002 0.002 0.002)
(sdedr:define-refinement-placement "Place.Channel" "Ref.Channel" "R.Fin")
(sdedr:define-refinement-size "Ref.Ferroelectric" 0.003 0.003 0.003 0.001 0.001 0.001)
(sdedr:define-refinement-placement "Place.Ferroelectric" "Ref.Ferroelectric" "R.HZO")
(sdedr:define-refinement-size "Ref.Gate" 0.01 0.01 0.01 0.005 0.005 0.005)
(sdedr:define-refinement-placement "Place.Gate" "Ref.Gate" "R.GateMetal")
(sdedr:define-refinement-placement "Place.HighK" "Ref.Gate" "R.HighK")
(sdedr:define-refinement-placement "Place.IL" "Ref.Gate" "R.IL")
(sdedr:define-refinement-size "Ref.Coarse" 0.025 0.025 0.025 0.015 0.015 0.015)
(sdedr:define-refinement-placement "Place.BOX" "Ref.Coarse" "R.BOX")

; Build mesh
(sde:build-mesh "n@node@_msh")

; Save the structure
(sde:save-model "afet_structure")
