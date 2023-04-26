/obj/item/access_update_tool
	name = "conciousness backup access updater"
	desc = "A device used to update access for someone's conciousness backup implant."
	icon = 'icons/obj/device.dmi'
	icon_state = "adv_spectrometer"

	var/obj/item/card/id/card //Our current ID card. We copy access from this.

/obj/item/access_update_tool/examine(mob/user)
	. = ..()
	if(card)
		to_chat(user, SPAN_NOTICE("It appears to have an ID card in its ID card port."))


/obj/item/access_update_tool/attackby(obj/item/I, mob/user as mob)
	if(istype(I, /obj/item/card/id))
		to_chat(user, SPAN_NOTICE("You slot \the [I] into \the [src]'s ID card port."))
		user.drop_item()
		I.forceMove(src)
		card = I

/obj/item/access_update_tool/attack_self(mob/user)
	if(card)
		to_chat(user, SPAN_NOTICE("You remove the ID card from \the [src]'s ID card port."))
		card.forceMove(get_turf(user))
		card = null

/obj/item/access_update_tool/afterattack(atom/A, mob/living/user)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/person = A
		var/obj/item/implant/conback/conciousness_pres = person.conciousness_pres
		if(!conciousness_pres)
			to_chat(user, SPAN_WARNING("[person] doesn't have a conciousness backup to modify."))
			return
		//Else, we overwrite the conciousness backup's current access with the access on the ID card.
		conciousness_pres.access.Cut()
		conciousness_pres.access = card.access
		to_chat(user, SPAN_NOTICE("Access upload completed!"))
		conciousness_pres.send_host_message("Access transponder code upload completed.")
