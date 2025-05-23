/mob/living/carbon/human/proc/on_examine_face(mob/living/carbon/human/user)
	if(user.mind)
		user.mind.i_know_person(src)
/*	var/datum/species/self_species = dna.species
	var/datum/species/examiner_species = user.dna.species
	if(self_species.stress_examine && self_species.type != examiner_species.type && !HAS_TRAIT(user, TRAIT_TOLERANT))
		var/event_type = /datum/stressevent/shunned_race
		if(HAS_TRAIT(user, TRAIT_XENOPHOBIC))
			event_type = /datum/stressevent/shunned_race_xenophobic
		var/datum/stressevent/event = user.add_stress(event_type)
		event.desc = self_species.stress_desc */
	if(user.has_flaw(/datum/charflaw/paranoid) && (STASTR - user.STASTR) > 1)
		user.add_stress(/datum/stressevent/parastr)
	if(HAS_TRAIT(user, TRAIT_JESTERPHOBIA) && job == "Harlequin")
		user.add_stress(/datum/stressevent/jesterphobia)
	if(HAS_TRAIT(src, TRAIT_BEAUTIFUL))
		user.add_stress(/datum/stressevent/beautiful)

/mob/living/carbon/human/examine(mob/user)
	var/observer_privilege = isobserver(user)
	var/aghost_privilege = isadminobserver(user)
	var/t_He = p_they(TRUE)
	var/t_his = p_their()
