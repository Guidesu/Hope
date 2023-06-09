//Baseline portable generator. Has all the default handling. Not intended to be used on it's own (since it generates unlimited power).
/obj/machinery/power/port_gen
	name = "Placeholder Generator"	//seriously, don't use this. It can't be anchored without VV magic.
	desc = "A portable generator for emergency backup power"
	icon = 'icons/obj/power.dmi'
	icon_state = "portgen0"
	var/off_icon = "portgen0"
	var/on_icon = "portgen1"
	density = 1
	anchored = 0
	use_power = NO_POWER_USE

	var/active = 0
	var/power_gen = 5000
	var/open = 0
	var/recent_fault = 0
	var/power_output = 1

/obj/machinery/power/port_gen/proc/IsBroken()
	return (stat & (BROKEN|EMPED))

/obj/machinery/power/port_gen/proc/HasFuel() //Placeholder for fuel check.
	return 1

/obj/machinery/power/port_gen/proc/UseFuel() //Placeholder for fuel use.
	return

/obj/machinery/power/port_gen/proc/DropFuel()
	return

/obj/machinery/power/port_gen/proc/handleInactive()
	return

/obj/machinery/power/port_gen/Process()
	if(active && HasFuel() && !IsBroken() && anchored && powernet)
		add_avail(power_gen * power_output)
		UseFuel()
		src.updateDialog()
	else
		active = 0
		handleInactive()
		STOP_PROCESSING(SSmachines, src)

	update_icon()

/obj/machinery/power/powered()
	return 1 //doesn't require an external power source

/obj/machinery/power/port_gen/attack_hand(mob/user as mob)
	if(..())
		return
	if(!anchored)
		return


/obj/machinery/power/port_gen/update_icon()
	if(!active)
		icon_state = initial(icon_state)

/obj/machinery/power/port_gen/examine(mob/user)
	if(!..(user,1 ))
		return
	if(active)
		to_chat(user, SPAN_NOTICE("The generator is on."))
	else
		to_chat(user, SPAN_NOTICE("The generator is off."))

/obj/machinery/power/port_gen/emp_act(severity)
	var/duration = 6000 //ten minutes
	switch(severity)
		if(1)
			stat &= BROKEN
			if(prob(75)) explode()
		if(2)
			if(prob(25)) stat &= BROKEN
			if(prob(10)) explode()
		if(3)
			if(prob(10)) stat &= BROKEN
			duration = 300

	stat |= EMPED
	if(duration)
		spawn(duration)
			stat &= ~EMPED

/obj/machinery/power/port_gen/proc/explode()
	explosion(src.loc, 0, 3, 5, 0)
	qdel(src)

#define TEMPERATURE_DIVISOR 40
#define TEMPERATURE_CHANGE_MAX 20

//A power generator that runs on solid plasma sheets.
/obj/machinery/power/port_gen/pacman
	name = "P.A.C.M.A.N portable generator"
	desc = "A power generator that runs on solid plasma sheets. Rated for 60kW max safe output."

	var/sheet_name = "Plasma Sheets"
	var/sheet_path = /obj/item/stack/material/plasma
	circuit = /obj/item/circuitboard/pacman

	/*
		These values were chosen so that the generator can run safely up to 80 kW
		A full 50 plasma sheet stack should last 20 minutes at power_output = 4
		temperature_gain and max_temperature are set so that the max safe power level is 4.
		Setting to 5 or higher can only be done temporarily before the generator overheats.
	*/
	power_gen = 20000			//Watts output per power_output level
	var/max_power_output = 6	//The maximum power setting without emagging.
	var/max_safe_output = 3		// For UI use, maximal output that won't cause overheat.
	var/time_per_fuel_unit = 96		//fuel efficiency - how long 1 unit of sheet/reagent lasts at power level 1
	var/max_fuel_volume = 100 		//max capacity of the hopper
	var/max_temperature = 300	//max temperature before overheating increases
	var/temperature_gain = 50	//how much the temperature increases per power output level, in degrees per level

	var/sheets = 0			//How many sheets of material are loaded in the generator
	var/sheet_left = 0		//How much is left of the current sheet
	var/temperature = 0		//The current temperature
	var/overheating = 0		//if this gets high enough the generator explodes

	var/use_reagents_as_fuel = FALSE // designed to work with premade classes, rather than for in-game VV editing.
	var/fuel_name // uses reagent id to get the name
	var/fuel_reagent_id = "fuel"

	var/decl/sound_player/gensound

