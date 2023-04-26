/obj/item/gun/projectile/revolver/detective
	name = "\"Wrist Breaker\" revolver"
	desc = "A somewhat rare revolver found in antique and specialty shops all along the galatic rim. A 6.5mm revolver able to contain 5 rounds. \
			As its common name suggests, the \"Wrist Breaker\" is commonly know for its high recoil but capability of packing a high-velocity PUNCH!"
	icon = 'icons/obj/guns/projectile/wristbreaker.dmi'
	fire_sound = 'sound/weapons/guns/fire/9mm_revolver.ogg'
	icon_state = "wristbreaker"
	item_state = "wristbreaker"
	drawChargeMeter = FALSE
	w_class = ITEM_SIZE_SMALL
	max_shells = 5
	caliber = CAL_LRIFLE				//WRIST DESTROYER!!!
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_STEEL = 8, MATERIAL_WOOD = 6)
	price_tag = 800
	damage_multiplier = 1.15
	penetration_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(1.2)	//Ouch-oofie my wrists ):
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_SILENCABLE)
	serial_type = "LG"

	wield_delay = 0 SECOND //god it's bad
	gun_parts = list(/obj/item/part/gun/frame/breaker = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/part/gun/frame/breaker
	name = "Wrist Breaker frame"
	desc = "A Wrist Breaker revolver frame. For when you want to- well.. it's in the name.."
	icon_state = "frame_havelock"
	result = /obj/item/gun/projectile/revolver/detective
	resultvars = list(/obj/item/gun/projectile/revolver/detective)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/pistol)
