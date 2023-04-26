/datum/language/sign
	name = LANGUAGE_SIGN
	desc = "A mostly nonverbal language made of hand gestures, popular among criminals, punks, and mercenaries. Often used to conduct illicit trade away from prying ears."
	signlang_verb = list("gestures", "signs", "signals", "motions")
	colour = "sign"
	key = "s"
	flags = SIGNLANG | NO_STUTTER | NONVERBAL
	shorthand = "JI"
	has_written_form = FALSE

//To maintain an air of informality, sign language does not force capitalization
/datum/language/sign/format_message(message, verb)
	return "[verb], <span class='message'><span class='[colour]'>\"[message]\"</span></span>"

/datum/language/sign/format_message_plain(message, verb)
	return "[verb], \"[message]\""
