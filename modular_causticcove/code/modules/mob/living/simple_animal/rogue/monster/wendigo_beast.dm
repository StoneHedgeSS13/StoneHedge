/mob/living/simple_animal/hostile/retaliate/rogue/wendigo_beast
	icon = 'modular_causticcove/icons/monsters/64x64monsters.dmi'
	name = "wendigo beast"
	icon_state = "wendigo_noblood"
	var/icon_half_hp = "wendigo"
	icon_living = "broodmother"
	icon_dead = "wendigo_dead"
	gender = MALE
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 2
	see_in_dark = 12
	move_to_delay = 3
	pixel_x = -16
	base_intents = list(/datum/intent/simple/claw/wendigo)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 4,
						/obj/item/natural/hide = 4,
						/obj/item/natural/fur = 4,
						/obj/item/natural/bone = 4,
						/obj/item/natural/antler = 2)
	faction = list("wendigo")
	//Undead trait due to supernatural so miracles can burn them.
	mob_biotypes = MOB_ORGANIC|MOB_BEAST|MOB_EPIC|MOB_UNDEAD

	//We have strong hits, yet we deal lower damage during our ability.
	melee_damage_lower = 30
	melee_damage_upper = 45
	vision_range = 9
	aggro_vision_range = 12
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	health = 750
	maxHealth = 750
	STACON = 13
	STAEND = 13
	STASTR = 18
	STASPD = 6
	deaggroprob = 0
	simple_detect_bonus = 20
	defprob = 10
	defdrain = 30
	//We are a major threat.
	del_on_deaggro = 9999 SECONDS
	retreat_health = 0
	food = 0
	attack_sound = list('modular_causticcove/sound/mobs/eldritch/beast_mother_headbutt_1.ogg', 'modular_causticcove/sound/mobs/eldritch/beast_mother_headbutt_2.ogg', 'modular_causticcove/sound/mobs/eldritch/beast_mother_headbutt_3.ogg')
	dodgetime = 66
	aggressive = 1
//	stat_attack = UNCONSCIOUS
	var/stagetwo = 0
	var/allow_ability = 0
	var/ability_cd = 0

//Armor Penetration buff to really ruin someones day.
/datum/intent/simple/claw/wendigo
	name = "claw"
	icon_state = "instrike"
	attack_verb = list("claws", "slashes")
	animname = "blank22"
	blade_class = BCLASS_CUT
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 25
	swingdelay = 3
	candodge = TRUE
	canparry = TRUE
	miss_text = "claws the air!"
	item_d_type = "slash"

/mob/living/simple_animal/hostile/retaliate/rogue/wendigo_beast/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BASHDOORS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_ORGAN_EATER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NASTY_EATER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/wendigo_beast/proc/enter_stage_two()
	src.move_to_delay = 2
	src.turns_per_move = 1
	//We heal to full now! Effective total HP roughly 1500. Fire damage is permanent however and is the ideal way of killing.
	src.adjustBruteLoss(-maxHealth)
	playsound(src, 'modular_causticcove/sound/mobs/gut_mucher_stage_two.ogg', 100, TRUE)
	src.allow_ability = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/wendigo_beast/proc/rend_ability()
	ability_cd = 20
	var/list/mob/living/chosen_target = list()
	for(var/mob/living/targets in oview(1, src))
		if(isliving(targets))
			chosen_target += targets
	if(LAZYLEN(chosen_target))
		var/mob/living/T = pick(chosen_target)
		prevent_goto_target = TRUE
		visible_message(span_warningbig("\The [src] pins [T] into the ground!"))
		face_atom(T)
		T.Stun(90)
		src.melee_damage_lower = 10
		src.melee_damage_upper = 25
		T.emote("scream")
		new /obj/effect/gibspawner/generic(T.loc)
		//Attack the mob 12 times over the duration.
		for(var/i in 1 to 12)
			if(do_after_mob(src, T, 3, TRUE))
				T.attack_animal(src)
				src.adjustBruteLoss(-5)
				src.blood_volume += 20
				//Sever limbs from the mob we attack. If we do, stop attacking.
				if(prob(3))
					var/obj/item/bodypart/limb
					var/list/limb_list = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
					for(var/zone in limb_list)
						limb = T.get_bodypart(zone)
						if(limb)
							limb.dismember()
							visible_message(span_warningbig("\The [src] tears off [T]'s \ [limb.name]!!!"))
							i = 11
							return

				if(prob(50))
					T.emote("painscream")
		//Reset damage back to defaults
		spawn(100)
			src.melee_damage_lower = 30
			src.melee_damage_upper = 45
			prevent_goto_target = FALSE
			turns_per_move = 1

/mob/living/simple_animal/hostile/retaliate/rogue/wendigo_beast/Life()
	. = ..()
	//Enter stage two, allow access to the ability.
	if(health <= (maxHealth/2) && !stagetwo)
		src.stagetwo++
		src.icon_state = icon_half_hp
		enter_stage_two()
	ability_cd--
	//Fuck bleed, this thing is FULLY immune to bleed.
	if(src.blood_volume < BLOOD_VOLUME_NORMAL)
		src.blood_volume += 100
		src.bleed_rate = 0

/mob/living/simple_animal/hostile/retaliate/rogue/wendigo_beast/AttackingTarget()
	. = ..()
	//Heal on every attack. Occasionally heal double.
	if(prob(50))
		src.adjustBruteLoss(-10)
	src.adjustBruteLoss(-10)
	src.blood_volume += 10
	//Always use it when off CD. Tear people UP! Also here to avoid runtimes.
	if(src.ability_cd <= 0 && src.allow_ability)
		rend_ability()
