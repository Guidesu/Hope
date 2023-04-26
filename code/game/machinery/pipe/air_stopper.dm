//Used to stop massive flooding of air in 2 areas, typically over doors
/obj/machinery/air_stopper
	name = "Air Restictor"
	desc = "An simple air system that prevents proper ciculation bettewn itself making a almost perfect air door, requires a bit of power to maintain."
	icon_state = null
	use_power = IDLE_POWER_USE
	idle_power_usage = 1000
	active_power_usage = 2000

/obj/machinery/air_stopper/attack_hand()
	return

/obj/machinery/air_stopper/attackby(I as obj, mob/living/user)
	return

/obj/machinery/air_stopper/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if((stat & (NOPOWER|BROKEN)) || !anchored)
		return TRUE

	if(air_group)
		return FALSE
	else
		return TRUE
