//Random cheap bad pistol
/obj/item/gun/projectile/widowmaker
	name = "\"Glass Widow\" compact pistol"
	desc = "An old bulky pistol designed to be used small sport. Uses 9mm rounds."
	icon = 'icons/obj/guns/projectile/widowmaker.dmi'
	icon_state = "widowmaker"
	item_state = "widowmaker"
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	silenced = 0
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTIC = 6)
	price_tag = 80
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	damage_multiplier = 0.8
	init_recoil = HANDGUN_RECOIL(0.2)
	serial_type = "Car-Van"

	wield_delay = 0 SECOND
	gun_parts = list(/obj/item/part/gun/frame/widowmaker = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/widowmaker
	name = "Glass Widow frame"
	desc = "A Glass Widow pistol frame. Concealable yet anemic yet fast."
	icon_state = "frame_clarissa"
	result = /obj/item/gun/projectile/widowmaker
	resultvars = list(/obj/item/gun/projectile/widowmaker)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol)

/obj/item/gun/projectile/widowmaker/preloaded

/obj/item/gun/projectile/widowmaker/preloaded/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

/obj/item/gun/projectile/clarissa/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

