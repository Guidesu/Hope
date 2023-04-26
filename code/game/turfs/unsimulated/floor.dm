/turf/unsimulated/floor
	name = "floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "Floor3"

/turf/unsimulated/mask
	name = "mask"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"
	dynamic_lighting = TRUE

/turf/unsimulated/floor/shuttle_ceiling
	icon_state = "reinforced"

/turf/unsimulated/floor/snow
	name = "snow"
	icon = 'icons/turf/floors.dmi'
	icon_state = "snow"
	temperature = 253.15
	//multiplier to compensate the lower ressure
	oxygen = MOLES_O2STANDARD * 1.14
	nitrogen = MOLES_N2STANDARD * 1.14
