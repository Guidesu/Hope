//Reworked version of deepmaints generation file thats feed into the JP generator to make dungeons.
//Meant to be able to be run over again to generate additional dungeons.

var/global/list/precursor_normal_room_templates = list()
var/global/list/precursor_end_room_templates = list()
var/global/list/precursor_large_room_templates = list()
var/global/list/starter_precursor_room_templates = list()
var/turf/portal_turf = null

/proc/populatePrecursorMapLists()
	if(starter_precursor_room_templates.len || precursor_normal_room_templates.len || precursor_end_room_templates.len || precursor_large_room_templates.len)
		return
	for(var/item in subtypesof(/datum/map_template/precursor_template/normal))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_normal_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/starter))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		starter_precursor_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/large))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_large_room_templates += S

	for(var/item in subtypesof(/datum/map_template/precursor_template/end))
		var/datum/map_template/precursor_template/submap = item
		var/datum/map_template/precursor_template/S = new submap()
		precursor_end_room_templates += S

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/normal
	name = "precursor room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/normal/New()
	..()
	my_map = pick(precursor_normal_room_templates)

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/large
	name = "large precursor room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/large/New()
	..()
	my_map = pick(precursor_large_room_templates)

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/end
	name = "precursor end room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/end/New()
	..()
	my_map = pick(precursor_end_room_templates)

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter
	name = "precursor starter room"

/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter/New()
	..()
	my_map = pick(starter_precursor_room_templates)

/obj/procedural/jp_DungeonGenerator/precursor/proc/beam_me_up_trilby() //makes the connecting piece from the starter room to the prep area.
	var/list/turf/viable_turfs = list()
	var/bad_turf = FALSE // for wall checks due to being a portal.
	var/obj/procedural/jp_DungeonRoom/picked_room = pick(out_rooms)
	for(var/turf/simulated/floor/F in range(roomMinSize, picked_room.centre))
		//not under walls
		if (F.is_wall)
			continue
		//nothing in the space we are placing
		if (F.contents.len > 1)
			continue
		//no turfs in space
		if (turf_is_external(F))
			continue
		//we are using a portal. The space around has to be clear or we step onto walls.
		for (var/d in cardinal)
			var/turf/T = get_step(F, d)
			if (T.is_wall)
				bad_turf = TRUE
				break
		//do check for bad_turf then add or reset for next loop.
		if(bad_turf == FALSE)
			viable_turfs += F
		else bad_turf = FALSE
		//double check we actually got a turf
	if(viable_turfs.len == 0)
		message_admins("Failed to find viable turf for entry portal placement in precursor dungeon.", 1)
		return
	portal_turf = pick(viable_turfs)

/obj/procedural/jp_DungeonGenerator/precursor/proc/open_up_inside() //creates and links portals
	var/obj/effect/portal/jtb/prep_portal = new /obj/effect/portal/jtb(get_turf(src))  // spawn portal in prep room
	var/obj/effect/portal/jtb/starter_portal = new /obj/effect/portal/jtb(portal_turf) //spawn portal in starter room
	prep_portal.set_target(get_turf(starter_portal))  // Link the two portals
	starter_portal.set_target(get_turf(prep_portal))
	prep_portal.name = "ancient portal"
	starter_portal.name = "ancient portal"
	prep_portal.desc = "A ancient portal created from a equally ancient device."
	starter_portal.desc = "A ancient portal that hopefully returns home."

/obj/procedural/jp_DungeonGenerator/precursor
	name = "Precursor Procedural Generator"
	regen_specific = TRUE
	regen_light = /obj/machinery/light/small/autoattach


/obj/procedural/dungenerator/precursor
	name = "Precursor Gen"
	var/resetting = FALSE
	var/generating = FALSE