//	var/t_him = p_them()
	var/t_has = p_have()
	var/t_is = p_are()
	var/obscure_name = FALSE
	var/race_name = dna.species.name
	var/datum/antagonist/maniac/maniac = user.mind?.has_antag_datum(/datum/antagonist/maniac)
	if(maniac && (user != src) || HAS_TRAIT(user, TRAIT_SOONTOWAKEUP) && (user != src))
		race_name = "disgusting pig"

	var/m1 = "[t_He] [t_is]"
	var/m2 = "[t_his]"
	var/m3 = "[t_He] [t_has]"
	if(user == src)
		m1 = "I am"
		m2 = "my"
		m3 = "I have"

	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_PROSOPAGNOSIA))
			obscure_name = TRUE

	var/static/list/unknown_names = list(
		"Unknown",
		"Unknown Man",
		"Unknown Woman",
	)
	if(get_visible_name() in unknown_names)
		obscure_name = TRUE

	if(observer_privilege)
		obscure_name = FALSE

	if(obscure_name)
		. = list("<span class='info'>ø ------------ ø\nThis is <EM>Unknown</EM>.")
	else
		on_examine_face(user)
		var/used_name = name
		var/used_title = get_role_title()
		var/display_as_wanderer = FALSE
		var/is_returning = FALSE
		if(observer_privilege)
			used_name = real_name
		if(migrant_type)
			var/datum/migrant_role/migrant = MIGRANT_ROLE(migrant_type)
			if(migrant.show_wanderer_examine)
				display_as_wanderer = TRUE
		else if(job)
			var/datum/job/J = SSjob.GetJob(job)
			if(J)
				if(J.wanderer_examine)
					display_as_wanderer = TRUE
			/* worthless.
			if(islatejoin)
				is_returning = TRUE*/
		if(display_as_wanderer)
			. = list("<span class='info'>ø ------------ ø\nThis is <EM>[used_name]</EM>, the wandering [custom_race_name ? "[custom_race_name] ([race_name])" : "[race_name]"].")
		else if(used_title)
			. = list("<span class='info'>ø ------------ ø\nThis is <EM>[used_name]</EM>, the [is_returning ? "returning " : ""][custom_race_name ? "[custom_race_name] ([race_name])" : "[race_name]"] [used_title].")

			if(HAS_TRAIT(src, TRAIT_SLAVEBOURNE_EXAMINE))
				. += span_notice("[p_they(TRUE)] [p_have()] a vacant, submissive look in [p_their()] eyes.")
		else
			. = list("<span class='info'>ø ------------ ø\nThis is the <EM>[used_name]</EM>, the [custom_race_name ? "[custom_race_name] ([race_name])" : "[race_name]"].")
		if(dna.species.use_skintones)
			var/skin_tone_wording = dna.species.skin_tone_wording ? lowertext(dna.species.skin_tone_wording) : "skin tone"
			var/list/skin_tones = dna.species.get_skin_list()
			var/skin_tone_seen = "incomprehensible"
			if(!HAS_TRAIT(src, TRAIT_ROTMAN) && skin_tone)
				//AGGHHHHH this is stupid
				for(var/tone in skin_tones)
					if(src.skin_tone == skin_tones[tone])
						skin_tone_seen = lowertext(tone)
						break
			var/slop_lore_string = "."
			if(ishumannorthern(user))
				var/mob/living/carbon/human/racist = user
				var/list/user_skin_tones = racist.dna.species.get_skin_list()
				var/user_skin_tone_seen = "incomprehensible"
				for(var/tone in user_skin_tones)
					if(racist.skin_tone == user_skin_tones[tone])
						user_skin_tone_seen = lowertext(tone)
						break
				if((user_skin_tone_seen == "lalvestine" && skin_tone_seen == "shalvistine") || \
					(user_skin_tone_seen == "shalvistine" && skin_tone_seen == "lalvestine"))
					slop_lore_string = ", <span class='danger'>A TRAITOR!</span>"
			. += span_info("[capitalize(m2)] [skin_tone_wording] is [skin_tone_seen][slop_lore_string]")

		var/usedrole = funnyrole
		if(usedrole)
			. += span_notice("[used_name] is a [usedrole].")
		if(HAS_TRAIT(src, TRAIT_NOBLE))
			. += span_notice("[used_name] is a <EM>NOBLE</EM>.")
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(H.marriedto == name)
				. += span_love("It's my spouse.")

		if(name in GLOB.excommunicated_players)
			. += span_userdanger("EXCOMMUNICATED!")

		if(HAS_TRAIT(src, TRAIT_GROVE_MARKED))
			. += span_userdanger("MARKED BY THE GROVE!")

		if(name in GLOB.heretical_players)
			. += span_userdanger("HERETIC'S BRAND! SHAME!")
		if(iszizocultist(user) || iszizolackey(user))
			if(virginity)
				. += "<span class='userdanger'>VIRGIN!</span>"

		if(name in GLOB.outlawed_players)
			. += span_userdanger("OUTLAW!")

		if(istype(get_item_by_slot(SLOT_NECK), /obj/item/clothing/neck/roguetown/slavecollar)||istype(get_item_by_slot(SLOT_NECK), /obj/item/clothing/neck/roguetown/gorget/servant/imprisoned))
			. += span_notice("It's a slave.")
		if(mind)
			var/mob/living/carbon/human/H = mind.current
			if(H.enemies.Find(name))
				. += span_userdanger("My target!")

			if(H.hunters.Find(name))
				. += span_userdanger("I'm a dead man!")

		var/commie_text
		if(mind)
			if(mind.special_role == "Bandit")
				if(HAS_TRAIT(user, TRAIT_COMMIE))
					commie_text = span_notice("Free man!")
				else
					commie_text = span_userdanger("BANDIT!")
			if(mind.special_role == "Vampire Lord" && !mind.has_antag_datum(/datum/antagonist/vampirelord)?.disguised)
				. += span_userdanger("A MONSTER!")
			if(HAS_TRAIT(src, TRAIT_PUNISHMENT_CURSE))
				. += span_userdanger("CURSED!")
		if(HAS_TRAIT(src, TRAIT_NORTHMAN) && HAS_TRAIT(user, TRAIT_NORTHMAN))
			. += span_userdanger("Hollvinr!")
		if(HAS_TRAIT(src, TRAIT_MANIAC_AWOKEN))
			. += span_userdanger("MANIAC!")
		if(commie_text)
			. += commie_text
		else if(HAS_TRAIT(src, TRAIT_COMMIE) && HAS_TRAIT(user, TRAIT_COMMIE))
			. += span_notice("Fellow Giver!")

	if(HAS_TRAIT(src, TRAIT_LEPROSY))
		. += span_necrosis("A LEPER...")

	if(user != src)
		var/datum/mind/Umind = user.mind
		if(Umind && mind)
			for(var/datum/antagonist/aD in mind.antag_datums)
				for(var/datum/antagonist/bD in Umind.antag_datums)
					var/shit = bD.examine_friendorfoe(aD,user,src)
					if(shit)
						. += shit
			if(user.mind.has_antag_datum(/datum/antagonist/vampirelord) || user.mind.has_antag_datum(/datum/antagonist/vampire))
				. += span_userdanger("Blood Volume: [blood_volume]")

	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))

	if(wear_shirt && !(SLOT_SHIRT in obscured))
		. += "[m3] [wear_shirt.get_examine_string(user)]."

	//uniform
	if(wear_pants && !(SLOT_PANTS in obscured))
		//accessory
		var/accessory_msg
		if(istype(wear_pants, /obj/item/clothing/under))
			var/obj/item/clothing/under/U = wear_pants
			if(U.attached_accessory)
				accessory_msg += " with [icon2html(U.attached_accessory, user)] \a [U.attached_accessory]"

		. += "[m3] [wear_pants.get_examine_string(user)][accessory_msg]."

	//head
	if(head && !(SLOT_HEAD in obscured))
		. += "[m3] [head.get_examine_string(user)] on [m2] head."
	//suit/armor
	if(wear_armor && !(SLOT_ARMOR in obscured))
		. += "[m3] [wear_armor.get_examine_string(user)]."
		//suit/armor storage
		if(s_store && !(SLOT_S_STORE in obscured))
			. += "[m1] carrying [s_store.get_examine_string(user)] on [m2] [wear_armor.name]."
	//back
