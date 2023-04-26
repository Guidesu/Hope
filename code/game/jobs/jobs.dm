GLOBAL_LIST_INIT(department_command, list(DEPARTMENT_COMMAND))
GLOBAL_LIST_INIT(department_security, list(DEPARTMENT_SECURITY))
GLOBAL_LIST_INIT(department_moebius, list(DEPARTMENT_SCIENCE, DEPARTMENT_MEDICAL))
GLOBAL_LIST_INIT(department_engineering, list(DEPARTMENT_ENGINEERING))
GLOBAL_LIST_INIT(department_guild, list(DEPARTMENT_SERVICE))
GLOBAL_LIST_INIT(department_church, list(DEPARTMENT_CHURCH))

var/const/ENGINEERING       =(1<<0)
var/const/SECURITY        	=(1<<1)
var/const/MEDICAL           =(1<<2)
var/const/SCIENCE           =(1<<3)
var/const/CIVILIAN          =(1<<4)
var/const/COMMAND           =(1<<5)
var/const/MISC              =(1<<6)
var/const/SERVICE           =(1<<7)
var/const/CHURCH           	=(1<<8)
var/const/PROSPECTORS		=(1<<9)
var/const/INDEPENDENT		=(1<<10)

var/const/COM				=(1<<0)

var/const/SECRETARY			=(1<<0)

var/const/ENGSEC			=(1<<1)

var/const/DC				=(1<<0)
var/const/ARMORER			=(1<<1)
var/const/INVESTIGATOR		=(1<<2)
var/const/WATCHMEN			=(1<<4)
var/const/UNIONCHIEF		=(1<<5)
var/const/TECHNICIAN		=(1<<6)
var/const/MINER				=(1<<7)

var/const/MEDSCI			=(1<<2)

var/const/RP				=(1<<0)
var/const/ROBOTICIST		=(1<<1)
var/const/SCIENTIST			=(1<<2)
var/const/CSO				=(1<<3)
var/const/DOCTOR			=(1<<4)
var/const/MEDIC				=(1<<5)
var/const/PSYCHIATRIST		=(1<<6)

var/const/SEVPRO			=(1<<3)

var/const/CLUBMANAGER		=(1<<0)
var/const/JANITOR			=(1<<1)
var/const/FIXER				=(1<<2)
var/const/CLUBWORKER		=(1<<3)
var/const/SHEPHERD			=(1<<4)
var/const/TRAPPER			=(1<<5)
var/const/SHIPBREAKER		=(1<<6)

var/const/CHUCIV			=(1<<4)

var/const/OATHPLEDGE		=(1<<0)
var/const/FORGEMASTER		=(1<<1)
var/const/ENKINDLED			=(1<<2)
var/const/OATHBOUND			=(1<<3)
var/const/ASSISTANT			=(1<<4)

var/const/ROBOUT			=(1<<5)

var/const/AI				=(1<<0)
var/const/CYBORG			=(1<<1)
var/const/OUTSIDER			=(1<<2)

var/list/assistant_occupations = list()


var/list/command_positions = list(JOBS_COMMAND)


var/list/engineering_positions = list(JOBS_ENGINEERING)


var/list/medical_positions = list(JOBS_MEDICAL)


var/list/science_positions = list(JOBS_SCIENCE)

//BS12 EDIT
var/list/service_positions = list(JOBS_SERVICE)


var/list/prospector_positions = list(JOBS_PROSPECTOR)


var/list/church_positions = list(JOBS_CHURCH)


var/list/civilian_positions = list(JOBS_CIVILIAN)


var/list/security_positions = list(JOBS_SECURITY)


var/list/nonhuman_positions = list(JOBS_NONHUMAN)


var/list/offcolony_positions = list(JOBS_INDEPENDENT)

/proc/guest_jobbans(var/job)
	return ((job in command_positions) || (job in nonhuman_positions) || (job in security_positions))
