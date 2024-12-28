#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_PATRON 5
#define JOB_UNAVAILABLE_RACE 6
#define JOB_UNAVAILABLE_SEX 7
#define JOB_UNAVAILABLE_AGE 8
#define JOB_UNAVAILABLE_WTEAM 9
#define JOB_UNAVAILABLE_LASTCLASS 10
#define JOB_UNAVAILABLE_JOB_COOLDOWN 11
#define JOB_UNAVAILABLE_SLOTFULL 12


#define ADVENTURERSGUILD	(1<<1)

#define GUILDMASTER		(1<<0)
#define APPRAISER	(1<<1)
#define ADVENTURER		(1<<2)

#define GROVE			(1<<0)

#define GREATDRUID		(1<<0)
#define HEDGEWARDEN		(1<<1)
#define DRUID		(1<<2)
#define HEDGEKNIGHT		(1<<3)
#define OVATE		(1<<4)

#define DIVINETEMPLE	(1<<2)

#define HIGH_PRIEST		(1<<0)
#define GRANDMASTER	(1<<1)
#define PRIEST		(1<<2)
#define TEMPLAR		(1<<3)
#define WYTCHER		(1<<4)
#define GRAVESINGER	(1<<5)
#define ACOLYTE		(1<<6)

#define MERCHANTCONSORTIUM	(1<<3)

#define MERCHANT	(1<<0)
#define SHOPHAND		(1<<1)
#define BLACKSMITH		(1<<2)
#define BAPPRENTICE	(1<<3)

#define ACADEMY				(1<<4)

#define ACADARCHMAGE 	(1<<0)
#define ACADMAGE 	(1<<2)
#define ACADAPP 	(1<<3)

#define FORGE	(1<<5)

#define FORGEMASTER		(1<<0)
#define ARTIFICER		(1<<1)
#define APPRENTICE_ARTIFICER	(1<<2)

#define SYLVERDRAGONNE	(1<<6)

#define INNKEEP			(1<<0)
#define BARMAID			(1<<1)
#define COOK			(1<<2)
#define BUTCHER			(1<<3)
#define NIGHTMASTER		(1<<4)
#define NIGHTSWAIN		(1<<5)
#define HARLEQUIN		(1<<6)

#define TRIBAL			(1<<7)

#define CHIEFTAIN		(1<<0)
#define TRIBALSHAMAN	(1<<1)
#define TRIBALGUARD	(1<<2)
#define TRIBALCOOK		(1<<3)
#define TRIBALSMITH	(1<<4)
#define TRIBALVILLAGER	(1<<5)

#define UNAFFILIATED 	(1<<13)

#define TOWNER (1<<0)
#define PILGRIM (1<<1)
#define MERCENARY (1<<2)
#define SELLSWORD (1<<3)
#define BANDIT (1<<4)
#define MIGRANT (1<<5)
#define DEATHKNIGHT (1<<6)
#define SKELETON (1<<7)

#define UNDERDARK (1<<14)

#define UNUSED			(1<<15)


// ==========================
// job colors
// ==========================

#define JCOLOR_ADVENTURERS "#c86e3a"
#define JCOLOR_GROVE "#50C878"
#define JCOLOR_CHURCH "#c0ba8d"
#define JCOLOR_MERCHANT "#819e82"
#define JCOLOR_ACADEMY "#785286"
#define JCOLOR_FORGE "#b18484"
#define JCOLOR_INN "#81adc8"
#define JCOLOR_TRIBE "#b09262"

// job display orders //

// Adventurer's Guild
#define JDO_GUILDMASTER 1
#define JDO_APPRAISER 2
#define JDO_ADVENTURER 3

// Bruewyyd Grove
#define JDO_GREATDRUID 4
#define JDO_HEDGEWARDEN 5
#define JDO_DRUID 6
#define JDO_HEDGEKNIGHT 7
#define JDO_OVATE 8

// Divine Temple
#define JDO_HIGH_PRIEST 9
#define JDO_GRANDMASTER 10
#define JDO_PRIEST 11
#define JDO_TEMPLAR 12
#define JDO_WYTCHER 13
#define JDO_GRAVESINGER 14
#define JDO_ACOLYTE 15

// Merchant Consortium
#define JDO_MERCHANT 15
#define JDO_SHOPHAND 16
#define JDO_BLACKSMITH 17
#define JDO_BAPPRENTICE 18

// Ravenloft Academy
#define JDO_ACADARCHMAGE 19
#define JDO_ACADMAGE 20
#define JDO_ACADAPP 21

// Svaeryogh's Forge
#define JDO_FORGEMASTER 22
#define JDO_ARTIFICER 23
#define JDO_APPRENTICE_ARTIFICER 24

// Sylver Dragonne Inn
#define JDO_INNKEEP 25
#define JDO_BARMAID 26
#define JDO_BUTCHER 27
#define JDO_COOK 28
#define JDO_NIGHTMASTER 29
#define JDO_NIGHTSWAIN 30
#define JDO_HARLEQUIN 31

// Tribe
#define JDO_CHIEFTAIN 32
#define JDO_TRIBALSHAMAN 33
#define JDO_TRIBALGUARD 34
#define JDO_TRIBALCOOK 35
#define JDO_TRIBALSMITH 36
#define JDO_TRIBALVILLAGER 37

//Unaffiliated
#define JDO_TOWNER 38
#define JDO_PILGRIM 39
#define JDO_MERCENARY 40
#define JDO_SELLSWORD 41
#define JDO_BANDIT 42
#define JDO_MIGRANT 43

#define JDO_UNUSED 100

