
//wild plants, manually added in by mappers using spawners
/obj/structure/flora/wild
	name = "wild plant base item"
	desc = "If you see this, something's wrong."
	icon = 'icons/obj/flora/medicinalflora.dmi'
	anchored = TRUE
	density = FALSE
	var/fruit

/obj/structure/flora/wild/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING && user.stats.getPerk(PERK_MASTER_HERBALIST))
		to_chat(user, SPAN_NOTICE("You start to harvest the [src]."))
		if(I.use_tool(user, src, WORKTIME_QUICK, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
			new fruit(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest the [src]."))
			qdel(src)
			return
	else
		to_chat(user, SPAN_NOTICE("You don't know how to harvest this!"))
		return

/obj/structure/flora/wild/bruteloss
	name = "Taiyan berry plant"
	desc = "A grouping of Taiyan berry plants, known for their extract possessing a beneficial regenerative effect on cuts and bruises, it could be harvested with the proper knowledge."
	icon_state = "taiyan_plant2"
	fruit = /obj/item/reagent_containers/food/snacks/wild/brute

/obj/structure/flora/wild/burnloss
	name = "Saniak crawler clump"
	desc = "A mass of Saniak crawler moss, clumps like these are known to secrete a burn-healing chemical agent, it could be harvested with the proper knowledge."
	icon_state = "saniak_moss2"
	fruit = /obj/item/reagent_containers/food/snacks/wild/burn

/obj/structure/flora/wild/toxinloss
	name = "Voyea plant"
	desc = "A pair of Voyea plants, their stiff stalks are notorious for their extract used to treat poisoning, it could be harvested with the proper knowledge."
	icon_state = "voyea_plant2"
	fruit = /obj/item/reagent_containers/food/snacks/wild/toxin

/obj/structure/flora/wild/oxyloss
	name = "Yhanea shroom"
	desc = "A wild Yhanea shroom, though safe to eat, they have little nutritional value, and are most commonly used for their beneficial effect on the body's oxygenation, it could be harvested with the proper knowledge."
	icon_state = "yhanea_shroom2"
	fruit = /obj/item/reagent_containers/food/snacks/wild/oxyloss