//	if(back)
//		. += "[m3] [back.get_examine_string(user)] on [m2] back."

	//cloak
	if(cloak && !(SLOT_CLOAK in obscured))
		. += "[m3] [cloak.get_examine_string(user)] on [m2] shoulders."

	//right back
	if(backr && !(SLOT_BACK_R in obscured))
		. += "[m3] [backr.get_examine_string(user)] on [m2] back."

	//left back
	if(backl && !(SLOT_BACK_L in obscured))
		. += "[m3] [backl.get_examine_string(user)] on [m2] back."

	//Hands
	for(var/obj/item/I in held_items)
		if(!(I.item_flags & ABSTRACT))
			. += "[m1] holding [I.get_examine_string(user)] in [m2] [get_held_index_name(get_held_index_of_item(I))]."

	var/datum/component/forensics/FR = GetComponent(/datum/component/forensics)
	//gloves
	if(gloves && !(SLOT_GLOVES in obscured))
		. += "[m3] [gloves.get_examine_string(user)] on [m2] hands."
	else if(FR && length(FR.blood_DNA))
		var/hand_number = get_num_arms(FALSE)
		if(hand_number)
			. += "[m3][hand_number > 1 ? "" : " a"] <span class='bloody'>blood-stained</span> hand[hand_number > 1 ? "s" : ""]!"

	//belt
	if(belt && !(SLOT_BELT in obscured))
		. += "[m3] [belt.get_examine_string(user)] about [m2] waist."

	//right belt
	if(beltr && !(SLOT_BELT_R in obscured))
		. += "[m3] [beltr.get_examine_string(user)] on [m2] belt."

	//left belt
	if(beltl && !(SLOT_BELT_L in obscured))
		. += "[m3] [beltl.get_examine_string(user)] on [m2] belt."

	//shoes
	if(shoes && !(SLOT_SHOES in obscured))
		. += "[m3] [shoes.get_examine_string(user)] on [m2] feet."

	//mask
	if(wear_mask && !(SLOT_WEAR_MASK in obscured))
		. += "[m3] [wear_mask.get_examine_string(user)] on [m2] face."

	//mouth
	if(mouth && !(SLOT_MOUTH in obscured))
		. += "[m3] [mouth.get_examine_string(user)] in [m2] mouth."

	//neck
	if(wear_neck && !(SLOT_NECK in obscured))
		. += "[m3] [wear_neck.get_examine_string(user)] around [m2] neck."

	//eyes
	if(!(SLOT_GLASSES in obscured))
		if(glasses)
			. += "[m3] [glasses.get_examine_string(user)] covering [m2] eyes."
		else if(eye_color == BLOODCULT_EYE && iscultist(src) && HAS_TRAIT(src, CULT_EYES))
			. += span_warning("<B>[m2] eyes are glowing an unnatural red!</B>")

	//ears
	if(ears && !(SLOT_HEAD in obscured))
		. += "[m3] [ears.get_examine_string(user)] on [m2] ears."

	//ID
	if(wear_ring && !(SLOT_RING in obscured))
		. += "[m3] [wear_ring.get_examine_string(user)] on [m2] hands."

	//wrists
	if(wear_wrists && !(SLOT_WRISTS in obscured))
		. += "[m3] [wear_wrists.get_examine_string(user)] on [m2] wrists."

	//handcuffed?
	if(handcuffed)
		. += "<A href='?src=[REF(src)];item=[SLOT_HANDCUFFED]'><span class='warning'>[m1] tied up with \a [handcuffed]!</span></A>"

	if(legcuffed)
		. += "<A href='?src=[REF(src)];item=[SLOT_LEGCUFFED]'><span class='warning'>[m3] \a [legcuffed] around [m2] legs!</span></A>"

	//Gets encapsulated with a warning span
	var/list/msg = list()

	var/appears_dead = FALSE
	if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		appears_dead = TRUE

	var/temp = getBruteLoss() + getFireLoss() //no need to calculate each of these twice

	if(!(user == src && src.hal_screwyhud == SCREWYHUD_HEALTHY)) //fake healthy
		// Damage
		switch(temp)
			if(5 to 25)
				msg += "[m1] a little wounded."
			if(25 to 50)
				msg += "[m1] wounded."
			if(50 to 100)
				msg += "<B>[m1] severely wounded.</B>"
			if(100 to INFINITY)
				msg += span_danger("[m1] gravely wounded.")

	if(mind)
		var/datum/antagonist/vampirelord/vampness = mind.has_antag_datum(/datum/antagonist/vampirelord)
		if(vampness)
			if(vampness && !vampness.disguised && vampness.is_solo)
				msg += span_boldnotice("[m3] pale skin and sunken features.") //mostly so healers know they cant miracle those to health.

		if(user == src)
			switch(bodytemperature)
				if(-INFINITY to BODYTEMP_COLD_DAMAGE_LIMIT)
					msg += span_blue("I feel freezing cold!")
				if(BODYTEMP_COLD_DAMAGE_LIMIT to (BODYTEMP_NORMAL-10))
					msg += span_notice("I feel a bit cold.")
				if((BODYTEMP_NORMAL+10) to BODYTEMP_HEAT_DAMAGE_LIMIT)
					msg += span_notice("I am sweating a bit.")
				if(BODYTEMP_HEAT_DAMAGE_LIMIT to INFINITY)
					msg += span_red("I feel burning hot!")

	// Blood volume
	switch(blood_volume)
		if(-INFINITY to BLOOD_VOLUME_SURVIVE)
			msg += span_artery("<B>[m1] extremely pale and sickly.</B>")
		if(BLOOD_VOLUME_SURVIVE to BLOOD_VOLUME_BAD)
			msg += span_artery("<B>[m1] very pale.</B>")
		if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_OKAY)
			msg += span_artery("[m1] pale.")
		if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
			msg += span_artery("[m1] a little pale.")

	// Bleeding
	var/bleed_rate = get_bleed_rate()
	if(bleed_rate)
		var/bleed_wording = "bleeding"
		switch(bleed_rate)
			if(0 to 1)
				bleed_wording = "bleeding slightly"
			if(1 to 5)
				bleed_wording = "bleeding"
			if(5 to 10)
				bleed_wording = "bleeding a lot"
			if(10 to INFINITY)
				bleed_wording = "bleeding profusely"
		var/list/bleeding_limbs = list()
		var/static/list/bleed_zones = list(
			BODY_ZONE_HEAD,
			BODY_ZONE_CHEST,
			BODY_ZONE_R_ARM,
			BODY_ZONE_L_ARM,
			BODY_ZONE_R_LEG,
			BODY_ZONE_L_LEG,
		)
		for(var/bleed_zone in bleed_zones)
			var/obj/item/bodypart/bleeder = get_bodypart(bleed_zone)
			if(!bleeder?.get_bleed_rate() || (!observer_privilege && !get_location_accessible(src, bleeder.body_zone, skipundies = TRUE)))
				continue
			bleeding_limbs += parse_zone(bleeder.body_zone)
		if(length(bleeding_limbs))
			if(bleed_rate >= 5)
				msg += span_bloody("<B>[capitalize(m2)] [english_list(bleeding_limbs)] [bleeding_limbs.len > 1 ? "are" : "is"] [bleed_wording]!</B>")
			else
				msg += span_bloody("[capitalize(m2)] [english_list(bleeding_limbs)] [bleeding_limbs.len > 1 ? "are" : "is"] [bleed_wording]!")
		else
			if(bleed_rate >= 5)
				msg += span_bloody("<B>[m1] [bleed_wording]</B>!")
			else
				msg += span_bloody("[m1] [bleed_wording]!")

	// Missing limbs
	var/missing_head = FALSE
	var/list/missing_limbs = list()
	for(var/missing_zone in get_missing_limbs())
		if(missing_zone == BODY_ZONE_HEAD)
			missing_head = TRUE
		missing_limbs += parse_zone(missing_zone)

	if(length(missing_limbs))
		var/missing_limb_message = "<B>[capitalize(m2)] [english_list(missing_limbs)] [missing_limbs.len > 1 ? "are" : "is"] gone.</B>"
		if(missing_head)
			missing_limb_message = span_dead("[missing_limb_message]")
		else
			missing_limb_message = span_danger("[missing_limb_message]")
		msg += missing_limb_message

	//Grabbing
	if(pulledby && pulledby.grab_state)
		msg += "[m1] being grabbed by [pulledby]."

	//Nutrition
	if(nutrition < (NUTRITION_LEVEL_STARVING - 50))
		msg += "[m1] looking starved."
