/datum/gear/factioncapsa
	display_name = "paramedic BDU"
	path = /obj/item/clothing/under/rank/paramedic/bdu
	allowed_roles = list("Medical Doctor","Chief Surgeon Overseer","Paramedic")
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"
	cost = 0

/datum/gear/factioncapsa/cloakmbo
	display_name = "cloak, surgeon overseer"
	path = /obj/item/clothing/accessory/job/cape/cso
	allowed_roles = list("Chief Surgeon Overseer")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/cloakmedical
	display_name = "cloak, CAPSA medical"
	path = /obj/item/clothing/accessory/job/cape/medical
	allowed_roles = list("Medical Doctor","CAPSA Biolab Officer","Paramedic")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/poncho
	display_name = "poncho, CAPSA medical"
	path = /obj/item/clothing/accessory/job/poncho/medical
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/gorka_crew_med
	display_name = "gorka jacket, CAPSA medical"
	path = /obj/item/clothing/suit/gorka/toggle/crew_med
	allowed_roles = list("Medical Doctor","Chief Surgeon Overseer","Paramedic")
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/gorkamoebiusmedical
	display_name = "gorka jumpsuit, CAPSA medical"
	path = /obj/item/clothing/under/rank/medical/gorka_crew_med
	allowed_roles = list("Medical Doctor","Chief Surgeon Overseer","Paramedic")
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/gorkapantsmedical
	display_name = "gorka pants, CAPSA medical"
	path = /obj/item/clothing/under/rank/medical/gorkapantscrewmed
	allowed_roles = list("Medical Doctor","Chief Surgeon Overseer","Paramedic")
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/sweater
	display_name = "CAPSA turtleneck"
	path = /obj/item/clothing/under/rank/psych
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/camo
	display_name = "CAPSA Camo uniform"
	path = /obj/item/clothing/under/rank/capsa_camo
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/pants
	display_name = "CAPSA combat pants"
	path = /obj/item/clothing/under/rank/capsa_pants
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/pants
	display_name = "CAPSA scarf"
	path = /obj/item/clothing/accessory/scarf/capsa
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_wear_mask
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/beret
	display_name = "CAPSA beret"
	path = /obj/item/clothing/head/rank/medical/beret
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_head
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/ushanka
	display_name = "CAPSA ushanka"
	path = /obj/item/clothing/head/ushanka/medical
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_head
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/headhunter
	display_name = "CAPSA gas mask"
	path = /obj/item/clothing/mask/gas/capsa
	allowed_roles = list(JOBS_MEDICAL)
	sort_category = "Faction: CAPSA"
	slot = slot_wear_mask
	cost = 2 // It's a gas mask

/datum/gear/factioncapsa/boots
	display_name = "CAPSA combat boots"
	path = /obj/item/clothing/shoes/jackboots/medical
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_shoes
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/medicalhud
	display_name = "medical HUD"
	path = /obj/item/clothing/glasses/hud/health
	allowed_roles = list("Chief Surgeon Overseer","Medical Doctor","Paramedic")
	slot = slot_glasses
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/medicalscouter
	display_name = "medical HUD, scouter"
	path = /obj/item/clothing/glasses/hud/health/scouter
	allowed_roles = list(JOBS_MEDICAL) // Psychs can get this too, for drip.
	slot = slot_glasses
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/hudpatch
	display_name = "medical HUD, eyepatch"
	path = /obj/item/clothing/glasses/eyepatch/medpatch
	allowed_roles = list(JOBS_MEDICAL) // As above.
	slot = slot_glasses
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/scrubs
	display_name = "scrubs selection"
	path = /obj/item/clothing/under/scrubs
	flags = GEAR_HAS_TYPE_SELECTION
	allowed_roles = list("Chief Surgeon Overseer", "Medical Doctor")
	slot = slot_w_uniform
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/surgical
	display_name = "surgical cap selection"
	path = /obj/item/clothing/head/surgery/
	allowed_roles = list("Chief Surgeon Overseer", "Medical Doctor")
	cost = 1
	slot = slot_head
	flags = GEAR_HAS_TYPE_SELECTION
	sort_category = "Faction: CAPSA"

/* TODO: Better sprites for these, PLEASE.

/datum/gear/factioncapsa/snowsuitmedical
	display_name = "snowsuit, CAPSA medical"
	path = /obj/item/clothing/suit/storage/snowsuit/medical
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/winterbootsmedical
	display_name = "winter boots, CAPSA medical"
	path = /obj/item/clothing/shoes/winter/medical
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_shoes
	sort_category = "Faction: CAPSA"

/datum/gear/factioncapsa/wintercoatmedical
	display_name = "winter coat, CAPSA medical"
	path = /obj/item/clothing/suit/hooded/wintercoat/medical
	allowed_roles = list(JOBS_MEDICAL)
	slot = slot_wear_suit
	sort_category = "Faction: CAPSA"
*/

/datum/gear/factioncapsa/penlight
	display_name = "medical penlight"
	path = /obj/item/device/lighting/toggleable/flashlight/pen
	allowed_roles = list("Paramedic","CAPSA Doctor","Chief Surgeon Overseer")
	slot = slot_r_ear
	sort_category = "Faction: CAPSA"
	cost = 0
