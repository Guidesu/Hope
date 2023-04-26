/datum/design/research/item/powercell
	build_type = AUTOLATHE | PROTOLATHE | MECHFAB
	category = CAT_POWER

/datum/design/research/item/powercell/AssembleDesignDesc()
	if(build_path)
		var/obj/item/cell/C = build_path
		desc = "Allows the construction of [initial(C.autorecharging) ? "microreactor" : "power"] cells that can hold [initial(C.maxcharge)] units of energy."

/datum/design/research/item/powercell/large/basic
	name = "Phokorus Institute \"Power-Geyser 2000L\""
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/cell/large/moebius

/datum/design/research/item/powercell/large/high
	name = "Phokorus Institute \"Power-Geyser 7000L\""
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/cell/large/moebius/high

/datum/design/research/item/powercell/large/super
	name = "Phokorus Institute \"Power-Geyser 13000L\""
	build_path = /obj/item/cell/large/moebius/super

/datum/design/research/item/powercell/large/hyper
	name = "Phokorus Institute \"Power-Geyser 18000L\""
	build_path = /obj/item/cell/large/moebius/hyper

/datum/design/research/item/powercell/medium/basic
	name = "Phokorus Institute \"Power-Geyser 700M\""
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/cell/medium/moebius

/datum/design/research/item/powercell/medium/high
	name = "Phokorus Institute \"Power-Geyser 9000M\""
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/cell/medium/moebius/high

/datum/design/research/item/powercell/medium/super
	name = "Phokorus Institute \"Power-Geyser 1100M\""
	build_path = /obj/item/cell/medium/moebius/super

/datum/design/research/item/powercell/medium/hyper
	name = "Phokorus Institute \"Power-Geyser 1300M\""
	build_path = /obj/item/cell/medium/moebius/hyper

/datum/design/research/item/powercell/small/basic
	name = "Phokorus Institute \"Power-Geyser 150S\""
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/cell/small/moebius

/datum/design/research/item/powercell/small/high
	name = "Phokorus Institute \"Power-Geyser 250S\""
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/cell/small/moebius/high

/datum/design/research/item/powercell/small/super
	name = "Phokorus Institute \"Power-Geyser 350S\""
	build_path = /obj/item/cell/small/moebius/super

/datum/design/research/item/powercell/small/hyper
	name = "Phokorus Institute \"Power-Geyser 450S\""
	build_path = /obj/item/cell/small/moebius/hyper

/datum/design/research/item/powercell/large/omega
	name = "Phokorus Institute \"Omega-Geyser 20000L\""
	build_path = /obj/item/cell/large/moebius/omega

/datum/design/research/item/powercell/medium/omega
	name = "Phokorus Institute \"Omega-Geyser 1600M\""
	build_path = /obj/item/cell/medium/moebius/omega

/datum/design/research/item/powercell/small/omega
	name = "Phokorus Institute \"Omega-Geyser 550S\""
	build_path = /obj/item/cell/small/moebius/omega

/datum/design/research/item/powercell/large/nuclear
	name = "Phokorus Institute \"Atomcell 13000L\""
	build_path = /obj/item/cell/large/moebius/nuclear

/datum/design/research/item/powercell/medium/nuclear
	name = "Phokorus Institute \"Atomcell 1000M\""
	build_path = /obj/item/cell/medium/moebius/nuclear

/datum/design/research/item/powercell/small/nuclear
	name = "Phokorus Institute \"Atomcell 300S\""
	build_path = /obj/item/cell/small/moebius/nuclear

/datum/design/research/item/powercell/small/nuclear/pda
	name = "Phokorus Institute \"Atomcell 50S\""
	build_path = /obj/item/cell/small/moebius/pda

//Hand crank for cells
/datum/design/research/item/hand_charger
	name = "Phokorus Institute \"Hand Crank\""
	build_path = /obj/item/device/manual_charger
	category = CAT_POWER
