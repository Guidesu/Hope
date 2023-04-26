/obj/item/holochip
	name = "holochip"
	desc = "A one-use module containing a software package for a conciousness backup."
	icon = 'icons/obj/conback.dmi'
	icon_state = "holochip_base"

	var/tag_color
	var/used = FALSE
	var/list/contained_modules = list()

/obj/item/holochip/examine(mob/user)
	. = ..()

/obj/item/holochip/update_icon()
	cut_overlays()
	var/image/I = image("holochip_tags")
	I.color = tag_color
	add_overlay(I)

	if(!used)
		add_overlay("holochip_active")
	else
		add_overlay("holochip_inactive")

/obj/item/holochip/Initialize()
	update_icon()

/obj/item/holochip/afterattack(atom/A, mob/user)
	if(used)
		to_chat(user, SPAN_WARNING("This holochip is used up."))
		return
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/target = A
		var/obj/item/implant/conback/conciousness_pres = target.conciousness_pres
		if(!conciousness_pres)
			to_chat(user, SPAN_WARNING("[target] does not have a conciousness backup."))
			return
		visible_message(SPAN_NOTICE("[user] begins uploading [src] into [target]'s conciousness backup implant..."))
		if(!do_after(user, 35, target))
			return
		conciousness_pres.add_modules(contained_modules)
		used = TRUE
		update_icon()

/obj/item/holochip/command
	tag_color = COMMS_COLOR_COMMAND

/obj/item/holochip/security
	tag_color = COMMS_COLOR_SECURITY

/obj/item/holochip/medical
	tag_color = COLOR_OFF_WHITE

/obj/item/holochip/science
	tag_color = COMMS_COLOR_SCIENCE

/obj/item/holochip/cargo
	tag_color = COMMS_COLOR_SUPPLY

/obj/item/holochip/engineering
	tag_color = COMMS_COLOR_ENGINEER

/obj/item/holochip/medical/suitsensors
	contained_modules = list(/datum/conback_module/crew_monitor)

/obj/item/holochip/engineering/alarm_mon
	contained_modules = list(/datum/conback_module/alarm_monitor)