/obj/machinery/power/port_gen/pacman/Initialize()
	. = ..()
	if(anchored)
		connect_to_network()
	if(use_reagents_as_fuel)
		create_reagents(max_fuel_volume)
		fuel_name = GLOB.chemical_reagents_list[fuel_reagent_id]
		desc = "A power generator that runs on [fuel_name]. Rated for [(power_gen * max_safe_output) / 1000] kW max safe output."

/obj/machinery/power/port_gen/pacman/Destroy()
	DropFuel()
	return ..()

/obj/machinery/power/port_gen/pacman/Process()
	if(active && HasFuel() && !IsBroken() && anchored && powernet)
		add_avail(power_gen * power_output)
		UseFuel()
		src.updateDialog()
	else
		active = 0
		handleInactive()
		STOP_PROCESSING(SSmachines, src)
	update_icon()
	updatesound(active)

/obj/machinery/power/port_gen/pacman/proc/updatesound(var/playing)
	if(playing && !gensound)
		gensound.play_looping(src, "generator", 'sound/machines/sound_machines_generator_generator_mid2.ogg', volume = 50*power_output)
	else if(!playing && gensound)
		QDEL_NULL(gensound)

/obj/machinery/power/port_gen/pacman/RefreshParts()
	var/temp_rating = 0
	for(var/obj/item/stock_parts/SP in component_parts)
		if(istype(SP, /obj/item/stock_parts/matter_bin))
			if(!use_reagents_as_fuel)
				max_fuel_volume = SP.rating * SP.rating * 50
			else
				max_fuel_volume = SP.rating * 300
				create_reagents(max_fuel_volume)
		else if(istype(SP, /obj/item/stock_parts/micro_laser) || istype(SP, /obj/item/stock_parts/capacitor))
			temp_rating += SP.rating
	desc = "A power generator that runs on [fuel_name]. Rated for [(power_gen * max_safe_output) / 1000] kW max safe output."


	power_gen = round(initial(power_gen) * (max(2, temp_rating) / 2))

/obj/machinery/power/port_gen/pacman/examine(mob/user)
	..(user)
	to_chat(user, "\The [src] appears to be producing [power_gen*power_output] W.")
	if(!use_reagents_as_fuel)
		to_chat(user, "There [sheets == 1 ? "is" : "are"] [sheets] sheet\s left in the hopper.")

	if(IsBroken())
		to_chat(user, SPAN_WARNING("\The [src] seems to have broken down."))
	if(overheating)
		to_chat(user, SPAN_DANGER("\The [src] is overheating!"))

/obj/machinery/power/port_gen/pacman/HasFuel()
	var/needed_fuel = power_output / time_per_fuel_unit
	if(!use_reagents_as_fuel)
		if(sheets >= needed_fuel - sheet_left)
			return TRUE
	else
		if(reagents.has_reagent(fuel_reagent_id, needed_fuel))
			return TRUE
	return FALSE

//Removes one stack's worth of material or purge all reagents from the generator.
/obj/machinery/power/port_gen/pacman/DropFuel()
	if(sheets)
		var/obj/item/stack/material/S = new sheet_path(loc)
		var/amount = min(sheets, S.max_amount)
		S.amount = amount
		sheets -= amount
	if(use_reagents_as_fuel)
		reagents.clear_reagents()

/obj/machinery/power/port_gen/pacman/UseFuel()

	//how much material are we using this iteration?
	var/needed_fuel = power_output / time_per_fuel_unit
	if(!use_reagents_as_fuel)
		//HasFuel() should guarantee us that there is enough fuel left, so no need to check that
		//the only thing we need to worry about is if we are going to rollover to the next sheet
		if (needed_fuel > sheet_left)
			sheets--
			sheet_left = (1 + sheet_left) - needed_fuel
		else
			sheet_left -= needed_fuel
	else
		reagents.remove_reagent(fuel_reagent_id, needed_fuel)

	//calculate the "target" temperature range
	//This should probably depend on the external temperature somehow, but whatever.
	var/lower_limit = 56 + power_output * temperature_gain
	var/upper_limit = 76 + power_output * temperature_gain

	/*
		Hot or cold environments can affect the equilibrium temperature
		The lower the pressure the less effect it has. I guess it cools using a radiator or something when in vacuum.
		Gives contractors more opportunities to sabotage the generator or allows enterprising engineers to build additional
		cooling in order to get more power out.
	*/
	var/datum/gas_mixture/environment = loc.return_air()
	if (environment)
		var/ratio = min(environment.return_pressure()/ONE_ATMOSPHERE, 1)
		var/ambient = environment.temperature - T20C
		lower_limit += ambient*ratio
		upper_limit += ambient*ratio

	var/average = (upper_limit + lower_limit)/2

	//calculate the temperature increase
	var/bias = 0
	if (temperature < lower_limit)
		bias = min(round((average - temperature)/TEMPERATURE_DIVISOR, 1), TEMPERATURE_CHANGE_MAX)
	else if (temperature > upper_limit)
		bias = max(round((temperature - average)/TEMPERATURE_DIVISOR, 1), -TEMPERATURE_CHANGE_MAX)

	//limit temperature increase so that it cannot raise temperature above upper_limit,
	//or if it is already above upper_limit, limit the increase to 0.
	var/inc_limit = max(upper_limit - temperature, 0)
	var/dec_limit = min(temperature - lower_limit, 0)
	temperature += between(dec_limit, rand(-7 + bias, 7 + bias), inc_limit)

	if (temperature > max_temperature)
		overheat()
	else if (overheating > 0)
		overheating--