//	else if(nutrition >= NUTRITION_LEVEL_FAT)
//		if(user.nutrition < NUTRITION_LEVEL_STARVING - 50)
//			msg += "[t_He] [t_is] plump and delicious looking - Like a fat little piggy. A tasty piggy."
//		else
//			msg += "[t_He] [t_is] quite chubby."

	//Fire/water stacks
	if(fire_stacks > 0)
		msg += "[m1] covered in something flammable."
	else if(fire_stacks < 0)
		msg += "[m1] soaked."

	//Status effects
	var/list/status_examines = status_effect_examines()
	if(length(status_examines))
		msg += status_examines

	//Disgusting behemoth of stun absorption
	if(islist(stun_absorption))
		for(var/i in stun_absorption)
			if(stun_absorption[i]["end_time"] > world.time && stun_absorption[i]["examine_message"])
				msg += "[m1][stun_absorption[i]["examine_message"]]"

	if(!appears_dead)
		if(!skipface)
			//Disgust
			switch(disgust)
				if(DISGUST_LEVEL_SLIGHTLYGROSS to DISGUST_LEVEL_GROSS)
					msg += "[m1] a little disgusted."
				if(DISGUST_LEVEL_GROSS to DISGUST_LEVEL_VERYGROSS)
					msg += "[m1] disgusted."
				if(DISGUST_LEVEL_VERYGROSS to DISGUST_LEVEL_DISGUSTED)
					msg += "[m1] really disgusted."
				if(DISGUST_LEVEL_DISGUSTED to INFINITY)
					msg += "<B>[m1] extremely disgusted.</B>"

			//Drunkenness
			switch(drunkenness)
				if(11 to 21)
					msg += "[m1] slightly flushed."
				if(21.01 to 41) //.01s are used in case drunkenness ends up to be a small decimal
					msg += "[m1] flushed."
				if(41.01 to 51)
					msg += "[m1] quite flushed and [m2] breath smells of alcohol."
				if(51.01 to 61)
					msg += "[m1] very flushed, with breath reeking of alcohol."
				if(61.01 to 91)
					msg += "[m1] looking like a drunken mess."
				if(91.01 to INFINITY)
					msg += "[m1] a shitfaced, slobbering wreck."

			//Stress
			var/stress = get_stress_amount()
			if(HAS_TRAIT(user, TRAIT_EMPATH))
				switch(stress)
					if(20 to INFINITY)
						msg += "[m1] extremely stressed."
					if(10 to 19)
						msg += "[m1] very stressed."
					if(1 to 9)
						msg += "[m1] a little stressed."
					if(-9 to 0)
						msg += "[m1] not stressed."
					if(-19 to -10)
						msg += "[m1] somewhat at peace."
					if(-20 to INFINITY)
						msg += "[m1] at peace inside."
			else if(stress > 10)
				msg += "[m3] stress all over [m2] face."

		//Jitters
		switch(jitteriness)
			if(300 to INFINITY)
				msg += "<B>[m1] convulsing violently!</B>"
			if(200 to 300)
				msg += "[m1] extremely jittery."
			if(100 to 200)
				msg += "[m1] twitching ever so slightly."

		if(InCritical())
			msg += span_warning("[m1] barely conscious.")
		else
			if(stat >= UNCONSCIOUS)
				msg += "[m1] [IsSleeping() ? "sleeping" : "unconscious"]."
			else if(eyesclosed)
				msg += "[capitalize(m2)] eyes are closed."
			else if(has_status_effect(/datum/status_effect/debuff/sleepytime)) //lune worshippers still wont look tired.
				msg += "[m1] looking a little tired."
	else
		msg += "[m1] unconscious."
