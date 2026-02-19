/obj/structure/fluff/traveltile/rmh_exit_guildleader		// must NOT be a traveltile/guild child, because that one has a check for burden trait. People should always be able to leave the room.
	aportalid = "guildin"
	aportalgoesto = "guildexit"

/obj/structure/fluff/traveltile/rmh_guildleader
	aportalid = "guildexit"
	aportalgoesto = "guildin"
	required_trait = TRAIT_BURDEN
	can_gain_with_sight = TRUE
	can_gain_by_walking = TRUE
	check_other_side = TRUE