/obj/machinery/power/port_gen/pacman/handleInactive()
	var/cooling_temperature = 20
	var/datum/gas_mixture/environment = loc.return_air()
	if (environment)
		var/ratio = min(environment.return_pressure()/ONE_ATMOSPHERE, 1)
		var/ambient = environment.temperature - T20C
		cooling_temperature += ambient*ratio

	if (temperature > cooling_temperature)
		var/temp_loss = (temperature - cooling_temperature)/TEMPERATURE_DIVISOR
		temp_loss = between(2, round(temp_loss, 1), TEMPERATURE_CHANGE_MAX)
		temperature = max(temperature - temp_loss, cooling_temperature)
		src.updateDialog()

	if(overheating)
		overheating--

/obj/machinery/power/port_gen/pacman/proc/overheat()
	overheating++
	if (overheating > 60)
		explode()

/obj/machinery/power/port_gen/pacman/explode()
	//Vapourize all the plasma
	//When ground up in a grinder, 1 sheet produces 20 u of plasma -- Chemistry-Machinery.dm
	//1 mol = 10 u? I dunno. 1 mol of carbon is definitely bigger than a pill
	var/plasma = 0
	if(!use_reagents_as_fuel)
		plasma = (sheets+sheet_left)*20
		sheets = 0
		sheet_left = 0
	else
		plasma = reagents.get_reagent_amount(fuel_reagent_id)*20
		reagents.clear_reagents()

	var/datum/gas_mixture/environment = loc.return_air()
	if (environment)
		environment.adjust_gas_temp("plasma", plasma/10, temperature + T0C)

	..()

/obj/machinery/power/port_gen/pacman/emag_act(var/remaining_charges, var/mob/user)
	if (active && prob(25))
		explode() //if they're foolish enough to emag while it's running

	if (!emagged)
		emagged = 1
		return 1

/obj/machinery/power/port_gen/pacman/attackby(var/obj/item/I, var/mob/user)

	if(default_part_replacement(I, user))
		return

	if(!use_reagents_as_fuel && istype(I, sheet_path))
		var/obj/item/stack/addstack = I
		var/amount = min((max_fuel_volume - sheets), addstack.amount)
		if(amount < 1)
			to_chat(user, "\blue The [src.name] is full!")
			return
		to_chat(user, "\blue You add [amount] sheet\s to the [src.name].")
		sheets += amount
		addstack.use(amount)
		updateUsrDialog()
		return

	if(active)
		to_chat(user, SPAN_NOTICE("You can't work with [src] while its running!"))

	else


		var/list/usable_qualities = list(QUALITY_BOLT_TURNING, QUALITY_SCREW_DRIVING)

		if(panel_open && circuit)
			usable_qualities += QUALITY_PRYING

		var/tool_type = I.get_tool_type(user, usable_qualities, src)
		switch(tool_type)

			if(QUALITY_BOLT_TURNING)
				if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_BOLT_TURNING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
					playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
					if(anchored)
						to_chat(user, SPAN_NOTICE("You unsecure the [src] from the floor!"))
						anchored = FALSE
					else
						if(istype(get_turf(src), /turf/space)) return //No wrenching these in space!
						to_chat(user, SPAN_NOTICE("You secure the [src] to the floor!"))
						anchored = TRUE

					if(anchored)
						connect_to_network()
					else
						disconnect_from_network()

					return

			if(QUALITY_PRYING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_HARD, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You remove the components of \the [src] with [I]."))
					dismantle()
				return TRUE

			if(QUALITY_SCREW_DRIVING)
				var/used_sound = panel_open ? 'sound/machines/Custom_screwdriveropen.ogg' :  'sound/machines/Custom_screwdriverclose.ogg'
				if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC, instant_finish_tier = 30, forced_sound = used_sound))
					updateUsrDialog()
					panel_open = !panel_open
					to_chat(user, SPAN_NOTICE("You [panel_open ? "open" : "close"] the maintenance hatch of \the [src] with [I]."))
					update_icon()
				return TRUE


			if(ABORT_CHECK)
				return


