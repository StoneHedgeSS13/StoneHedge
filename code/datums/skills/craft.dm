/datum/skill/craft
	abstract_type = /datum/skill/craft
	name = "Craft"
	desc = ""

/datum/skill/craft/crafting
	name = "Crafting"
	desc = ""
	dreams = list(
		"...you feel grass under you feet as you peer onto a meadow, you prepare a campfire and a tent and drift off into deeper slumber.."
	)

/datum/skill/craft/crafting/get_skill_speed_modifier(level)
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 1
		if(SKILL_LEVEL_NOVICE)
			return 1
		if(SKILL_LEVEL_APPRENTICE)
			return 1
		if(SKILL_LEVEL_JOURNEYMAN)
			return 0.5
		if(SKILL_LEVEL_EXPERT)
			return 0.33
		if(SKILL_LEVEL_MASTER)
			return 0.25
		if(SKILL_LEVEL_LEGENDARY)
			return 0.1

/datum/skill/craft/blacksmithing
	name = "Blacksmithing"

/datum/skill/craft/blacksmithing/get_skill_speed_modifier(level)
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 1
		if(SKILL_LEVEL_NOVICE)
			return 1
		if(SKILL_LEVEL_APPRENTICE)
			return 1
		if(SKILL_LEVEL_JOURNEYMAN)
			return 0.5
		if(SKILL_LEVEL_EXPERT)
			return 0.33
		if(SKILL_LEVEL_MASTER)
			return 0.25
		if(SKILL_LEVEL_LEGENDARY)
			return 0.1

/datum/skill/craft/smelting
	name = "Smelting"

/datum/skill/craft/smelting/get_skill_speed_modifier(level)
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 1
		if(SKILL_LEVEL_NOVICE)
			return 1
		if(SKILL_LEVEL_APPRENTICE)
			return 1
		if(SKILL_LEVEL_JOURNEYMAN)
			return 0.5
		if(SKILL_LEVEL_EXPERT)
			return 0.33
		if(SKILL_LEVEL_MASTER)
			return 0.25
		if(SKILL_LEVEL_LEGENDARY)
			return 0.1

/datum/skill/craft/carpentry
	name = "Carpentry"

/datum/skill/craft/carpentry/get_skill_speed_modifier(level)
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 1
		if(SKILL_LEVEL_NOVICE)
			return 1
		if(SKILL_LEVEL_APPRENTICE)
			return 1
		if(SKILL_LEVEL_JOURNEYMAN)
			return 0.5
		if(SKILL_LEVEL_EXPERT)
			return 0.33
		if(SKILL_LEVEL_MASTER)
			return 0.25
		if(SKILL_LEVEL_LEGENDARY)
			return 0.1

/datum/skill/craft/masonry
	name = "Masonry"

/datum/skill/craft/masonry/get_skill_speed_modifier(level)
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 1
		if(SKILL_LEVEL_NOVICE)
			return 1
		if(SKILL_LEVEL_APPRENTICE)
			return 1
		if(SKILL_LEVEL_JOURNEYMAN)
			return 0.5
		if(SKILL_LEVEL_EXPERT)
			return 0.33
		if(SKILL_LEVEL_MASTER)
			return 0.25
		if(SKILL_LEVEL_LEGENDARY)
			return 0.1

/datum/skill/craft/cooking
	name = "Cooking"

/datum/skill/craft/cooking/get_skill_speed_modifier(level)
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 1
		if(SKILL_LEVEL_NOVICE)
			return 1
		if(SKILL_LEVEL_APPRENTICE)
			return 1
		if(SKILL_LEVEL_JOURNEYMAN)
			return 0.5
		if(SKILL_LEVEL_EXPERT)
			return 0.33
		if(SKILL_LEVEL_MASTER)
			return 0.25
		if(SKILL_LEVEL_LEGENDARY)
			return 0.1

/datum/skill/craft/engineering
	name = "Engineering"

/datum/skill/craft/engineering/get_skill_speed_modifier(level)
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 1
		if(SKILL_LEVEL_NOVICE)
			return 1
		if(SKILL_LEVEL_APPRENTICE)
			return 1
		if(SKILL_LEVEL_JOURNEYMAN)
			return 0.5
		if(SKILL_LEVEL_EXPERT)
			return 0.33
		if(SKILL_LEVEL_MASTER)
			return 0.25
		if(SKILL_LEVEL_LEGENDARY)
			return 0.1

/datum/skill/craft/hunting
	name = "Hunting"
	desc = ""
	dreams = list(
		"...you feel the forest's embrace as you drift into dreams, visions of stalking prey and the thrill of the hunt filling your mind.."
	)

/datum/skill/craft/hunting/get_skill_speed_modifier(level)
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 1
		if(SKILL_LEVEL_NOVICE)
			return 1
		if(SKILL_LEVEL_APPRENTICE)
			return 1
		if(SKILL_LEVEL_JOURNEYMAN)
			return 0.5
		if(SKILL_LEVEL_EXPERT)
			return 0.33
		if(SKILL_LEVEL_MASTER)
			return 0.25
		if(SKILL_LEVEL_LEGENDARY)
			return 0.1
