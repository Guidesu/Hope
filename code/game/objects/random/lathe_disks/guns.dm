/obj/random/lathe_disk/any_gun
	name = "random any gun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/any_gun/item_to_spawn() // pickweight is calculated from advanced list = / 2 - 1. If lower than 1 - delete from the list;
	return pickweight(list(
				/obj/random/lathe_disk/ion_gun = 1,
				/obj/random/lathe_disk/ammo = 5,
				/obj/random/lathe_disk/laser_gun = 2,
				/obj/random/lathe_disk/revolver = 5,
				/obj/random/lathe_disk/shotgun = 3,
				/obj/random/lathe_disk/grande = 1,
				/obj/random/lathe_disk/pistol = 6,
				/obj/random/lathe_disk/rifle = 4,
				/obj/random/lathe_disk/smg = 3,
				/obj/random/lathe_disk/lmg = 2,
				/obj/random/lathe_disk/bolt_gun = 5))

/obj/random/lathe_disk/any_gun/low_chance
	name = "low chance any gun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

//Higher weighted to be good guns

/obj/random/lathe_disk/better_any_gun
	name = "random better any gun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/better_any_gun/item_to_spawn() // pickweight is calculated from advanced list = / 2 - 1. If lower than 1 - delete from the list;
	return pickweight(list(
				/obj/random/lathe_disk/ion_gun = 3,
				/obj/random/lathe_disk/ammo = 2,
				/obj/random/lathe_disk/laser_gun = 6,
				/obj/random/lathe_disk/revolver = 3,
				/obj/random/lathe_disk/shotgun = 5,
				/obj/random/lathe_disk/grande = 4,
				/obj/random/lathe_disk/pistol = 1,
				/obj/random/lathe_disk/rifle = 4,
				/obj/random/lathe_disk/smg = 1,
				/obj/random/lathe_disk/lmg = 4,
				/obj/random/lathe_disk/bolt_gun = 1))

/obj/random/lathe_disk/better_any_gun/low_chance
	name = "low chance better gun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

///More defined gun types then just any

/obj/random/lathe_disk/bolt_gun
	name = "random boltgun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/bolt_gun/low_chance
	name = "low chance boltgun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/bolt_gun/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/heavysniper = 1,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/boltgun = 6,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/western = 4,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/trench = 4,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/rosefield = 6))

/obj/random/lathe_disk/lmg
	name = "random lmg lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/lmg/low_chance
	name = "low chance lmg lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/lmg/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_pk = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/buzzsaw = 1.5,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/tactical = 1))


/obj/random/lathe_disk/smg
	name = "random smg lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/smg/low_chance
	name = "low chance smg lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/smg/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/broz = 6,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/specialist = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/buzzsaw = 3,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/umbani = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/ak47 = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/tactical = 3,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/operator_rifle = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/martian = 2))

/obj/random/lathe_disk/rifle
	name = "random assault rifle lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/rifle/low_chance
	name = "low chance assault rifle lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/rifle/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/federalist = 4,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/duty = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/kraut = 1,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/ak47carbine = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/ak47 = 1,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/gamer = 1,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/nationale = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/specialist = 3,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/wristbreaker = 1))


/obj/random/lathe_disk/pistol
	name = "random pistol lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/pistol/low_chance
	name = "low chance pistol lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/pistol/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/liberty = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/colt = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/stinger = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/martian = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/ranger = 1,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/cheap_guns = 6,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/frontier = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/makarov = 2))

/obj/random/lathe_disk/grande
	name = "random grenade based weapon lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/grande/low_chance
	name = "low chance grenade based weapon lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/grande/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/protector = 3,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/lenar = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/china = 4))

/obj/random/lathe_disk/shotgun
	name = "random shotgun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/shotgun/low_chance
	name = "low chance shotgun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/shotgun/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/doublebarrel = 7,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/trench = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/western = 4,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/judge = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/sweeper = 3))

/obj/random/lathe_disk/revolver
	name = "random revolver lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/revolver/low_chance
	name = "low chance revolver lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/revolver/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/cheap_guns = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/detective = 5,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/ranger = 3,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/frontier = 4,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/stun_revolver = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/wristbreaker = 2))

/obj/random/lathe_disk/ammo
	name = "random ammo lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/ammo/low_chance
	name = "low chance ammo lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/ammo/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/nonlethal_ammo = 3,
				/obj/item/computer_hardware/hard_drive/portable/design/exotic_ammo = 1,
				/obj/item/computer_hardware/hard_drive/portable/design/lethal_ammo = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/ammo_boxes_smallarms = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/ammo_boxes_rifle = 2))

/obj/random/lathe_disk/laser_gun
	name = "random laser gun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/laser_gun/low_chance
	name = "low chance laser gun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/laser_gun/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/counselor = 6,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/spiderrose = 4,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/firestorm = 3,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/lasercannon = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/sunrise = 1,

				/obj/item/computer_hardware/hard_drive/portable/design/guns/stun_revolver = 1,

				/obj/item/computer_hardware/hard_drive/portable/design/guns/nemesis = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/lightfall = 4,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/valkirye = 2,
				/obj/random/lathe_disk/ion_gun/low_chance = 2,

				/obj/item/computer_hardware/hard_drive/portable/design/guns/dominion = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/purger = 2,
				/obj/item/computer_hardware/hard_drive/portable/design/guns/cassad = 1))

/obj/random/lathe_disk/ion_gun
	name = "random ion gun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/ion_gun/low_chance
	name = "low chance ion gun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/ion_gun/item_to_spawn()
	return pickweight(list(
				/obj/item/computer_hardware/hard_drive/portable/design/guns/halicon = 2))
