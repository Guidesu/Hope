//Master file is in storage.dm
/obj/item/clothing/suit/storage/custodian
	name = "Custodian robes"
	desc = "Basic nondescript robes to show the humbleness of it's wearer."
	icon_state = "enkindled_vintage"
	item_state = "enkindled_vintage"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(
		melee = 0,
		bullet = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/storage/custodian/oathpledge
	name = "Oathpledge coat"
	desc = "A sleek, fire-resistant fiber weaved suit that bears the mark of the Oathpledge."
	icon_state = "oathpledge_vintage"
	item_state = "oathpledge_vintage"

/obj/item/clothing/suit/storage/custodian/oathbound
	name = "Oathbound coat"
	desc = "A charcoal grey victorian style fire-resistant coat made to protect those who have taken the Custodian's Oath."
	icon_state = "oathbound_vintage"
	item_state = "oathbound_vintage"

/obj/item/clothing/suit/storage/custodian/forgemaster
	name = "Forgemaster coat"
	desc = "A heavy fire-resistant greatcoat able to shield it's wearer from sparks and flames while still looking presentable."
	icon_state = "forgemaster_vintage"
	item_state = "forgemaster_vintage"