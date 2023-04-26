/decl/hierarchy/outfit/job/captain
	name = OUTFIT_JOB_NAME("Command - Board Secretary")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/captain
	l_ear = /obj/item/device/radio/headset/heads/captain
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/card/id/gold
	pda_type = /obj/item/modular_computer/pda/captain

/decl/hierarchy/outfit/job/captain/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/storage/backpack/captain
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/captain
