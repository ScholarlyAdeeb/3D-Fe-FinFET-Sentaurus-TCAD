Title "Untitled"

Controls {
}

IOControls {
	EnableSections
}

Definitions {
	Constant "N.SD" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+20
	}
	Constant "P.Chan" {
		Species = "BoronActiveConcentration"
		Value = 1e+16
	}
	Refinement "Ref.Global" {
		MaxElementSize = ( 0.015 0.015 0.015 )
		MinElementSize = ( 0.008 0.008 0.008 )
	}
	Refinement "Ref.Channel" {
		MaxElementSize = ( 0.005 0.005 0.005 )
		MinElementSize = ( 0.002 0.002 0.002 )
	}
	Refinement "Ref.Ferroelectric" {
		MaxElementSize = ( 0.003 0.003 0.003 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "Ref.Gate" {
		MaxElementSize = ( 0.01 0.01 0.01 )
		MinElementSize = ( 0.005 0.005 0.005 )
	}
	Refinement "Ref.Coarse" {
		MaxElementSize = ( 0.025 0.025 0.025 )
		MinElementSize = ( 0.015 0.015 0.015 )
	}
}

Placements {
	Constant "Place.Chan" {
		Reference = "P.Chan"
		EvaluateWindow {
			Element = region ["R.Fin"]
		}
	}
	Constant "Place.Source" {
		Reference = "N.SD"
		EvaluateWindow {
			Element = Cuboid [(0 -0.05 0) (0.02 0.05 0.03)]
		}
	}
	Constant "Place.Drain" {
		Reference = "N.SD"
		EvaluateWindow {
			Element = Cuboid [(0.04 -0.05 0) (0.06 0.05 0.03)]
		}
	}
}

