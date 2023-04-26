/mob/living/proc/get_conback()
	for(var/obj/item/implant/conback/I in src)
		if(I.wearer != src)
			continue

		return I

	return null
