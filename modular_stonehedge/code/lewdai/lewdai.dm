//By Vide Noir https://github.com/EaglePhntm.
//probably janky as fuck but it is what it is, all mobs having this stuff enabled will stunlock poor warriors with defiant off and monster hunter quirk, likely.


//The funny itself... Works with retaliate/rogue simple mobs and non simple human mobs.
//To set up proper you need to change seeksfuck var to TRUE
/mob/living

	//You can use this with any living.
	///Will this mob be given genitals and sexcontroller, therefore enabling erp panel, and basically enables everything else, key variable.
	var/erpable = FALSE

	//You can not use the vars below with anything less than retaliate/rogue simple mobs, anything less dont have retaliate ai and required vars.
	///Is this a horny goober that periodically tries to get in people.
	var/seeksfuck = FALSE
	///percent chance at initialize to enable seeksfuck, if normally not enabled in type.
	var/hornychance = 0
	///dumdumdumdum, use for not so smart mobs like goblins for dumb horny talk. "I smell a mate."
	var/lewd_talk = FALSE
	//Customizable speech for chasing and when starting to seek a mate.
	var/male_lewdtalk = list("Come here, mate!", "I smell a mate..!", "I'm going to get in you!",  "You will breed with me!")
	var/female_lewdtalk = list("Come here, mate!", "I smell a mate..!", "I'm going to get you in me!", "You will breed with me!")

	//stuff related to auto sex stuff
	///Dont touch or change those manually, those are set automatically with the process.
	var/fuckcd = 0
	var/chasesfuck = FALSE
	var/seekboredom = 0

//--------------simple mobs ----------------
//sex stuff brainrot for things like werevolves --vide noir
//talking is not optional here for show of sentience.

/mob/living/simple_animal/hostile/retaliate/rogue/proc/Lewd_Tick()
	if(client)
		return
	if(!erpable)
		return
	if(fuckcd > 0)
		fuckcd -= 1
	if(fuckcd)
		return
	if(sexcon?.current_action)
		return
	if(retreating)
		return
	if(handcuffed || legcuffed || lying)
		return
	if(sexcon && !chasesfuck)
		for(var/mob/living/carbon/human/fucktarg in view(aggro_vision_range, src))
			if(!aggressive && fucktarg.cmode) //skip if the target has cmode on and the mob is not aggressive.
				continue
			if(fucktarg.has_quirk(/datum/quirk/monsterhunter) && CanAttack(fucktarg, TRUE))
				chasesfuck = TRUE
				if(gender == MALE)
					visible_message(span_boldwarning("[src] has his eyes on [fucktarg], cock throbbing!"))
					say(pick(male_lewdtalk), language = /datum/language/common)
				else
					visible_message(span_boldwarning("[src] has her eyes on [fucktarg], cunt dripping!"))
					say(pick(female_lewdtalk), language = /datum/language/common)
				break
			else
				continue
	if(chasesfuck) //until fuck is acquired, keep chasing.
		seekboredom += 1
		enemies = list()
		target = null
		approaching_target = FALSE
		in_melee = FALSE
		if(prob(10))
			if(gender == MALE)
				visible_message(span_warning("[src] seeks his mate, cock throbbing!"))
				say(pick(male_lewdtalk), language = /datum/language/common)
			else
				visible_message(span_warning("[src] seeks her mate, cunt dripping!"))
				say(pick(female_lewdtalk), language = /datum/language/common)
		seeklewd()
	if(seekboredom > 25) //give up after a while and go dormant again, this should also help them get unstuck.
		stoppedfucking(timedout = TRUE)
	if(retreating && chasesfuck) //we are outta here
		stoppedfucking(timedout = TRUE)

