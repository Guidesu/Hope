/obj/item/gun/projectile/automatic/broz
	name = "\"Broz\" SMG"
	desc = "A long-time produced weapon by various companies, guerilla groups, and anti-government gun fantatics galaxy-wide.\
			It's not handmade, but it's definetly not factory made. Likely made in a basement workshop with a lathe. Chambered in 9mm."
	icon = 'icons/obj/guns/projectile/broz.dmi'
	icon_state = "broz"
	item_state = "broz"
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	caliber = CAL_PISTOL
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	ammo_type = /obj/item/ammo_casing/pistol_35
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL|MAG_WELL_SMG
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5, MATERIAL_WOOD = 12)
	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY,
		)
	can_dual = 1
	damage_multiplier = 1
	penetration_multiplier = 0.8
	init_recoil = SMG_RECOIL(1)
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	serial_type = "INDEX"		//No known creator; made in basements. Literally.
	serial_shown = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	gun_parts = list(/obj/item/part/gun/frame/borz = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/smg/steel = 1, /obj/item/part/gun/barrel/pistol/steel = 1)

	wield_delay = 0 // No delay for this , its litteraly a junk gun

/obj/item/part/gun/frame/borz
	name = "Borz frame"
	desc = "A Borz SMG. It's not handmade, but.. it's definetely not quality made either."
	icon_state = "frame_luty"
	matter = list(MATERIAL_STEEL = 5)
	resultvars = list(/obj/item/gun/projectile/automatic/borz)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/pistol)
