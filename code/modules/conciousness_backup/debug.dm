/obj/item/implant/conback/proc/quick_implant(var/mob/living/carbon/human/H)
	if(istype(H))
		install(H)
	return FALSE
