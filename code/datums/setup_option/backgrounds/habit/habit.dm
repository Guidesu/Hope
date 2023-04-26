/datum/category_item/setup_option/background/habit/herbivore
	name = "Grass Devourer"
	desc = "When your teacher said 'Eat your greens' you took it quite literally and only ate those from then onwards. \
	Or perhaps you just didn't ever have access to proper meat or just maybe your choresterol got too high. \
	Whichever the case, you are now after minor gene therapy more accustomed to vegetables and fruit leaving meat as undesirable for your body."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR)
	perks = list(PERK_HERBIVORE)


/datum/category_item/setup_option/background/habit/carnivore
	name = "Red Meat Enjoyer"
	desc = "Steak, meatball, kebab, sausage, name it and you want it, the taste of meat is insepperable from your pallete.\
	Like your ancestors you are running on pure diet of red meat, two cans of coffee and cold mug of beer.\
	After a minor gene therapy to make this possibility however your body completely rejects any idea of processing plant-based foods."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR)
	perks = list(PERK_CARNIVORE)


/datum/category_item/setup_option/background/habit/chainsmoker
	name = "Terminal Smoker"
	desc = "Nicotine is way of life, nicotine is love, nicotine is your lifeline, without it you wouldn't be whole.\
	Due to genetic predisposition acquired through generations or a gene therapy you are now partially related to tobacco!\
	This means you can inexplicably mend small wounds via consumption of cigarettes or cigars."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	perks = list(PERK_CUBAN_DELIGHT)
	stat_modifiers = list(STAT_TGH = -10) //Trade stats for perks

/datum/category_item/setup_option/background/habit/nepotism
	name = "Friends in High Places"
	desc = "Let's be real, you aren't smart, pretty or particularly talented in any field, what you do have is net of connections.\
	From bankers to cult leaders to even just petty criminals, if it moves you can make it praise your name.\
	As such you got yourself a hefty raise from the higher ups which you will surely put to good use."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	perks = list(PERK_NEPOTISM)
	stat_modifiers = list(STAT_COG = -10) //Really dumb

/datum/category_item/setup_option/background/habit/linguist
	name = "Aspiring Linguist"
	desc = "Be it from your education or from a multi-lingual family, you've found yourself studying languages non-stop throughout your childhood and early adulthood. \
	Unlike most you're silver-tongued in both your knowledge of English, your secondary or native language - and your tertiary! \
	Being tri-lingual has its upsides, making you an adept trader of sorts. Though its downside is that you may have not studied as hard as some others have in other subjects."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	perks = list(PERK_LINGUIST)

/datum/category_item/setup_option/background/habit/psi_sufficiency
	name = "Enlightened Scholar"
	desc = "Due to rigorious studies and self-critique you have learned to master your psionic potential beyond what most can muster. \
	Your mind is in perfect balance with little being able to tilt it's scales downwards.\
	As such certain disciplines are way easier to use for you with smaller chance of violently backfiring."

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)
	perks = list(PERK_PSI_ATTUNEMENT)
	stat_modifiers = list(STAT_ROB = -5, STAT_TGH = -5, STAT_VIG = -5)
