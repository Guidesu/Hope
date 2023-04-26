/datum/job/shepherd
	title = "Field Shepherd"
	flag = SHEPHERD
	head_position = 1
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Liberty Council"
	difficulty = "Hard."
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	department_account_access = TRUE
	health_modifier = 15

	disallow_species = list(FORM_PIRSYNTH, FORM_TERRAYNTH, FORM_LIBYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


	outfit_type = /decl/hierarchy/outfit/job/shepherd
	playtimerequired = 1200
	access = list(
		access_prospector, access_foreman, access_external_airlocks, access_eva, access_heads, access_sec_doors,
		access_RC_announce, access_keycard_auth, access_maint_tunnels, access_medical_suits //for locating scav team dead bodies
	)

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_VIG = 30,
		STAT_MEC = 10,
		STAT_BIO = 10
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	perks = list(PERK_STALKER, PERK_JUNKBORN, PERK_BUTCHER)

	description = "The Field Shepherd leads the employees of Fontaine Logistics surface side and is to deligate tasks to their co-workers.<br>\
	Your goal is to lead your team into hostile locations and take everything of value that isn't nailed down - and the nails too!<br>\
	As potentially the youngest head of staff and the one expected to be in the most danger at all times you should be independent and cunning.<br>\
	Your work is perhaps the most dangerous within the entire colony, so good combat and survival skills are essential."

	duties = "Assemble your team of Shipbreakers and Trappers by equipping them with whatever you can find in your prep area and elsewhere.<br>\
		Lead your team through dangerous areas and ensure they recover everything of value.<br>\
		Keep everyone alive and ensure nobody is left behind.<br>\
		Fill in any missing role on your team be it as muscle, salvager, hunting, or other forms of job responsibilities."

/obj/landmark/join/start/shepherd
	name = "Field Shepherd"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/shepherd

/datum/job/trapper
	title = "Trapper"
	flag = TRAPPER
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 2
	supervisors = "the Field Shepherd"
	difficulty = "Medium."
	noob_name = "Rookie Trapper"
	selection_color = "#a7bbc6"
	initial_balance = 500	//Should be enough to get by with basic meds, tools, and food round-start.
	wage = WAGE_NONE

	disallow_species = list(FORM_LIBYNTH, FORM_NASHEF)
	outfit_type = /decl/hierarchy/outfit/job/trapper

	health_modifier = 5

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_MEC = 20,
		STAT_COG = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
		STAT_ROB = 10
	)
	perks = list(PERK_BUTCHER, PERK_MASTER_HERBALIST)

	description = "The Trapper is a employee of Fontaine dedicated to trapping and hunting wildlife as well as acting as a scout for the Shipbreakers.<br>\
	Your primary role is that of a game hunter. Hunt and butcher wildlife for sale, distribution, or cooking supplies for the colony or the company.<br>\
	Your secondary task is providing scouting and forging for your fellow co-workers; such as that of the Shipbreakers.<br>\
	Remember that you are here to gain riches from the abandoned wilds. Don't waste time and resources mindlessly hunting creatures that don't provide profit unless aiding co-workers."

	duties = "Extract natural resources for your employer. Use equipment to access new areas and gain a foothold in the wilderness.<br>\
	Aid your colleagues through scouting and applying field-dressing or forging useful materials from the wilds.<br>\
	Leave security duties to the hired muscle unless faced with no other option."

/obj/landmark/join/start/trapper
	name = "Trapper"
	icon_state = "player-blue"
	join_tag = /datum/job/trapper

/datum/job/shipbreaker
	title = "Shipbreaker"
	flag = SHIPBREAKER
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 2
	supervisors = "the Field Shepherd"
	difficulty = "Medium."
	noob_name = "Rookie Shipbreaker"
	selection_color = "#a7bbc6"
	initial_balance = 500	//Should be enough to get by with basic meds, tools, and food round start.
	wage = WAGE_NONE

	disallow_species = list(FORM_PIRSYNTH, FORM_TERRAYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
	outfit_type = /decl/hierarchy/outfit/job/shipbreaker
	health_modifier = 10

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_VIG = 20,
		STAT_ROB = 20,
		STAT_COG = 10
	)

	perks = list(PERK_STALKER, PERK_JUNKBORN)

	description = "The Shipbreaker serves as hired muscle to the Field Shepard, positioned somewhere between meat shield and exterminator.<br>\
	Your job is to keep the your co-workers safe and anyone else with you protected, handling the fighting and being the first to enter dangerous areas. <br>\
	Your primary goal is to provide protection for co-workers while in the wilds and gather all the loot possible from outside the colony, or search in non-owned areas for loot."

	duties = "Guard your peers from hostile creatures and other dangers that cross your path.<br>\
	Use whatever measures necessary to ensure survival, but try not to soil the standing of your team.<br>\
	Help with the more general salvaging and heavy lifting."

/obj/landmark/join/start/shipbreaker
	name = "Shipbreaker"
	icon_state = "player-blue"
	join_tag = /datum/job/shipbreaker
