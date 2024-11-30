/mob/living/simple_animal/hostile/retaliate/rogue/brain_gusher_beast
	icon = 'modular_causticcove/icons/monsters/lavaland_monsters.dmi'
	name = "DREAM bEastR"
	icon_state = "curseblob"
	icon_living = "curseblob"	
	icon_dead = null
	gender = NEUTER
	emote_hear = null	
	emote_see = null
	speak_chance = 1
	turns_per_move = 1
	see_in_dark = 12
	move_to_delay = 1
	base_intents = list(/datum/intent/unarmed/claw)
	butcher_results = list(/obj/item/reagent_containers/powder/moondust = 1)
	faction = list("hallucination")
	mob_biotypes = MOB_BEAST
	melee_damage_lower = 1
	melee_damage_upper = 5
	vision_range = 12
	aggro_vision_range = 12
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	health = 20
	maxHealth = 20
	STACON = 7
	STAEND = 7
	STASTR = 5
	STASPD = 15
	deaggroprob = 0
	simple_detect_bonus = 20
	//Garunteed dodge on the first attack
	defprob = 200
	defdrain = 0
	del_on_deaggro = 120 SECONDS
	retreat_health = 0
	food = 0
	attack_sound = list('sound/misc/vcraft.ogg')
	dodgetime = 9999
	aggressive = 1
//	stat_attack = UNCONSCIOUS
	var/summoned = FALSE
	alpha = 88

//The summoned form that comes from the original brain gusher to prevent infinite mob spawning
/mob/living/simple_animal/hostile/retaliate/rogue/brain_gusher_beast/summoned
	summoned = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/brain_gusher_beast/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BASHDOORS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAIN, TRAIT_GENERIC)

//We make people a little crazy...
/mob/living/simple_animal/hostile/retaliate/rogue/brain_gusher_beast/AttackingTarget()
	. = ..()
	if(isliving(target))
		var/mob/living/carbon/L = target
		//Jumpscare, then slow down, and become visible
		move_to_delay = 3
		turns_per_move = 3
		alpha = 255
		if(!L.has_status_effect(/datum/status_effect/buff/induced_insanity))
			L.emote("laugh")
			L.apply_status_effect(/datum/status_effect/buff/induced_insanity)
			//How many are there?!! A total trickster beast
			if(prob(50) && !summoned)
				new /mob/living/simple_animal/hostile/retaliate/rogue/brain_gusher_beast/summoned(L.loc)
				playsound(src, 'sound/misc/zizo.ogg', 100, FALSE)
				summoned = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/brain_gusher_beast/death(gibbed)
	. = ..()
	playsound(src, 'sound/misc/zizo.ogg', 75, TRUE)
	qdel(src)
