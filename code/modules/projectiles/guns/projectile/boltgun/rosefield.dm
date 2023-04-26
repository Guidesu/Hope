/obj/item/gun/projectile/boltgun/rosefield
	name = "\"Rosefield\" boltgun"
	desc = "A hunters best friend, especially for hunting small game! \
			Chambered in 6.5mm this versetile gun can easily preform in most enviorments."
	icon = 'icons/obj/guns/projectile/rosefield.dmi'
	icon_state = "rosefield"
	item_state = "rosefield"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	caliber = CAL_SRIFLE
	fire_delay = 2
	damage_multiplier = 1.2
	penetration_multiplier  = 1.4
	extra_damage_mult_scoped = 0.4		//Not default scoped but we should encourage these rifles heavily.
	init_recoil = HMG_RECOIL(0.6)
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 10
	fire_sound = 'sound/weapons/guns/fire/mosin.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	fire_sound_silenced = 'sound/weapons/guns/fire/silenced_rifle.ogg' // More cohesive sound, still loud for its caliber
	matter = list(MATERIAL_WOOD = 16, MATERIAL_WOOD = 6)
	price_tag = 600
	sharp = FALSE	//Womp-womp
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE, GUN_SILENCABLE)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/rosefield/sawn
	serial_type = "Car-Van"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig
	gun_parts = list(/obj/item/part/gun/frame/boltgun = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/srifle = 1)

/obj/item/gun/projectile/boltgun/rosefield/sawn //subtype for code
	name = "\"Rosefield\" obrez boltgun"
	desc = "A crudly mangled and sawn-down 6.5mm bolt action rifle."
	icon = 'icons/obj/guns/projectile/sawnoff/rosefield.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	force = WEAPON_FORCE_NORMAL
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	price_tag = 75
	sharp = 0
	init_recoil = HMG_RECOIL(0.8)
	penetration_multiplier = 0.5
	damage_multiplier = 0.9
	fire_delay = 4
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE)
	matter = list(MATERIAL_WOOD = 10, MATERIAL_PLASTIC = 4)
	saw_off = FALSE
	bolt_training = FALSE //Training didnt cover obrez
	gun_parts = list(/obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/lrifle = 1)
