/obj/item/gun/projectile/boltgun/lever/shotgun
	name = "\"Western\" repeating shotgun"
	desc = "A lever action rebored to take 12gauge shotgun shells. Perfect for those acustomed to horseback or 'on-the-move' fire."
	icon = 'icons/obj/guns/projectile/western.dmi'
	icon_state = "western"
	item_state = "western"
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_SHOTGUN
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	max_shells = 6
	price_tag = 650
	init_recoil = HMG_RECOIL(1.0)
	damage_multiplier = 0.8
	penetration_multiplier = 0.9
	zoom_factors = list()
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 6, MATERIAL_PLASTEEL = 7)
	serial_type = "ML"
	extra_bulk = -2
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE)


/obj/item/gun/projectile/boltgun/lever/shotgun/sawn
	name = "sawn \"Western\" repeating shotgun"
	desc = "A lever action rebored to take 12 gauge shotgun shells. It appears someone has sawn down its stock and barrel."
	icon = 'icons/obj/guns/projectile/sawn/western.dmi'
	icon_state = "western"
	item_state = "western"
	w_class = ITEM_SIZE_SMALL
	price_tag = 450
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 4, MATERIAL_PLASTEEL = 5)
