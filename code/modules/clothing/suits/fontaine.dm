
/obj/item/clothing/suit/storage/scavengerarmor
	name = "Fontaine plate carrier"
	desc = "A rigged yet sturdy Fontaine branded armor. Strong and protective as most vests, it is made entirely from reclaimed materials. It even has pockets as well as room for additional plates of armor to be added."
	icon_state = "fontaine_platecarrier"
	item_state = "fontaine_platecarrier"
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 2
	stiffness = MEDIUM_STIFFNESS
	equip_delay = 2 SECONDS
	armor_list = list(
		melee = 30, //Not the best armor, but easily crafted and adds some utility with decent protection all round.
		bullet = 20,
		energy = 25,
		bomb = 30,
		bio = 0,
		rad = 0
	)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_GLASS = 10, MATERIAL_STEEL = 10, MATERIAL_PLATINUM = 2)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	siemens_coefficient = 0.7

/* Not used for now; no alt-style armors rn.
/obj/item/clothing/suit/storage/scavengerarmor/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["scavenger armor"] = "scav_armor"
	options["alt scavenger armor"] = "alt_scavenger"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1
*/

/obj/item/clothing/suit/storage/scavengerarmor/fullbody
	name = "Fontaine full-body plate carrier"
	desc = "A set of Fontaine brand armor with additional armour plating installed. Though the haphazardly-made plates are heavy and don't exactly excel against projectiles, they shrug off melee attacks nicely."
	icon_state = "fontaine_fullbody_platecarrier"
	item_state = "fontaine_fullbody_platecarrier"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	max_upgrades = 1
	armor_list = list(
		melee = 50, //A bit worse than riot armour
		bullet = 25,
		energy = 25,
		bomb = 30,
		bio = 0,
		rad = 0
	)
	slowdown = 0.9

/obj/item/clothing/suit/greatcoat/trapper
	name = "Fontaine trapper greatcoat"
	desc = "A Fontaine branded woolen coat made of fleece, hide, and wool of hunted or domesticated animals. It sports some light plating material between its layers, providing some basic protection. At least it's pretty warm though!"
	icon_state = "trapper_coat"
	item_state = "trapper_coat"
	blood_overlay_type = "coat"
	permeability_coefficient = 0.50
	max_upgrades = 2
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	armor_list = list( //thicker material so +5 boost (from base 10) to armor values, but lower rad/same bomb since not metal lined. Maybe add in minor slowdown if needed -Dongels
		melee = 15,
		bullet = 15,
		energy = 15,
		bomb = 10,
		bio = 100,
		rad = 50
	)

/obj/item/clothing/suit/armor/shepherd
	name = "Fontaine shepherd armored coat"
	desc = "A Fontaine branded armored coat made of fleece, synthetic material and lined with light-weight armored fabric. It sports some advanced plating ."
	icon_state = "shepherd_coat"
	item_state = "shepherd_coat"
	max_upgrades = 1
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor_list = list(
		melee = 45,
		bullet = 35,
		energy = 30,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.6
