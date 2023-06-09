//snowflake guns for xenoarch because you can't override the update_icon() proc inside the giant mess that is find creation
//energy guns
/obj/item/gun/energy/cog/xenoarch
	name = "Fossilised Gun"
	icon = 'icons/obj/xenoarchaeology.dmi'
	item_state_slots = null
	icon_contained = FALSE
	charge_cost = 200
	self_recharge = TRUE
	projectile_type = /obj/item/projectile/beam/tesla/shotgun // thats right. Its a shotgun cog.
	allow_similacrum_mods = FALSE

/obj/item/gun/energy/cog/xenoarch/refresh_upgrades()
	return

/obj/item/gun/energy/cog/xenoarch/update_icon()
	return

/obj/item/gun/energy/xray/xenoarch
	name = "Fossilised Gun"
	icon = 'icons/obj/xenoarchaeology.dmi'
	item_state_slots = null
	icon_contained = FALSE
	self_recharge = TRUE

/obj/item/gun/energy/xray/xenoarch/refresh_upgrades()
	return

/obj/item/gun/energy/xray/xenoarch/update_icon()
	return

/obj/item/gun/energy/captain/xenoarch
	name = "Fossilised Gun"
	icon = 'icons/obj/xenoarchaeology.dmi'
	item_state_slots = null
	icon_contained = FALSE
	allow_similacrum_mods = FALSE

/obj/item/gun/energy/captain/xenoarch/refresh_upgrades()
	return

/obj/item/gun/energy/captain/xenoarch/update_icon()
	return

//physical projectiles
/obj/item/gun/projectile/revolver/xenoarch
	name = "Fossilised Gun"
	icon = 'icons/obj/xenoarchaeology.dmi'
	max_shells = 12

/obj/item/gun/projectile/revolver/xenoarch/refresh_upgrades()
	return

/obj/item/gun/projectile/revolver/xenoarch/update_icon()
	return

/obj/item/gun/projectile/revolver/sixshot/xenoarch
	name = "Fossilized Gun"
	icon = 'icons/obj/xenoarchaeology.dmi'
	max_shells = 4
	damage_multiplier = 1.2
	saw_off = FALSE

/obj/item/gun/projectile/revolver/sixshot/xenoarch/refresh_upgrades()
	return

/obj/item/gun/projectile/revolver/sixshot/xenoarch/update_icon()
	return

/obj/item/gun/projectile/boltgun/heavysniper/xenoarch
	name = "Fossilized Gun"
	icon = 'icons/obj/xenoarchaeology.dmi'
	damage_multiplier = 1.5

/obj/item/gun/projectile/boltgun/heavysniper/xenoarch/refresh_upgrades()
	return

/obj/item/gun/projectile/boltgun/heavysniper/xenoarch/update_icon()
	return