/obj/machinery/power/port_gen/pacman/attack_hand(mob/user)
	..()
	if (!anchored)
		return
	ui_interact(user)

/obj/machinery/power/port_gen/pacman/update_icon()
	if(active)
		icon_state = "[on_icon]"
	else
		icon_state = "[off_icon]"
/obj/machinery/power/port_gen/pacman/super
	name = "S.U.P.E.R.P.A.C.M.A.N portable generator"
	desc = "A power generator that utilizes uranium sheets as fuel. Can run for much longer than the standard PACMAN type generators. Rated for 60kW max safe output."
	icon_state = "portgen3"
	off_icon = "portgen3"
	on_icon = "portgen3_1"
	sheet_path = /obj/item/stack/material/uranium
	sheet_name = "Uranium Sheets"
	time_per_fuel_unit = 576 //same power output, but a 50 sheet stack will last 2 hours at max safe power
	circuit = /obj/item/circuitboard/pacman/super

/obj/machinery/power/port_gen/pacman/super/UseFuel()
	//produces a tiny amount of radiation when in use
	if (prob(2*power_output))
		PulseRadiation(src, 1, 5) //should amount to ~5 rads per minute at max safe power
	..()

/obj/machinery/power/port_gen/pacman/super/explode()
	//a nice burst of radiation
	var/rads = 50 + (sheets + sheet_left)*1.5
		//should really fall with the square of the distance, but that makes the rads value drop too fast
		//I dunno, maybe physics works different when you live in 2D -- SM radiation also works like this, apparently
	PulseRadiation(src, max(20, rads), 10)

	explosion(src.loc, 3, 3, 5, 3)
	qdel(src)

/obj/machinery/power/port_gen/pacman/mrs
	name = "M.R.S.P.A.C.M.A.N portable generator"
	desc = "An advanced power generator that runs on tritium. Rated for 75kW max safe output."
	icon_state = "portgen2"
	off_icon = "portgen2"
	on_icon = "portgen2_1"
	sheet_path = /obj/item/stack/material/tritium
	sheet_name = "Tritium Sheets"
	max_safe_output = 3

	//I don't think tritium has any other use, so we might as well make this rewarding for players
	//max safe power output (power level = 8) is 200 kW and lasts for 1 hour - 3 or 4 of these could power the station
	power_gen = 25000 //watts
	max_power_output = 10
	max_safe_output = 8
	time_per_fuel_unit = 576
	max_temperature = 800
	temperature_gain = 90
	circuit = /obj/item/circuitboard/pacman/mrs

/obj/machinery/power/port_gen/pacman/mrs/explode()
	//no special effects, but the explosion is pretty big (same as a supermatter shard).
	explosion(src.loc, 3, 6, 12, 16, 1)
	qdel(src)

/obj/machinery/power/port_gen/pacman/camp
	name = "C.A.M.P.E.R.P.A.C.M.A.N portable generator"
	desc = "This power generator got its name from its low power rating through burning wood as fuel. It tends to be used while people go out camping. Rated for 36kW max safe output."
	icon_state = "portgen3"
	off_icon = "portgen3"
	on_icon = "portgen3_1"
	sheet_path = /obj/item/stack/material/wood
	sheet_name = "Wooden Planks"

	//Wood is everyware here, this is is rather weak
	power_gen = 12000 //watts
	time_per_fuel_unit = 80
	temperature_gain = 20
	circuit = /obj/item/circuitboard/pacman/camp

/obj/machinery/power/port_gen/pacman/camp/explode()
	//low explosion effects, this is rather safe.
	explosion(src.loc, 0, 0, 3, 1)
	qdel(src)

