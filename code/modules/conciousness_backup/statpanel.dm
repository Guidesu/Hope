//Yes, this is how NIFs do it.
//Yes, I blatantly copied it.
//No, I don't have any regrets.

//Now I also have copied this copy. I also have no regrets. (:

/mob/living/carbon/human/Stat()
	. = ..()
	if(conciousness_pres && statpanel("Conciousness Backup"))
		Setup_Conback()

/mob/living/carbon/human/proc/Setup_Conback()
	var/conback_status = ""
	var/conback_percent = round((conciousness_pres.integrity/initial(conciousness_pres.max_integrity))*100)
	var/conback_energy_percent = round((conciousness_pres.energy/initial(conciousness_pres.max_energy))*100)
	var/nutrition_usage_text
	switch(conciousness_pres.stat)
		if(CONBACK_ONLINE)
			if(conciousness_pres.integrity < 20)
				conback_status = "Service Needed Soon"
			else
				conback_status = "Operating Normally"
		if(CONBACK_LOW_POWER)
			conback_status = "Insufficient Energy!"
		if(CONBACK_DISRUPTED)
			conback_status = "System Failure!"
		else
			throw EXCEPTION(conciousness_pres.stat)
	switch(conciousness_pres.nutrition_usage_setting)
		if(NUTRITION_USAGE_LOW)
			nutrition_usage_text = "Low"
		if(NUTRITION_USAGE_MEDIUM)
			nutrition_usage_text = "Medium"
		if(NUTRITION_USAGE_HIGH)
			nutrition_usage_text = "High"
	conback_status += " (Integrity: [conback_percent]%)"
	conback_status += " (Energy: [conback_energy_percent]%)"
	conback_status += " (Internal fuel cell setting: [nutrition_usage_text])"
	stat("Conciousness Backup Status", conback_status)

	if(conciousness_pres.stat == CONBACK_ONLINE)
		stat("- Modules -", "LMB: Toggle, Shift+LMB: Info/Uninstall")
		for(var/module in conciousness_pres.modules)
			if(!module) continue
			var/datum/conback_module/mod = module
			var/obj/effect/conback_stat/stat_line = mod.stat_line
			stat("[stat_line.module_name]",stat_line.atom_button_text())

// Stat Line Object
/obj/effect/conback_stat
	name = ""
	var/module_name			//Prevents deeper lookups, and the name won't change
	var/datum/conback_module/module	//Reference to our nifsoft
	var/toggleable = FALSE		//Won't change, prevents looking it up deeper

/obj/effect/conback_stat/New(var/datum/conback_module/new_module)
	..()
	module = new_module
	module_name = new_module.name
	name = new_module.name

/obj/effect/conback_stat/Destroy()
	module = null
	return ..()

/obj/effect/conback_stat/proc/atom_button_text()
	name = module.stat_text()
	return src

/obj/effect/conback_stat/Click(var/location, var/control, var/params)
	if(usr != module.owner.wearer) return

	var/list/clickprops = params2list(params)
	var/opts = clickprops["shift"]

	if(opts)
		var/choice = alert("Select an option","[module_name]","Display Info","Cancel","Uninstall")
		switch(choice)
			if("Display Info")
				module.message_user("[module_name]: [module.description]")
			if("Uninstall")
				var/confirm = alert("Really uninstall [module_name]?","Are you sure?","Cancel","Uninstall","Cancel")
				if(confirm == "Uninstall")
					module.uninstall()
	else if(module.activates)
		if(module.active)
			module.deactivate()
		else
			module.activate(module.owner.wearer)
