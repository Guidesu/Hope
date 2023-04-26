/decl/hierarchy/outfit/job/church
	l_ear = /obj/item/device/radio/headset/church
	id_type = /obj/item/card/id/church
	pda_type = /obj/item/modular_computer/pda/church
	hierarchy_type = /decl/hierarchy/outfit/job/church
	backpack_contents = list(/obj/item/book/ritual/cruciform = 1)

/decl/hierarchy/outfit/job/church/New()
	..()
	BACKPACK_OVERRIDE_NEOTHEOLOGY

/decl/hierarchy/outfit/job/church/oathpledge
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Oathpledge")
	l_ear = /obj/item/device/radio/headset/heads/preacher
	id_type = /obj/item/card/id/chaplain
	uniform = /obj/item/clothing/under/custodian_oathpledge_tn
	suit = /obj/item/clothing/suit/storage/custodian/oathpledge
	head = /obj/item/clothing/head/preacher
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick
	backpack_contents = list(/obj/item/book/ritual/cruciform/priest = 1, /obj/item/clothing/accessory/cross = 1)

/decl/hierarchy/outfit/job/church/forgemaster
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Forgemaster")
	uniform = /obj/item/clothing/under/custodian_forgemaster_tn
	suit = /obj/item/clothing/suit/storage/custodian/forgemaster
	shoes = /obj/item/clothing/shoes/reinforced
	glasses = /obj/item/clothing/glasses/welding
	mask = /obj/item/clothing/mask/gas/artist_hat
	gloves = /obj/item/clothing/gloves/thick

/decl/hierarchy/outfit/job/church/enkindled
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Enkindled")
	uniform = /obj/item/clothing/under/custodian_enkindled_tn
	suit = /obj/item/clothing/suit/storage/custodian
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick

/decl/hierarchy/outfit/job/church/oathbound
	name = OUTFIT_JOB_NAME("Custodians of Bonfires - Oathbound")
	uniform = /obj/item/clothing/under/custodian_oathbound_tn
	suit = /obj/item/clothing/suit/storage/custodian/oathbound
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick
