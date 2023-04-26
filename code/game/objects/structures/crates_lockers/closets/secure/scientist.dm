/obj/structure/closet/secure_closet/personal/scientist
	name = "Phokorus Institute scientist's locker"
	req_access = list(access_rd)
	access_occupy = list(access_tox_storage)
	icon_state = "science"

/obj/structure/closet/secure_closet/personal/scientist/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/purple/scientist(src)
	else
		new /obj/item/storage/backpack/satchel/purple/scientist(src)
	new /obj/item/clothing/under/rank/scientist(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/device/radio/headset/headset_sci(src)
	new /obj/item/tank/air(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/storage/belt/sci(src)
	new /obj/item/storage/bag/xenobio(src)
	new /obj/item/bodybag/xenobio(src)

/obj/structure/closet/secure_closet/reinforced/RD
	name = "Phokorus Institute research overseer's locker"
	req_access = list(access_rd)
	icon_state = "rd"

/obj/structure/closet/secure_closet/reinforced/RD/populate_contents()
	new /obj/item/storage/backpack/satchel/leather/withwallet(src)
	new /obj/item/clothing/suit/bio_suit/scientist(src)
	new /obj/item/clothing/head/bio_hood/scientist(src)
	new /obj/item/clothing/accessory/halfcape/RP(src)
	new /obj/item/clothing/under/rank/expedition_overseer(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/leather(src)
	new /obj/item/clothing/gloves/latex(src)
	new /obj/item/device/radio/headset/heads/rp(src)
	new /obj/item/tank/air(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/device/flash(src)
	new /obj/item/shield_projector/rectangle/capsa_personal(src)
	new /obj/item/storage/belt/sci(src)
	new /obj/item/computer_hardware/hard_drive/portable/design/xenobio/rd(src)
	new /obj/item/computer_hardware/hard_drive/portable/design/rped/rd(src)
	new /obj/item/computer_hardware/hard_drive/portable/design/computer/rd(src)
	new /obj/item/oddity/chem_book(src)
	new /obj/item/storage/bag/xenobio(src)
	new /obj/item/bodybag/xenobio(src)
	new /obj/item/tool/hydrogen_sword(src)
	new /obj/item/computer_hardware/hard_drive/portable/design/genetics_kit(src)
	new /obj/item/device/aicard(src)
	new /obj/item/circuitboard/teleporter(src)
	new /obj/item/circuitboard/aicore(src)
	new /obj/item/rig/hazmat/equipped(src)