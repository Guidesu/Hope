/datum/storyteller/healer
	config_tag = "healer"
	name = "The Healer"
	welcome = "Welcome to the Liberty colony! We hope you enjoy your stay!"
	description = "Peaceful and relaxed storyteller who will try to help the colony a little."

	gain_mult_mundane = 1.1
	gain_mult_moderate = 0.7
	gain_mult_major = 0.7
	gain_mult_roleset = 0.7

	repetition_multiplier = 0.95
	tag_weight_mults = list(TAG_COMBAT = 0.75, TAG_NEGATIVE = 0.5, TAG_POSITIVE = 2)

	//Healer gives you half an hour to setup before any antags
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 0, //Moderate
	EVENT_LEVEL_MAJOR = 0, //Major
	EVENT_LEVEL_ROLESET = -999 //Roleset
	)