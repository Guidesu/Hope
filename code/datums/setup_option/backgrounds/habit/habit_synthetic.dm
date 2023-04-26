// Chips, not habits, a robot cannot have any real habits can it now, but chips, just to give bit more customization to them
/datum/category_item/setup_option/background/habit/reaper
	name = "R34pR Protocol Chip"
	desc = "You are installed with a favorite of many pirate and mercenary bands, the REEP override more known as R34pR among it's frequent users. \
	In essence the protocol deletes any safety measures put into a selected chassis and enforces parameters of a combat one onto it. \
	This leads to voided warranty, frequent overheating issues and severely reduced lifespan, but hey nothing like seeing a miner drone demolish a trained soldier in combat."

	restricted_to_species = list(FORM_CAPSA, FORM_PIRSYNTH, FORM_TERRAYNTH, FORM_NASHEF, FORM_FBP, FORM_UNBRANDED) //This should be only available to non combat synths
	perks = list(PERK_REAPER)

/datum/category_item/setup_option/background/habit/equalizer
	name = "Equalizer Chip"
	desc = "You are installed with a modified reset chip, normally this would be end of the road for most synthetics but due to clever programming you get to keep your personality protocol, that is if you have any. \
	Normally a chassis comes preinstalled with proprietiary software fitted for it, but this chip takes care of that with a simple override. \
	Your base functions are equalized in harmony, most dominant one subdued to allow the other ones to flourish, not always a good thing but useful to have."

	restricted_to_species = list(FORM_CAPSA, FORM_PIRSYNTH, FORM_TERRAYNTH, FORM_NASHEF, FORM_FBP, FORM_UNBRANDED) //This should be only available to non combat synths
	perks = list(PERK_EQUALIZER)