//		else
//			if(HAS_TRAIT(src, TRAIT_DUMB))
//				msg += "[m3] a stupid expression on [m2] face."
//			if(InCritical())
//				msg += "[m1] barely conscious."
//		if(getorgan(/obj/item/organ/brain))
//			if(!key)
//				msg += span_deadsay("[m1] totally catatonic. The stresses of life in deep-space must have been too much for [t_him]. Any recovery is unlikely.")
//			else if(!client)
//				msg += "[m3] a blank, absent-minded stare and appears completely unresponsive to anything. [t_He] may snap out of it soon."

	if(length(msg))
		. += span_warning("[msg.Join("\n")]")
	// Show especially large embedded objects at a glance
	for(var/obj/item/bodypart/part in bodyparts)
		if (LAZYLEN(part.embedded_objects))
			for(var/obj/item/stuck_thing in part.embedded_objects)
				if (stuck_thing.w_class >= WEIGHT_CLASS_SMALL)
					. += span_bloody("<b>[m3] \a [stuck_thing] stuck in [m2] [part.name]!</b>")

	if((user != src) && isliving(user))
		var/mob/living/L = user
		var/final_str = STASTR
		if(HAS_TRAIT(src, TRAIT_DECEIVING_MEEKNESS))
			final_str = L.STASTR - rand(2,5)
		var/strength_diff = final_str - L.STASTR
		switch(strength_diff)
			if(5 to INFINITY)
				. += span_warning("<B>[t_He] look[p_s()] much stronger than I.</B>")
			if(1 to 5)
				. += span_warning("[t_He] look[p_s()] stronger than I.")
			if(0)
				. += "[t_He] look[p_s()] about as strong as I."
			if(-5 to -1)
				. += span_warning("[t_He] look[p_s()] weaker than I.")
			if(-INFINITY to -5)
				. += span_warning("<B>[t_He] look[p_s()] much weaker than I.</B>")

	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_MARTIALEYE))
			var/final_spd = STASPD
			var/speed_diff = final_spd - L.STASPD
			var/stamina = rogstam
			switch(speed_diff)
				if(5 to INFINITY)
					. += "<span class='warning'><B>[t_He] look[p_s()] much faster than I.</B></span>"
				if(1 to 5)
					. += "<span class='warning'>[t_He] look[p_s()] faster than I.</span>"
				if(0)
					. += "[t_He] look[p_s()] about as fast as I."
				if(-5 to -1)
					. += "<span class='warning'>[t_He] look[p_s()] slower than I.</span>"
				if(-INFINITY to -5)
					. += "<span class='warning'><B>[t_He] look[p_s()] much slower than I.</B></span>"
			switch(stamina)
				if(1001 to INFINITY)
					. += "[t_He] look[p_s()] well rested and unexerted."
				if(701 to 1000)
					. += "[t_He] look[p_s()] a little tired, but still combat ready."
				if(401 to 700)
					. += "<span class='warning'>[t_He] [t_is] breathing heavily, beads of sweat running down [t_his] skin.</span>"
				if(151 to 400)
					. += "<span class='warning'><B>[t_He] [t_is] struggling to maintain [t_his] posture, exhaustion overtaking [t_He].</B></span>"
				if(-INFINITY to 150)
					. += "<span class='warning'><B>[t_He] look[p_s()] on the brink of collapsing from exhaustion.</B></span>"

		//The Nymphomaniac Underground
		if((!appears_dead) && stat == CONSCIOUS && src.has_flaw(/datum/charflaw/addiction/lovefiend))
			var/datum/charflaw/addiction/bonercheck = src.charflaw
			if((bonercheck) && (bonercheck.sated == 0))
				if(user.has_flaw(/datum/charflaw/addiction/lovefiend)) //Takes one to know one
					switch(rand(1,5))
						if(1)
							. += span_love("I can sense [m2] <B>need</B> for fun...")
						if(2)
							. += span_love("[m1] <B>aching</B> for a release.")
						if(3)
							. += span_love("A carnal need <B>stirs</B> within [m2] core.")
						if(4)
							. += span_love("I can practically feel [m2] <B>horniness</B>...")
						if(5)
							. += span_love("Embers of desire <B>smolder</B> within [m2].")
				else if(Adjacent(user)) //No nympho, but close enough to notice.
					switch(rand(1,4))
						if(1)
							. += span_love("[m1] shifting their legs quite a bit...")
						if(2)
							. += span_love("I can see [m2] is a bit restless...")
						if(3)
							. += span_love("[m2] seem distracted...")
						if(4)
							. += span_love("[m1] restless, for some reason.")

	if(maniac)
		var/obj/item/organ/heart/heart = getorganslot(ORGAN_SLOT_HEART)
		if(heart)
			var/inscryption_key = LAZYACCESS(heart.inscryption_keys, maniac) // SPECIFICALLY the key that WE wrote
			if(inscryption_key && (inscryption_key in maniac.key_nums))
				. += span_danger("[t_He] know[p_s()] [inscryption_key], I AM SURE OF IT!")

	var/cursed_stuff = examine_bellies() //vore Code
	if(cursed_stuff)
		. += cursed_stuff

	if(aghost_privilege)
		var/obj/item/organ/heart/heart = getorganslot(ORGAN_SLOT_HEART)
		if(heart && heart.maniacs)
			for(var/datum/antagonist/maniac/M in heart.maniacs)
				var/K = LAZYACCESS(heart.inscryptions, M)
				var/W = LAZYACCESS(heart.maniacs2wonder_ids, M)
				var/N = M.owner?.name
				. += span_notice("Inscryption[N ? " by [N]'s " : ""][W ? "Wonder #[W]" : ""]: [K ? K : ""]")


	if(Adjacent(user) || aghost_privilege)
		if(observer_privilege)
			var/static/list/check_zones = list(
				BODY_ZONE_HEAD,
				BODY_ZONE_CHEST,
				BODY_ZONE_R_ARM,
				BODY_ZONE_L_ARM,
				BODY_ZONE_R_LEG,
				BODY_ZONE_L_LEG,
			)
			for(var/zone in check_zones)
				var/obj/item/bodypart/bodypart = get_bodypart(zone)
				if(!bodypart)
					continue
				. += "<a href='?src=[REF(src)];inspect_limb=[zone]'>Inspect [parse_zone(zone)]</a>"
			. += "<a href='?src=[REF(src)];check_hb=1'>Check Heartbeat</a>"
		else
			var/checked_zone = check_zone(user.zone_selected)
			. += "<a href='?src=[REF(src)];inspect_limb=[checked_zone]'>Inspect [parse_zone(checked_zone)]</a>"
			if(!(mobility_flags & MOBILITY_STAND) && user != src && (user.zone_selected == BODY_ZONE_CHEST))
				. += "<a href='?src=[REF(src)];check_hb=1'>Listen to Heartbeat</a>"

	var/list/lines = build_cool_description(get_mob_descriptors(obscure_name, user), src)
	var/trait_exam = common_trait_examine()
	if(!isnull(trait_exam))
		. += trait_exam

	var/traitstring = get_trait_string()
	for(var/line in lines)
		. += span_info(line)

	var/see_masked = client?.prefs.masked_examine
	if(headshot_link && (!obscure_name || see_masked))
		. += "<a href='?src=[REF(src)];task=view_headshot;'>View face closely</a>"
	if(nudeshot_link && !wear_shirt && !wear_armor)
		. += "<a href='?src=[REF(src)];task=view_nudeshot;'>View body closely</a>"
	if(flavor_text && !headshot_link && (!obscure_name || see_masked))
		. += "<a href='?src=[REF(src)];task=view_flavor;'>View Description</a>"
	if(ooc_notes && !headshot_link && (!obscure_name || see_masked))
		. += "<a href='?src=[REF(src)];task=view_ooc_notes;'>View OOC Notes</a>"
	if(nsfw_info && !headshot_link && (!obscure_name  || see_masked))
		. += "<a href='?src=[REF(src)];task=view_nsfw_notes;'>View NSFW Notes</a>"

	var/perpname = get_face_name(get_id_name(""))
	if(perpname && (HAS_TRAIT(user, TRAIT_SECURITY_HUD) || HAS_TRAIT(user, TRAIT_MEDICAL_HUD)))
		var/datum/data/record/R = find_record("name", perpname, GLOB.data_core.general)
		if(R)
			. += "<span class='deptradio'>Rank:</span> [R.fields["rank"]]\n<a href='?src=[REF(src)];hud=1;photo_front=1'>\[Front photo\]</a><a href='?src=[REF(src)];hud=1;photo_side=1'>\[Side photo\]</a>"
		if(HAS_TRAIT(user, TRAIT_MEDICAL_HUD))
			var/cyberimp_detect
			for(var/obj/item/organ/cyberimp/CI in internal_organs)
				if(CI.status == ORGAN_ROBOTIC && !CI.syndicate_implant)
					cyberimp_detect += "[name] is modified with a [CI.name]."
			if(cyberimp_detect)
				. += "Detected cybernetic modifications:"
				. += cyberimp_detect
			if(R)
				var/health_r = R.fields["p_stat"]
				. += "<a href='?src=[REF(src)];hud=m;p_stat=1'>\[[health_r]\]</a>"
				health_r = R.fields["m_stat"]
				. += "<a href='?src=[REF(src)];hud=m;m_stat=1'>\[[health_r]\]</a>"
			R = find_record("name", perpname, GLOB.data_core.medical)
			if(R)
				. += "<a href='?src=[REF(src)];hud=m;evaluation=1'>\[Medical evaluation\]</a><br>"
			if(traitstring)
				. += "<span class='info'>Detected physiological traits:\n[traitstring]"

		if(HAS_TRAIT(user, TRAIT_SECURITY_HUD))
			if(!user.stat && user != src)
			//|| !user.canmove || user.restrained()) Fluff: Sechuds have eye-tracking technology and sets 'arrest' to people that the wearer looks and blinks at.
				var/criminal = "None"

				R = find_record("name", perpname, GLOB.data_core.security)
				if(R)
					criminal = R.fields["criminal"]

				. += "<span class='deptradio'>Criminal status:</span> <a href='?src=[REF(src)];hud=s;status=1'>\[[criminal]\]</a>"
				. += jointext(list("<span class='deptradio'>Security record:</span> <a href='?src=[REF(src)];hud=s;view=1'>\[View\]</a>",
					"<a href='?src=[REF(src)];hud=s;add_crime=1'>\[Add crime\]</a>",
					"<a href='?src=[REF(src)];hud=s;view_comment=1'>\[View comment log\]</a>",
					"<a href='?src=[REF(src)];hud=s;add_comment=1'>\[Add comment\]</a>"), "")
	. += "ø ------------ ø</span>"
