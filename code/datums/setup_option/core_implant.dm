/datum/category_group/setup_option_category/core_implant
	name = "Core implant"
	category_item_type = /datum/category_item/setup_option/core_implant

/datum/category_item/setup_option/core_implant
	var/implant_type
	var/implant_organ_type

/datum/category_item/setup_option/core_implant/get_icon()
	var/obj/item/implant/core_implant/CI = implant_type
	if(CI)
		return icon(initial(CI.icon),initial(CI.icon_state))


/*
/datum/category_item/setup_option/core_implant/conback
	name = "Conciousness Backup Implant"
	desc = "An Innovation in the fields of neural networking and biological technology!<br>\
	This device allows saving an in-depth DNA profile of its user,<br>\
	but also acts as a 'conciousness backup', preserving the user's concious in a dormant state post-death!<br>\
	Brought to you by Liberty Group, remain free and indepdendent."
	implant_type = /obj/item/implant/conback
	allow_modifications = TRUE

/datum/category_item/setup_option/core_implant/conback/apply(mob/living/carbon/human/character)
	if(character.mind.assigned_role != "Robot")	// Checks if a cyborg is the one being implanted.
		character.create_conback()
*/
