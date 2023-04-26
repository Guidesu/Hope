/mob/living/carbon/human/
	var/obj/item/implant/conback/conciousness_pres

/mob/living/carbon/human/Destroy()
	. = ..()

	if(conciousness_pres)
		conciousness_pres.wearer = null
		conciousness_pres = null

/mob/living/carbon/human/proc/create_conback()
	spawn(10) //I know spawn is bad, but a little bit of delay is required.
		var/obj/item/implant/conback/conciousness_pres = new
		conciousness_pres.install(src)
		to_chat(src, SPAN_NOTICE("You feel a faint sense of vertigo as your conciousness backup implant boots up."))
