/obj/structure/ominous
	name = "ominous generator"
	icon_state = "ominous"
	desc = "It looks like an ancient and strange generator."
	icon = 'icons/obj/machines/excelsior/objects.dmi'
	var/cooldown = FALSE
	var/entropy_value = 3

/obj/structure/ominous/attack_hand(mob/living/user as mob)
	var/last_use

	if(world.time < last_use + 46 SECONDS)
		return
	last_use = world.time
	emp_in(src.loc, 1, 1, 0)

/obj/structure/ominous/proc/emp_in(turf/epicenter, heavy_range, light_range, log=0)
	for(var/mob/M in range(heavy_range, epicenter))
		playsound(loc, 'sound/effects/EMPulse.ogg')

	for(var/atom/T in range(light_range, epicenter))
		var/distance = get_dist(epicenter, T)
		if(distance <= heavy_range)
			T.emp_act(1)
	return TRUE

/obj/structure/ominous/emitter/proc/shoot()
	if(shooting == FALSE)
		shooting = TRUE
		while(cooldown < 80)
			cooldown++
			sleep(rand(1,2))
			var/obj/item/projectile/beam/emitter/A = new /obj/item/projectile/beam/emitter( src.loc )
			A.damage_types = list(BURN = round(2000/DAMAGE_POWER_TRANSFER))
			A.launch( get_step(src.loc, pick(SOUTH, NORTH, WEST, EAST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)) )
		cooldown = FALSE
	shooting = FALSE

/obj/structure/ominous/emitter
	var/shooting = FALSE

/obj/structure/ominous/emitter/attack_hand(mob/living/user as mob)
	shoot()

/obj/structure/ominous/teleporter

/obj/structure/ominous/teleporter/proc/teleport()
	for(var/mob/living/carbon/human/H in range(7, src))
		go_to_bluespace(get_turf(src), entropy_value, FALSE, H, locate(x + rand(-14, 14), y + rand(-14, 14), z))

/obj/structure/ominous/teleporter/attack_hand(mob/living/user as mob)
	var/last_use

	if(world.time < last_use + 66 SECONDS)
		return
	last_use = world.time
	teleport()

/obj/structure/invislight
	name = "invisible light"
	desc = "You should not be able to see this. Contact the nearest bluespace tech."
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislight/outside
	name = "outdoors invisible light"

/obj/structure/invislight/outside/New()
	if(SSlighting.isnight)
		qdel(src)
	. = ..()

/obj/structure/invislight/New()
	set_light(7, 5, "#999999")
	. = ..()

/obj/structure/invislightsmall
	name = "small invisible light"
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislightsmall/outside
	name = "outdoors small invisible light"

/obj/structure/invislightsmall/outside/New()
	if(SSlighting.isnight)
		qdel(src)
	. = ..()

/obj/structure/invislightsmall/New()
	set_light(1, 1, "#999999")
	. = ..()
