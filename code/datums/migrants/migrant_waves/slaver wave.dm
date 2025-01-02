/datum/migrant_wave/slaver
	name = "Slavers from the Underkeep"
	max_spawns = 1
	weight = 60
	downgrade_wave = /datum/migrant_wave/slaver_down_one
	roles = list(
		/datum/migrant_role/slaver/master = 1,
		/datum/migrant_role/slaver/slavemercsword = 3,
		/datum/migrant_role/slaver/slavemercwhip = 2,
		/datum/migrant_role/slaver/slavemercbow = 1,
		/datum/migrant_role/slaver/slavez = 2
	)
	greet_text = "A group of slavers emerge from the underdark. Their soul purpose; to take the surface-dwellers back with them, through the underpass. You despise the surface and it's inhabitants as much as you have thrived in the darkness and harsh landscape you call home."

/datum/migrant_wave/slaver_down_one
	name = "Slavers from the Underkeep"
	shared_wave_type = /datum/migrant_wave/slaver
	downgrade_wave = /datum/migrant_wave/slaver_down_two
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/slaver/master = 1,
		/datum/migrant_role/slaver/slavemercsword = 2,
		/datum/migrant_role/slaver/slavemercwhip = 2,
		/datum/migrant_role/slaver/slavemercbow = 1,
		/datum/migrant_role/slaver/slavez = 2
	)
	greet_text = "A group of slavers emerge from the underdark. Their soul purpose; to take the surface-dwellers back with them, through the underpass. You despise the surface and it's inhabitants as much as you have thrived in the darkness and harsh landscape you call home."

/datum/migrant_wave/slaver_down_two
	name = "Slavers from the Underkeep"
	shared_wave_type = /datum/migrant_wave/slaver
	downgrade_wave = /datum/migrant_wave/slaver_down_three
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/slaver/master = 1,
		/datum/migrant_role/slaver/slavemercsword = 1,
		/datum/migrant_role/slaver/slavemercwhip = 2,
		/datum/migrant_role/slaver/slavemercbow = 1,
		/datum/migrant_role/slaver/slavez = 1
	)
	greet_text = "A group of slavers emerge from the underdark. Their soul purpose; to take the surface-dwellers back with them, through the underpass. You despise the surface and it's inhabitants as much as you have thrived in the darkness and harsh landscape you call home."

/datum/migrant_wave/slaver_down_three
	name = "Slavers from the Underkeep"
	shared_wave_type = /datum/migrant_wave/slaver
	downgrade_wave = /datum/migrant_wave/slaver_down_four
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/slaver/master = 1,
		/datum/migrant_role/slaver/slavemercsword = 1,
		/datum/migrant_role/slaver/slavemercwhip = 1,
		/datum/migrant_role/slaver/slavemercbow = 1,
		/datum/migrant_role/slaver/slavez = 1
	)
	greet_text = "A group of slavers emerge from the underdark. Their soul purpose; to take the surface-dwellers back with them, through the underpass. You despise the surface and it's inhabitants as much as you have thrived in the darkness and harsh landscape you call home."

/datum/migrant_wave/slaver_down_four
	name = "Slavers from the Underkeep"
	shared_wave_type = /datum/migrant_wave/slaver
	downgrade_wave = /datum/migrant_wave/slaver_down_five
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/slaver/master = 1,
		/datum/migrant_role/slaver/slavemercwhip = 1,
		/datum/migrant_role/slaver/slavemercbow = 1,
		/datum/migrant_role/slaver/slavez = 1
	)
	greet_text = "A group of slavers emerge from the underdark. Their soul purpose; to take the surface-dwellers back with them, through the underpass. You despise the surface and it's inhabitants as much as you have thrived in the darkness and harsh landscape you call home."

/datum/migrant_wave/slaver_down_five
	name = "Slavers from the Underkeep"
	shared_wave_type = /datum/migrant_wave/slaver
	downgrade_wave = /datum/migrant_wave/slaver_down_six
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/slaver/master = 1,
		/datum/migrant_role/slaver/slavemercwhip = 1,
		/datum/migrant_role/slaver/slavez = 1
	)
	greet_text = "A group of slavers emerge from the underdark. Their soul purpose; to take the surface-dwellers back with them, through the underpass. You despise the surface and it's inhabitants as much as you have thrived in the darkness and harsh landscape you call home."

/datum/migrant_wave/slaver_down_six
	name = "Slavers from the Underkeep"
	shared_wave_type = /datum/migrant_wave/slaver
	downgrade_wave = /datum/migrant_wave/slaver_down_seven
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/slaver/master = 1,
		/datum/migrant_role/slaver/slavez = 1
	)
	greet_text = "A group of slavers emerge from the underdark. Their soul purpose; to take the surface-dwellers back with them, through the underpass. You despise the surface and it's inhabitants as much as you have thrived in the darkness and harsh landscape you call home."

/datum/migrant_wave/slaver_down_seven
	name = "Slavers from the Underkeep"
	shared_wave_type = /datum/migrant_wave/slaver
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/slaver/master = 1
	)
	greet_text = "A group of slavers emerge from the underdark. Their soul purpose; to take the surface-dwellers back with them, through the underpass. You despise the surface and it's inhabitants as much as you have thrived in the darkness and harsh landscape you call home."
