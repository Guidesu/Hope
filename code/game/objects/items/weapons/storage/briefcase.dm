/obj/item/storage/briefcase
	name = "briefcase"
	desc = "A sturdy briefcase made of authentic faux-leather."
	icon_state = "briefcase"
	item_state = "briefcase"
	flags = CONDUCT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_BULKY //Cant normally bag this
	max_w_class = ITEM_SIZE_NORMAL //We can fit anything smaller then us
	max_storage_space = 20 //Its a big case
	matter = list(MATERIAL_BIOMATTER = 8, MATERIAL_PLASTIC = 4)
	price_tag = 90

	cant_hold = list(/obj/item/storage/pouch,
					 /obj/item/storage/firstaid,
					 /obj/item/storage/toolbox,
					 /obj/item/storage/briefcase,
					 /obj/item/storage/secure/briefcase) //No more funky stacking pomches
