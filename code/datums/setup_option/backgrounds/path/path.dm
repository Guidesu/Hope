//Path of life you know the stuff you actually did in your life matters HERE. / The actual stats are gonna come later once I finished my sheet - Lamasmaster
//20 points base / -5 points for every perk given by a background, keep the plus and minus equal on stats
/datum/category_item/setup_option/background/path/labourer
	name = "Former Labourer"
	desc = "You used to work in the labour sector as a miner, janitor or anything else you could think of. \
	This made you stronger and skilled at practical things but not very smart."

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_BIO = -10,
		STAT_MEC = 10,
		STAT_COG = -10
	)

/datum/category_item/setup_option/background/path/medtech //This should be both civilian and military to cut down on the amount paths available
	name = "Former Medical Technician"
	desc = "You used to work as an EMT either in civilian or military sector. \
	You have basics of first aid but not much else."

	perks = list(PERK_MEDICAL_EXPERT)

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = -5,
		STAT_BIO = 10,
		STAT_MEC = -10,
		STAT_COG = 5
	)

/datum/category_item/setup_option/background/path/criminal //Former pirate is to be considered merged under this.
	name = "Former Criminal"
	desc = "You used to be either part of a cartel, pirate gang or simply just a petty criminal. \
	Running away for most of your life made you very adept at athletic feats."

	perks = list(PERK_ATHLETE)

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_VIG = 5,
		STAT_MEC = -5,
		STAT_COG = -15
	)

/datum/category_item/setup_option/background/path/armed_forces //All ex militaries merged under here, also applies to cops like this.
	name = "Former Armed Forces Member"
	desc = "You were part of either a police force or enlisted in some military. \
	You know how to handle a weapon well but any other skill leaves you staring."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 10,
		STAT_VIG = 10,
		STAT_BIO = -10,
		STAT_MEC = -10,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/path/mercenary //different from armoed forces member, get perk but less points is the idea here
	name = "Retired Mercenary"
	desc = "You were part of a mercenary group at some point in your life. \
	You can sustain greater wounds than most can due to this."

	perks = list(PERK_MERCENARY_GRIT)

	stat_modifiers = list(
		STAT_TGH = 10,
		STAT_VIG = 5,
		STAT_BIO = -10,
		STAT_MEC = 5,
		STAT_COG = -10
	)

/datum/category_item/setup_option/background/path/entrepreneur
	name = "Free Market Shark"
	desc = "You were or perhaps still are an investor and entrepreneur. \
	This leaves you proficient at tellin what is valuable or not."

	perks = list(PERK_MARKET_PROF) //You have defended the free market one too many times Harry, you are getting political again.

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_VIG = -10,
		STAT_COG = 15
	)

/datum/category_item/setup_option/background/path/noble
	name = "Impoverished Noble"
	desc = "You used to be a noble or are offspring of one. \
	This leaves you with bit more education than most and you got to keep one of the heirlooms for yourself."

	perks = list(PERK_NOBLE)

	stat_modifiers = list(
		STAT_ROB = -5,
		STAT_TGH = -5,
		STAT_VIG = -10,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_COG = 10
	)

/datum/category_item/setup_option/background/path/drug_addict
	name = "Magnesium-Modus Vivendi"
	desc = "You are an irrepairable drug addict \
	You can sustain more drugs within your system but get easily addicted." //conducit proclivitas

	perks = list(PERK_ADDICT)
	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR)

	stat_modifiers = list(
		STAT_TGH = 5,
		STAT_MEC = -5,
		STAT_COG = -15,
		STAT_VIV = 10
	)

/datum/category_item/setup_option/background/path/razor_maniac
	name = "Rookie Transhumanist"
	desc = "You jumped on the wave of transhumanist ideas very early on. \
	You posses a Tekko-Kagi within one of your arms."

	racial_implants = (/obj/item/organ_module/active/simple/wolverine)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = -10,
		STAT_VIG = 5,
		STAT_MEC = -10
	)