/obj/machinery/power/port_gen/pacman/miss
	name = "M.I.S.S.P.A.C.M.A.N portable generator"
	desc = "Using a girl's best friend. Rated for 67.5kW max safe output."
	icon_state = "portgen2"
	off_icon = "portgen2"
	on_icon = "portgen2_1"
	sheet_path = /obj/item/stack/material/diamond
	sheet_name = "Diamond Sheets"

	//diamonds are just as common as any other mat*
	power_gen = 22500 //watts
	time_per_fuel_unit = 284 //3x longer then plasma
	temperature_gain = 70
	circuit = /obj/item/circuitboard/pacman/miss

/obj/machinery/power/port_gen/pacman/miss/explode()
	//low explosion effects.
	explosion(src.loc, 1, 1, 3, 3)
	qdel(src)

// this generator works with reagent instead of sheets.
/obj/machinery/power/port_gen/pacman/diesel
	name = "diesel generator"
	desc = "The good old 4 stroke engine. Rated for 48kW max safe output."
	icon = 'icons/obj/machines/excelsior/generator.dmi'
	icon_state = "base"
	circuit = /obj/item/circuitboard/diesel
	max_fuel_volume = 300
	power_gen = 16000 // produces 20% less watts output per power level setting.
	time_per_fuel_unit = 12
	sheet_name = "Welder Fuel"

	reagent_flags = OPENCONTAINER
	use_reagents_as_fuel = TRUE

/obj/machinery/power/port_gen/pacman/diesel/update_icon()
	cut_overlays()
	if(active)
		add_overlay("on")
		if(HasFuel())
			add_overlay("rotor_working")
			add_overlay("[max(round(reagents.total_volume / reagents.maximum_volume, 0.25) * 100, 25)]")
		else
			add_overlay("0")
	else
		add_overlay("off")

//anchored versions, for mapping and spawning purposes
/obj/machinery/power/port_gen/pacman/diesel/anchored
	anchored = 1

/obj/machinery/power/port_gen/pacman/mrs/anchored
	anchored = 1

/obj/machinery/power/port_gen/pacman/super/anchored
	anchored = 1

/obj/machinery/power/port_gen/pacman/anchored
	anchored = 1

/obj/machinery/power/port_gen/pacman/scrap/anchored
	anchored = 1

//tgui time
/obj/machinery/power/port_gen/pacman/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "PortableGenerator", name)
		ui.open()

/obj/machinery/power/port_gen/pacman/ui_data()
	var/data = list()

	data["active"] = active
	data["sheet_name"] = capitalize(sheet_name)
	data["sheets"] = sheets
	data["stack_percent"] = round(sheet_left * 100, 0.1)

	data["anchored"] = anchored
	data["connected"] = (powernet == null ? 0 : 1)
	data["ready_to_boot"] = anchored && HasFuel()
	data["power_generated"] = display_power(power_gen)
	data["power_output"] = display_power(power_gen * power_output)
	data["power_available"] = (powernet == null ? 0 : display_power(avail()))
	data["current_heat"] = src.temperature
	. = data

/obj/machinery/power/port_gen/pacman/ui_act(action, params)
	. = ..()
	if(.)
		return
	switch(action)
		if("toggle_power")
			TogglePower()
			. = TRUE

		if("eject")
			if(!active)
				DropFuel()
				. = TRUE

		if("lower_power")
			if (power_output > 1)
				power_output--
				. = TRUE

		if("higher_power")
			if (power_output < max_power_output || (emagged && power_output < round(max_power_output*2.5)))
				power_output++
				. = TRUE

/obj/machinery/power/port_gen/pacman/proc/TogglePower()
	if(active)
		active = FALSE
	else if(!active && HasFuel() && !IsBroken())
		active = TRUE
		START_PROCESSING(SSmachines, src)
	updatesound(active)
	update_icon()
//diesel gen special ui_data
/obj/machinery/power/port_gen/pacman/diesel/ui_data()
	var/data = list()

	data["active"] = active
	data["sheet_name"] = capitalize(sheet_name)
	//reagents do not obey the same rules as sheets on gens, so we show the tank rather than the current sheet being consumed
	data["sheets"] = reagents.total_volume
	data["stack_percent"] = round((reagents.total_volume / reagents.maximum_volume) * 100, 0.1)

	data["anchored"] = anchored
	data["connected"] = (powernet == null ? 0 : 1)
	data["ready_to_boot"] = anchored && HasFuel()
	data["power_generated"] = display_power(power_gen)
	data["power_output"] = display_power(power_gen * power_output)
	data["power_available"] = (powernet == null ? 0 : display_power(avail()))
	data["current_heat"] = src.temperature
	. = data
