/datum/job/roguetown/vampire/vamplord
	title = "Vampire Lord"
	flag = VAMPLORD
	department_flag = VAMPIRE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	antag_job = TRUE
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	show_in_credits = FALSE		//Stops Scom from announcing their arrival.
	spells = list(/obj/effect/proc_holder/spell/invoked/diagnose/secular, /obj/effect/proc_holder/spell/self/convertrole/vampire)
	tutorial = "You are the one and only lord of these lands. Make sure your cattle - or dear subjects - obey you, least you remain without a source of nourishment."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/vamplord/regular
	display_order = JDO_VAMPLORD
	//min_pq = 4
	max_pq = null
	cmode_music = 'sound/music/combat_vamp.ogg'

/datum/outfit/job/roguetown/vamplord/regular/pre_equip(mob/living/carbon/human/H)
	..()
	if(H && H.mind)
		var/datum/antagonist/vampire/new_antag = new /datum/antagonist/vampirelord()
		H.mind.add_antag_datum(new_antag)

/obj/effect/proc_holder/spell/self/convertrole/vampire
	name = "Recruit Ally"
	new_role = "Vampyre Sympathizer"
	recruitment_faction = "Vampire"
	recruitment_message = "Aid our cause, %RECRUIT!"
	accept_message = "For what is right."
	refuse_message = "I refuse."