/obj/procedural/dungenerator/precursor/proc/make_me_dungeon()
	set background = 1
	spawn()
		//testing_variable(start, REALTIMEOFDAY)
		var/obj/procedural/jp_DungeonGenerator/precursor/generate = new /obj/procedural/jp_DungeonGenerator/precursor(src)
		testing("Beginning procedural generation of [name] -  Z-level [z].")
		generate.name = name
		generate.setArea(locate(145, 27, z), locate(171, 45, z)) //bottom right corner
		generate.setWallType(/turf/simulated/wall/ice)
		generate.setFloorType(/turf/simulated/floor/rock/manmade/ruin2)
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/starter))
		generate.setNumRooms(1) //creates the single starter room they enter other rooms from.
		generate.setRoomMinSize(5)
		generate.setRoomMaxSize(5)
		generate.setExtraPaths(1)
		generate.setMinPathLength(1)
		generate.setMaxPathLength(1)
		generate.setMinLongPathLength(1)
		generate.setLongPathChance(1)
		generate.setPathEndChance(80)
		generate.setPathWidth(1)
		generate.setDoAccurateRoomPlacementCheck(TRUE)
		generate.generate()
		generate.beam_me_up_trilby()
		//proc for building and connecting the entrance/exit to the dungeon here.

		sleep(90)

		generate.setArea(locate(05, 140, z), locate(30, 170, z)) //upper left for the final room. 21 by 21 space for it. just short of the impassible.
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/end))
		generate.setNumRooms(1) // just the one
		generate.setRoomMinSize(10)
		generate.setRoomMaxSize(10)
		generate.setExtraPaths(0)
		generate.setMinPathLength(0)
		generate.setMaxPathLength(0)
		generate.setMinLongPathLength(0)
		generate.setLongPathChance(0)
		generate.setPathEndChance(0)
		generate.setPathWidth(0)
		generate.setUsePreexistingRegions(TRUE)
		generate.setDoAccurateRoomPlacementCheck(TRUE)
		generate.generate()

		sleep(90)

		generate.setArea(locate(05, 27, z), locate(140, 171, z)) //actual dungeon area but not near the east wall (stops connection to the starter room)
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/large))
		generate.setNumRooms(6) // 6 main rooms that we don't duplicate. Need miniumum of 6 before I can finish the pull code.
		generate.setRoomMinSize(10)
		generate.setRoomMaxSize(10)
		generate.setExtraPaths(0)
		generate.setMinPathLength(0)
		generate.setMaxPathLength(0)
		generate.setMinLongPathLength(0)
		generate.setLongPathChance(0)
		generate.setPathEndChance(0)
		generate.setPathWidth(0)
		generate.setUsePreexistingRegions(TRUE)
		generate.setDoAccurateRoomPlacementCheck(TRUE)
		generate.generate()

		sleep(90)

		generate.setArea(locate(05, 27, z), locate(171, 171, z)) //actual dungeon area.
		generate.setAllowedRooms(list(/obj/procedural/jp_DungeonRoom/preexist/square/submap/precursor/normal))
		generate.setNumRooms(30) // whole buncha rooms!
		generate.setRoomMinSize(5)
		generate.setRoomMaxSize(5)
		generate.setExtraPaths(3)
		generate.setMinPathLength(1)
		generate.setMaxPathLength(65)
		generate.setMinLongPathLength(1)
		generate.setLongPathChance(10)
		generate.setPathEndChance(80)
		generate.setPathWidth(2)
		generate.setUsePreexistingRegions(TRUE)
		generate.setDoAccurateRoomPlacementCheck(TRUE)
		generate.generate()
		generate.open_up_inside() //done last so we don't open a portal in a still generating dungeon.

/obj/procedural/dungenerator/precursor/proc/reset() //replaces the dungeon with ice walls.
	set background = 1
	var/datum/map_template/frozone = new /datum/map_template/precursor_icewall_reset //set frozone to the mapclear we need. Its 8x7.
	var/turf/targetspot = locate(4, 26, src.z)
	var/verticalstepcounter = 0 //so we can do the 7 iterations it takes each time before stepping right and doing it again.
	var/horizontalstepcounter = 0 //so we can do the 7 other step cycles

	resetting = TRUE
	while(horizontalstepcounter < 7 || targetspot.x < 172)
		while(verticalstepcounter < 7 || targetspot.y < 172)
			spawn()
			frozone.load(targetspot, centered = FALSE, orientation = NORTH, post_init = 1)
			targetspot = locate(targetspot.x, targetspot.y + 7, targetspot.z)
			verticalstepcounter += 1
			//message_admins("\red reset proc built ice walls at [targetspot.x], [targetspot.y], [targetspot.z].", 1)
			sleep(10) //if it shoots thru too fast it dosn't generate them all. Pain.
		targetspot = locate(targetspot.x + 8, 26, targetspot.z)
		horizontalstepcounter += 1

	//message_admins("\blue Precursor reset proc has finished regenerating the ice walls.", 1)
	resetting = FALSE

/obj/procedural/dungenerator/precursor/New() //just a object placed on the map to generate it the first time.
	while(1) //the most horrifying loop type MAKE SURE THERE IS A FUCKING BREAK SOMEWHERE BELOW OR ELSE IT WONT STOP.
		if(Master.current_runlevel)
			populatePrecursorMapLists() //It's not a hook because mapping subsystem has to intialize first
			break
		else
			sleep(150)
	src.make_me_dungeon()