/mob/living/simple_animal/hostile/retaliate/rogue/proc/seeklewd()
	if(!erpable)
		return
	var/mob/living/carbon/human/L
	var/list/foundfuckmeat = list()
	if(!retreating && sexcon.current_action && fuckcd > 0)
		return
	for(var/mob/living/carbon/human/fucktarg in view(aggro_vision_range, src))
		if(fucktarg.has_quirk(/datum/quirk/monsterhunter))
			foundfuckmeat += fucktarg
		if(foundfuckmeat.len)
			L = pick(foundfuckmeat)
			if(Adjacent(L))
				if(iscarbon(L))
					chasesfuck = FALSE
					if(attack_sound)
						playsound(src, pick(attack_sound), 100, TRUE, -1)
					stop_automated_movement = TRUE
					if(!L.has_quirk(/datum/quirk/monsterhunter)) //one more check incase this is somehow the wrong target who dont have the quirk.
						stoppedfucking()
						return
					if(L.cmode)
						L.SetImmobilized(40)
						L.SetKnockdown(40)
					else //sneak attacked i guess.
						L.SetImmobilized(60)
						L.SetKnockdown(60)
					if(!L.lying)
						L.emote("gasp")
					if(L.wear_pants)
						if(L.wear_pants.flags_inv & HIDECROTCH && !L.wear_pants.genitalaccess)
							if(!L.cmode) //pants off if not in cmode
								visible_message(span_danger("[src] manages to rip [L]'s [L.wear_pants.name] off!"))
								var/obj/item/clothing/thepants = L.wear_pants
								L.dropItemToGround(thepants)
								thepants.throw_at(orange(2, get_turf(L)), 2, 1, src, TRUE)
							else if(L.cmode)
								visible_message(span_danger("[src] manages to tug [L]'s [L.wear_pants.name] out of the way!"))
					enemies = list()
					target = null
					approaching_target = FALSE
					in_melee = FALSE
					toggle_ai(AI_OFF)
					if(aggressive)
						sexcon.force = SEX_FORCE_MAX
					else
						sexcon.force = SEX_FORCE_MID
					if(!Adjacent(L)) //are we at the same tile?
						walk_to(src, get_turf(Adjacent(L)), 1, move_to_delay) //get on them.
					visible_message(span_danger("[src] starts to breed [L]!"))
					if(sexcon.force == SEX_FORCE_MAX)
						visible_message(span_danger("[src] pins [L] down for a savage fucking!"))
					else
						visible_message(span_info("[src] climbs on [L] to breed."))
					sexcon.speed = SEX_SPEED_MAX
					if(gender == MALE)
						sexcon.manual_arousal = SEX_MANUAL_AROUSAL_MAX
					log_admin("[src] is trying to init sex on [L]")
					var/current_action = /datum/sex_action/npc_rimming
					if(gender == FEMALE && L.gender == MALE)
						switch(rand(1,2))
							if(1) //anal
								current_action = /datum/sex_action/npc_anal_ride_sex
							if(2) //vaginal
								current_action = /datum/sex_action/npc_vaginal_ride_sex
					if(gender == MALE && L.gender == MALE)
						switch(rand(1,2))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
					if(gender == MALE && L.gender == FEMALE)
						switch(rand(1,3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_sex
					if(gender == FEMALE && L.gender == FEMALE)
						switch(rand(1,3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_rimming
							if(3) //vaginal
								current_action = /datum/sex_action/npc_cunnilingus
					sexcon.do_until_finished = TRUE
					sexcon.target = L
					sexcon.try_start_action(current_action)
			else
				var/turf/T = get_turf(L)
				Goto(T,move_to_delay,0)

/mob/living/simple_animal/hostile/retaliate/rogue/proc/stoppedfucking(mob/living/carbon/target, timedout = FALSE)
	walk_away(src, get_turf(loc), 1, move_to_delay)
	if(gender == MALE) //put that weapon down soldier.
		sexcon.manual_arousal = SEX_MANUAL_AROUSAL_DEFAULT
	sexcon.current_action = null
	chasesfuck = FALSE
	seekboredom = 0
	toggle_ai(AI_ON)
	if(sexcon.just_ejaculated() || timedout) //is it satisfied or given up
		fuckcd = rand(50,350)
	else
		fuckcd = rand(20,40)
		if(aggressive)
			//if its in combat and unsatisfied by prey slipping off, it will wanna try again. But with some delay so the person can actually get up
			// and if they are taking turns with multiple seeksfuck mobs around this may help a bit.
			fuckcd = rand(10,20)
	stop_automated_movement = 0

/mob/living/simple_animal/hostile/retaliate/rogue/Life()
	if(seeksfuck)
		Lewd_Tick()
	. = ..()

/mob/living/simple_animal/hostile/retaliate/rogue/Retaliate()
	. = ..()
	if(sexcon)
		if(sexcon.current_action)
			stoppedfucking()

/mob/living/simple_animal/Initialize()
	. = ..()
	if(erpable)
		give_genitals()
	if(prob(hornychance))
		seeksfuck = TRUE
		fuckcd = rand(0,20)

//--------------not so simple mobs ----------------
//gonna be conversion of the simple mob stuff i made before somehow -videnoir
//those should not tackle down but only pounce laying mobs.
//those mobs may instantly refresh their cooldown if a mob is laying or is handcuffed nearby while seeking targets.

/mob/living/carbon/human/proc/Lewd_Tick()
	if(client)
		return
	if(!erpable)
		return
	if(fuckcd > 0)
		fuckcd -= 1
	if(fuckcd)
		return
	if(sexcon.current_action)
		return
	if(sexcon && !chasesfuck)
		var/list/around = view(10, src)
		for(var/mob/living/carbon/human/fucktarg in around)
			if(!aggressive && fucktarg.cmode) //skip if the target has cmode on and the mob is not aggressive.
				continue
			if(fucktarg.has_quirk(/datum/quirk/monsterhunter) && should_target(fucktarg, TRUE)) //normally checks !sexcon.beingfucked but carbon mobs arent directly on top of the mob to fuck so its probably fine to get ganged.
				chasesfuck = TRUE
				if(lewd_talk)
					if(gender == MALE)
						visible_message(span_boldwarning("[src] has his eyes on [fucktarg], cock throbbing!"))
						say(pick(male_lewdtalk), language = /datum/language/common)
					else
						visible_message(span_boldwarning("[src] has her eyes on [fucktarg], cunt dripping!"))
						say(pick(female_lewdtalk), language = /datum/language/common)
				break
			else
				continue
	if(chasesfuck) //until fuck is acquired, keep chasing.
		seekboredom += 1
		if(prob(10) && lewd_talk)
			if(gender == MALE)
				visible_message(span_warning("[src] seeks his mate, cock throbbing!"))
				say(pick(male_lewdtalk), language = /datum/language/common)
			else
				visible_message(span_warning("[src] seeks her mate, cunt dripping!"))
				say(pick(female_lewdtalk), language = /datum/language/common)
		seeklewd()
	if(seekboredom > 25) //give up after a while and go dormant again, this should also help them get unstuck.
		stoppedfucking(timedout = TRUE)
	if(chasesfuck) //we are outta here due pain.
		stoppedfucking(timedout = TRUE)

/mob/living/carbon/human/proc/seeklewd()
	var/mob/living/carbon/human/L
	var/list/foundfuckmeat = list()
	if(sexcon.current_action && fuckcd > 0)
		return
	for(var/mob/living/carbon/human/fucktarg in view(10, src))
		if(fucktarg.has_quirk(/datum/quirk/monsterhunter))
			foundfuckmeat += fucktarg
		if(foundfuckmeat.len)
			L = pick(foundfuckmeat)
			STOP_PROCESSING(SShumannpc,src)
			mode = AI_OFF
			if(Adjacent(L))
				if(iscarbon(L))
					chasesfuck = FALSE
					if(!L.has_quirk(/datum/quirk/monsterhunter)) //one more check incase this is somehow the wrong target who dont have the quirk.
						stoppedfucking()
						return
					if(L.cmode)
						L.SetImmobilized(40)
						L.SetKnockdown(40)
					else //sneak attacked i guess.
						L.SetImmobilized(60)
						L.SetKnockdown(60)
					if(!L.lying) //i guess if already targeted but got up somehow.
						L.emote("gasp")
					if(L.wear_pants)
						if(L.wear_pants.flags_inv & HIDECROTCH && !L.wear_pants.genitalaccess)
							if(!L.cmode) //pants off if not in cmode
								visible_message(span_danger("[src] manages to rip [L]'s [L.wear_pants.name] off!"))
								var/obj/item/clothing/thepants = L.wear_pants
								L.dropItemToGround(thepants)
								thepants.throw_at(orange(2, get_turf(L)), 2, 1, src, TRUE)
							else if(L.cmode)
								visible_message(span_danger("[src] manages to tug [L]'s [L.wear_pants.name] out of the way!"))
					if(aggressive)
						sexcon.force = SEX_FORCE_MAX
					else
						sexcon.force = SEX_FORCE_MID
					if(!Adjacent(L)) //are we at the same tile?
						walk2derpless(L.loc) //get to them since it looks like shit tweaks out.
					if(!pulling)
						start_pulling(L)
					visible_message(span_danger("[src] starts to breed [L]!"))
					if(sexcon.force == SEX_FORCE_MAX)
						visible_message(span_danger("[src] pins [L] down for a savage fucking!"))
					else
						visible_message(span_info("[src] climbs on [L] to breed."))
					sexcon.speed = SEX_SPEED_MAX
					if(gender == MALE)
						sexcon.manual_arousal = SEX_MANUAL_AROUSAL_MAX
					log_admin("[src] is trying to init sex on [L]")
					var/current_action = /datum/sex_action/npc_rimming
					if(gender == FEMALE && L.gender == MALE)
						switch(rand(1,2))
							if(1) //anal
								current_action = /datum/sex_action/npc_anal_ride_sex
							if(2) //vaginal
								current_action = /datum/sex_action/npc_vaginal_ride_sex
					if(gender == MALE && L.gender == MALE)
						switch(rand(1,2))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
					if(gender == MALE && L.gender == FEMALE)
						switch(rand(1,3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_sex
					if(gender == FEMALE && L.gender == FEMALE)
						switch(rand(1,3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_rimming
							if(3) //vaginal
								current_action = /datum/sex_action/npc_cunnilingus
					sexcon.do_until_finished = TRUE
					sexcon.target = L
					sexcon.try_start_action(current_action)
			else
				var/turf/T = get_turf(L)
				walk2derpless(T)

/mob/living/carbon/human/proc/stoppedfucking(mob/living/carbon/target, timedout = FALSE)
	//try to bind after sex.
	if(target && Adjacent(target))
		if(aggressive && !target.handcuffed && target.lying) //aggro mob, not handcuffed, lying.
			for(var/obj/item/rope/ropey in held_items)
				if(target.cmode)
					visible_message(span_info("[src] struggles with [target]!"))
					adjustStaminaLoss(50, TRUE)
					target.adjustStaminaLoss(50, TRUE)
				else
					ropey.apply_cuffs(target, src)
					visible_message(span_info("[src] ties up [target] with a rope!"))
					start_pulling(target)
				emote("laugh")
				break
		else if(aggressive && target.handcuffed) //already cuffed.
			emote("laugh")
			target.adjustStaminaLoss(25, TRUE)
			adjustStaminaLoss(25, TRUE)
	else if(target)
		walk_away(src, get_turf(loc), 1, 1)
	sexcon.current_action = null
	chasesfuck = FALSE
	seekboredom = 0
	START_PROCESSING(SShumannpc,src)
	mode = AI_IDLE
	if(sexcon.just_ejaculated() || timedout) //is it satisfied or given up
		fuckcd = rand(50,350)
	else
		fuckcd = rand(20,40)
		if(aggressive)
			//if its in combat and unsatisfied by prey slipping off, it will wanna try again. But with some delay so the person can actually get up
			// and if they are taking turns with multiple seeksfuck mobs around this may help a bit.
			fuckcd = rand(10,20)

/mob/living/carbon/human/Life()
	. = ..()
	if(seeksfuck)
		Lewd_Tick()

/mob/living/carbon/human/Initialize()
	. = ..()
	if(erpable)
		give_genitals()
	if(prob(hornychance))
		seeksfuck = TRUE
		fuckcd = rand(0,20)

//maybe if we make some monsters that would be similiar to werewolves as is, These will take existing gender var on src and use it to assign genitals.
//internal organs so sixtuplet or whatever the fuck breasts etc shouldnt matter probably, no graphic. Maybe can use for monstergirls or something too.
//Call this proc to give genitals automatically where needed.
//hidden organs are on by default due to coloring issues.
/mob/living/proc/give_genitals()
	erpable = TRUE
	if(sexcon == null)
		sexcon = new /datum/sex_controller(src)
	if(!issimple(src))
		var/mob/living/carbon/human/species/user = src
		if(!user.getorganslot(ORGAN_SLOT_ANUS))
			var/obj/item/organ/filling_organ/anus/ass = user.getorganslot(ORGAN_SLOT_ANUS)
			ass = new /obj/item/organ/filling_organ/anus
			ass.Insert(user, TRUE)
		if(gender == MALE)
			var/obj/item/organ/filling_organ/testicles/testicles = user.getorganslot(ORGAN_SLOT_TESTICLES)
			if(!show_genitals)
				testicles = new /obj/item/organ/filling_organ/testicles/internal
			else
				testicles = new /obj/item/organ/filling_organ/testicles
			testicles.organ_size = rand(MAX_TESTICLES_SIZE)
			testicles.Insert(user, TRUE)
			var/obj/item/organ/penis/penis = user.getorganslot(ORGAN_SLOT_PENIS)
			if(!show_genitals)
				penis = new /obj/item/organ/penis/internal
			else
				penis = new /obj/item/organ/penis
			penis.organ_size = rand(MAX_PENIS_SIZE)
			penis.Insert(user, TRUE)
		if(gender == FEMALE)
			var/obj/item/organ/butt/buttie = user.getorganslot(ORGAN_SLOT_BUTT)
			if(buttie)
				buttie.organ_size = rand(MAX_BUTT_SIZE)
				buttie.Insert(user, TRUE)
			var/obj/item/organ/filling_organ/breasts/breasts = user.getorganslot(ORGAN_SLOT_BREASTS)
			if(!show_genitals)
				breasts = new /obj/item/organ/filling_organ/breasts/internal
			else
				breasts = new /obj/item/organ/filling_organ/breasts
			breasts.organ_size = rand(MAX_BREASTS_SIZE)
			breasts.Insert(user, TRUE)
			var/obj/item/organ/filling_organ/vagina/vagina = user.getorganslot(ORGAN_SLOT_VAGINA)
			if(!show_genitals)
				vagina = new /obj/item/organ/filling_organ/vagina/internal
			else
				vagina = new /obj/item/organ/filling_organ/vagina
			vagina.Insert(user, TRUE)
			if(prob(3)) //3 chance to be dickgirl.
				var/obj/item/organ/filling_organ/testicles/testicles = user.getorganslot(ORGAN_SLOT_TESTICLES)
				if(!show_genitals)
					testicles = new /obj/item/organ/filling_organ/testicles/internal
				else
					testicles = new /obj/item/organ/filling_organ/testicles
				testicles.organ_size = rand(MAX_TESTICLES_SIZE)
				testicles.Insert(user, TRUE)
				var/obj/item/organ/penis/penis = user.getorganslot(ORGAN_SLOT_PENIS)
				if(!show_genitals)
					penis = new /obj/item/organ/penis/internal
				else
					penis = new /obj/item/organ/penis
				penis.organ_size = rand(MAX_PENIS_SIZE)
				penis.Insert(user, TRUE)
