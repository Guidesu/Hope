//Contains: Engineering department jumpsuits
/obj/item/clothing/under/rank/chief
	name = "union chief's jumpsuit"
	desc = "A blue-yellow engineering jumpsuit worn by Union Chief. It has good radiation shielding."
	icon_state = "chiefengineer"
	item_state = "g_suit"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 30)

/obj/item/clothing/under/rank/chief/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["UC jumpsuit"] = "chiefengineer"
	options["UC jumpskirt"] = "artificer_jumpskirt_master"
	options["UC High Visiblity Jumpsuit"] = "GM uniform" // Sprites by Ezoken/Dromkii

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjust your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/engineer
	desc = "A yellow engineering jumpsuit worn by Guild Adepts. It has minor radiation shielding."
	name = "adept's jumpsuit"
	icon_state = "engine"
	item_state = "engi_suit"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 10
	)

/obj/item/clothing/under/rank/engineer/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Adept Jumpsuit"] = "engine"
	options["Adept Jumpsuit Padded"] = "artificer_armored_jumpsuit"
	options["Adept Jumpskirt"] = "artificer_apprentice_skirt"
	options["Adept Jumpskirt Padded"] = "artificer_jumpskirt_adept"
	options["High Visiblity Jumpsuit"] = "GA uniform" // Sprites by Ezoken/Dromkii
	options["High Visiblity Two Piece"] = "adept_alt" // Sprites by Ezoken/Dromkii
	options["High Visiblity Rolled sleeves"] = "adept_alt_rolled" // Sprites by Ezoken/Dromkii
	options["High Visiblity Shirt down"] = "adept_alt_pants" // Sprites by Ezoken/Dromkii

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjust your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/roboticist
	desc = "An orange and tan CAPSA jumpsuit designed for mechanical work."
	name = "roboticist's jumpsuit"
	icon_state = "robotics"
	item_state = "bl_suit"

/obj/item/clothing/under/rank/engineer/adv
	desc = "A plastic coated and padded engineering suit worn by Guild Adepts heading into dangerously radioactive areas for repair work. Offers full radiation protection."
	name = "adept's padded emergency suit"
	icon_state = "engineadv"
	item_state = "engineadv"
	armor_list = list(
		melee = 20, //if they are not waring any armor over this then we give *something*
		bullet = 20,
		energy = 25,
		bomb = 40,
		bio = 50,
		rad = 100 //Rad proof
	)

/obj/item/clothing/under/rank/engineer/ert_engineer
	name = "padded emergency response jumpsuit"
	desc = "A plastic-coated and iron-woven engineering suit worn by emergency response teams heading into dangerously radioactive areas for repair work."
	icon_state = "chiefengineeradv"
	item_state = "chiefengineeradv"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 30)

/obj/item/clothing/under/rank/miner
	name = "union miner uniform"
	desc = "A snappy union jumpsuit to handle the harshness of the mines."
	icon_state = "miner"
	item_state = "miner"