#define ADVENTURERS_GUILD_ROLES \
	/datum/job/roguetown/guildmaster,\
	/datum/job/roguetown/steward,\
	/datum/job/roguetown/adventurer

#define GROVE_ROLES \
	/datum/job/roguetown/greatdruid,\
	/datum/job/roguetown/hedgewarden,\
	/datum/job/roguetown/druid,\
	/datum/job/roguetown/hedgeknight,\
	/datum/job/roguetown/ovate

#define DIVINE_TEMPLE_ROLES \
	/datum/job/roguetown/high_priest,\
	/datum/job/roguetown/grandmaster,\
	/datum/job/roguetown/priest,\
	/datum/job/roguetown/templar,\
	/datum/job/roguetown/wytcher,\
	/datum/job/roguetown/gravesinger,\
	/datum/job/roguetown/acolyte

#define MERCHANT_CONSORTIUM_ROLES \
	/datum/job/roguetown/merchant\
	/datum/job/roguetown/shophand,\
	/datum/job/roguetown/blacksmith,\
	/datum/job/roguetown/bapprentice

#define ACADEMY_ROLES \
	/datum/job/roguetown/acadarchmage,\
	/datum/job/roguetown/acadmage,\
	/datum/job/roguetown/acadapp

#define FORGE_ROLES \
	/datum/job/roguetown/artificer

#define INN_ROLES \
	/datum/job/roguetown/innkeep,\
	/datum/job/roguetown/barmaid,\
	/datum/job/roguetown/cook,\
	/datum/job/roguetown/nightmaster,\
	/datum/job/roguetown/nightswain,\
	/datum/job/roguetown/harlequin

#define TRIBE_ROLES \
	/datum/job/roguetown/chieftain,\
	/datum/job/roguetown/tribal_shaman,\
	/datum/job/roguetown/tribal_guard,\
	/datum/job/roguetown/tribal_cook,\
	/datum/job/roguetown/tribal_smith,\
	/datum/job/roguetown/tribal_villager


#define ENGSEC			(1<<0)

#define CAPTAIN			(1<<0)
#define HOS				(1<<1)
#define WARDEN			(1<<2)
#define DETECTIVE		(1<<3)
#define OFFICER			(1<<4)
#define CHIEF			(1<<5)
#define ENGINEER		(1<<6)
#define ATMOSTECH		(1<<7)
#define ROBOTICIST		(1<<8)
#define AI_JF			(1<<9)
#define CYBORG			(1<<10)


#define MEDSCI			(1<<1)

#define RD_JF			(1<<0)
#define SCIENTIST		(1<<1)
#define CHEMIST			(1<<2)
#define CMO_JF			(1<<3)
#define DOCTOR			(1<<4)
#define GENETICIST		(1<<5)
#define VIROLOGIST		(1<<6)


#define CIVILIAN		(1<<2)

#define HOP				(1<<0)
#define BARTENDER		(1<<1)
#define BOTANIST		(1<<2)
//#define COOK			(1<<3) //This is redefined below, and is a ss13 leftover.
#define JANITOR			(1<<4)
#define CURATOR			(1<<5)
#define QUARTERMASTER	(1<<6)
#define CARGOTECH		(1<<7)
//#define MINER			(1<<8) //This is redefined below, and is a ss13 leftover.
#define LAWYER			(1<<9)
#define CHAPLAIN		(1<<10)
#define CLOWN			(1<<11)
#define MIME			(1<<12)
#define ASSISTANT		(1<<13)

#define DEFAULT_RELIGION "Christianity"
#define DEFAULT_DEITY "Space Jesus"

#define JOB_DISPLAY_ORDER_DEFAULT 0

#define JOB_DISPLAY_ORDER_ASSISTANT 1
#define JOB_DISPLAY_ORDER_CAPTAIN 2
#define JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL 3
#define JOB_DISPLAY_ORDER_QUARTERMASTER 4
#define JOB_DISPLAY_ORDER_CARGO_TECHNICIAN 5
#define JOB_DISPLAY_ORDER_SHAFT_MINER 6
#define JOB_DISPLAY_ORDER_BARTENDER 7
#define JOB_DISPLAY_ORDER_COOK 8
#define JOB_DISPLAY_ORDER_BOTANIST 9
#define JOB_DISPLAY_ORDER_JANITOR 10
#define JOB_DISPLAY_ORDER_CLOWN 11
#define JOB_DISPLAY_ORDER_MIME 12
#define JOB_DISPLAY_ORDER_CURATOR 13
#define JOB_DISPLAY_ORDER_LAWYER 14
#define JOB_DISPLAY_ORDER_CHAPLAIN 15
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 16
#define JOB_DISPLAY_ORDER_STATION_ENGINEER 17
#define JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN 18
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 19
#define JOB_DISPLAY_ORDER_MEDICAL_DOCTOR 20
#define JOB_DISPLAY_ORDER_CHEMIST 21
#define JOB_DISPLAY_ORDER_GENETICIST 22
#define JOB_DISPLAY_ORDER_VIROLOGIST 23
#define JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR 24
#define JOB_DISPLAY_ORDER_SCIENTIST 25
#define JOB_DISPLAY_ORDER_ROBOTICIST 26
#define JOB_DISPLAY_ORDER_HEAD_OF_SECURITY 27
#define JOB_DISPLAY_ORDER_WARDEN 28
#define JOB_DISPLAY_ORDER_DETECTIVE 29
#define JOB_DISPLAY_ORDER_SECURITY_OFFICER 30
#define JOB_DISPLAY_ORDER_AI 31
#define JOB_DISPLAY_ORDER_CYBORG 32
