var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/secretary
	title = "Board Secretary"
	flag = SECRETARY
	department = DEPARTMENT_COMMAND
	head_position = TRUE
	aster_guild_member = TRUE
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "your heart and wisdom"
	difficulty = "Very Hard."
	selection_color = "#ccccff"
	req_admin_notify = 1
	playtimerequired = 2500
	wage = WAGE_COMMAND

	ideal_character_age = 50 // Old geezer captains ftw
	minimum_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/captain

	perks = list(PERK_SOMELLIER)

	description = "The Premier is the prime mediator of the colony itself, acting as a trusted advisor amongst their peers.<br>\
You are trusted with control of the colony primary accounts, and are also able to control access within the colony.<br>\
Your primary objective is to oversee council decisions, change access levels, and act as both lawyer and consultant in various decisions.<br>\
You are not the supreme leader of the colony and your word is only an advisement. The only person you can give legal orders to is the Steward.<br>\
The heads of the factions which make up the council each have their own agendas. Their interests must be served to avoid issues.<br>\
Treat your command officers with respect, and listen to their council. Try not to micromanage their departments or interfere in their affairs."

	duties = "Work between the varying interests of council members to achieve colony stability.<br>\
	Offer advise and counsel when approached, particularly during important decisions.<br>\
	Manage the colony primary accounts and access levels accordingly."

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 25,
		STAT_COG = 15,
		STAT_VIV = 1,
		STAT_ANA = 1
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	get_access()
		return get_all_station_access()

/obj/landmark/join/start/secretary
	name = "Board Secretary"
	icon_state = "player-gold-officer"
	join_tag = /datum/job/secretary
