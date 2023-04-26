/*

	Artic storm is a really severe event that forces everyone to flee into shelter or a similar
	protected areas. Anyone caught outside will recieve rapid cooling,
	and will die without medical attention, or perpared ways to deal with the cold

*/

/datum/storyevent/snow_storm
	id = "snow_storm"
	name = "snow_storm"


	event_type = /datum/event/snow_storm
	event_pools = list(EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE)

	tags = list(TAG_SCARY, TAG_COMMUNAL)


/datum/event/snow_storm
	var/const/enterBelt				= 55
	var/const/windchillIntervall 	= 5
	var/const/leaveBelt				= 165
	startWhen						= 2
	announceWhen					= 1
	endWhen							= 220
	var/postStartTicks 				= 0
	var/snowstorm_temp = 233.15 //-40c

/datum/event/snow_storm/announce()

/datum/event/snow_storm/start()
	SSweather.run_weather(/datum/weather/artic_storm)

/datum/event/snow_storm/tick()
	if(activeFor == enterBelt)
		chillout()
		for(var/datum/weather/artic_storm/ARTIC in SSweather.processing)
			ARTIC.start()

	if(activeFor >= enterBelt && activeFor <= leaveBelt)
		postStartTicks++

	if(postStartTicks == windchillIntervall)
		postStartTicks = 0
		chillout()

	else if(activeFor == leaveBelt)
		for(var/datum/weather/artic_storm/ARTIC in SSweather.processing)
			ARTIC.wind_down()

/datum/event/snow_storm/proc/chillout(datum/gas_mixture/environment)
	for(var/mob/living/carbon/human/C in GLOB.living_mob_list)
		var/area/A = get_area(C)
		if(!A)
			continue

		if(!A.allows_weather_of_snow)
			continue

		if(ishuman(C))
			var/mob/living/carbon/human/H = C
			//log_debug("[H.name] found!")
			if(!environment)
				environment = H.loc.return_air()
			if(!environment)
				log_debug("[H.name] has no enviroment!")
				return
			//Body temperature adjusts depending on surrounding atmosphere based on your thermal protection (convection)
			var/temp_adj = 0
			if(snowstorm_temp < H.bodytemperature) //If were colder then storm we lower are temp down to that
				var/thermal_protection = H.get_cold_protection(snowstorm_temp) //This returns a 0 - 1 value, which corresponds to the percentage of protection based on what you're wearing and what you're exposed to.
				//log_debug("[H.name] thermal_protection [thermal_protection]!")
				if(thermal_protection < 1)
					temp_adj = (1-thermal_protection) * ((snowstorm_temp - H.bodytemperature) / BODYTEMP_COLD_DIVISOR)	//this will be negative
					H.frost += 2 - thermal_protection
			//Use heat transfer as proportional to the gas density. However, we only care about the relative density vs standard 101 kPa/20 C air. Therefore we can use mole ratios
			var/relative_density = environment.total_moles / MOLES_CELLSTANDARD
			H.bodytemperature += between(BODYTEMP_COOLING_MAX, temp_adj*relative_density, BODYTEMP_HEATING_MAX)
			//log_debug("[H.name] temp_adj [temp_adj]!")



//Snow Storm
/datum/weather/artic_storm
	name = "artic storm"
	desc = "A windy, cold storm kicking up snow beds and relaying them."

	telegraph_duration = 300 //I guess?
	telegraph_overlay = "light_snow"
	telegraph_message = "<span class='danger'>The air begins to grow cold.</span>"

	weather_message = "<span class='userdanger'><i>You feel artic wind wash over you! Find shelter!</i></span>"
	weather_overlay = "snow_storm"
	weather_duration_lower = 0
	weather_duration_upper = 0
	weather_color = "blue"
	weather_sound = 'sound/misc/bloblarm.ogg'

	end_duration = 100
	end_message = "<span class='notice'>The air seems to be stilling again.</span>"

	area_type = /area
	force_areas = TRUE
	areas_affectares = list()

	immunity_type = "cold" //Unused
	var/snowstorm_temp = 233.15 //-40c


/datum/weather/artic_storm/weather_act(mob/living/carbon/human/L, datum/gas_mixture/environment)
	return //Dosnt do anything

/datum/weather/artic_storm/telegraph()
	..()

	for(var/mob/living/carbon/human/C in GLOB.player_list)
		var/area/A = get_area(C)
		if(!A)
			continue

		if(!A.allows_weather_of_snow)
			continue

		if(telegraph_message)
			to_chat(C, telegraph_message)
		if(telegraph_sound)
			SEND_SOUND(C, sound(telegraph_sound))
