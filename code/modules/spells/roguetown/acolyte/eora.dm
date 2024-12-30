//Eora content from Stonekeep

/obj/effect/proc_holder/spell/invoked/bud
	name = "Viiritri's Bloom"
	desc = ""
	clothes_req = FALSE
	range = 7
	overlay_state = "love"
	sound = list('sound/magic/magnet.ogg')
	releasedrain = 40
	chargetime = 60
	warnie = "spellwarning"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	charge_max = 60 SECONDS

/obj/effect/proc_holder/spell/invoked/bud/cast(list/targets, mob/living/user)
	var/turf/T = get_turf(targets[1])
	if(!isclosedturf(T))
		new /obj/item/clothing/head/peaceflower(T)
		return TRUE
	to_chat(user, "<span class='warning'>The targeted location is blocked. The flowers of Eora refuse to grow.</span>")
	return FALSE

/obj/effect/proc_holder/spell/invoked/eoracurse
	name = "Charm"
	overlay_state = "curse2"
	releasedrain = 50
	chargetime = 15
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	associated_skill = /datum/skill/magic/arcane
	antimagic_allowed = TRUE
	charge_max = 5 SECONDS
	miracle = FALSE

/obj/effect/proc_holder/spell/invoked/eoracurse/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.apply_status_effect(/datum/status_effect/buff/druqks)
		target.apply_status_effect(/datum/status_effect/buff/drunk)
		target.visible_message("<span class='info'>A purple haze shrouds [target]!</span>", "<span class='notice'>I feel much calmer.</span>")
		target.blur_eyes(10)
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/enrapture
	name = "Enrapture"
	desc = ""
	overlay_state = "bliss"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 5
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/heal.ogg'
	invocation = "Enchanta Amoria!"
	invocation_type = "whisper"
	req_items = list(/obj/item/clothing/neck/roguetown/psicross/eora)
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	miracle = FALSE
	devotion_cost = 0

//Sex-pest spell; if you have ERP verbs on it lets you treat it as sexual stuff if opt in, otherwise spell of serenity/peace.
/obj/effect/proc_holder/spell/invoked/enrapture/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/enrapture_to_public = pick("[target] shivers uncontrollably!", "[target] struggles to stay standing!", "[target] clutches their chest!", "[target]' eyes glaze over!")
		var/enrapture_to_target = pick("A thrill runs down your spine!", "Your knees go weak!", "Your heart thrills in euphoria!", "Your imagination runs wild!")
		target.visible_message(span_warning("[enrapture_to_public]"), span_warning("[enrapture_to_target]"))
		target.Stun(rand(20))
		target.Jitter(20)
		target.add_stress(/datum/stressevent/enrapture)
		if(prob(33))
			target.emote(pick("twitch","drool","moan"))
		//LEWD PART WORKS ON NYMPOMANIACS ONLY
		if(user.has_flaw(/datum/charflaw/addiction/lovefiend))
			target.sate_addiction()
			//ONLY IF YOU HAVE ERP PANEL ON - YOU HAVE TWO OPTIONS
			var/choice = alert(target, "Do you wish to give into bliss?", "", "Yes", "No")
			switch(choice)
				//IF YOU CHOOSE YES - YOU RECIEVE SOME PLEASURE
				if("Yes")
					target.sexcon.perform_sex_action(target, 5, 0, TRUE)
					target.visible_message(span_warning("[target] gives in to their desires!"), span_warning("I am overwhelmed by my desires!"))
					return TRUE
				if("No")
					target.visible_message(span_warning("[target] doesn't give in to their desires!"), span_warning("I won't give in!"))
					return TRUE
			return TRUE
		return TRUE
	return FALSE

/datum/stressevent/enrapture
	timer = 5 MINUTES
	stressadd = -5
	desc = "<span class='green'>I feel.. h-hot..  g-getting hard to.. think..</span>"

/obj/effect/proc_holder/spell/invoked/torsion
	name = "Torsion"
	overlay_state = "raiseskele" // Menacing skull icon warning you to not cast this for funsies.
	releasedrain = 60
	chargetime = 30 // Longer windup than most spells, on par with resurrection's. This is really annoying to get hit by, using it in a fight should be hard.
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 45 SECONDS // 50% more than lightning bolt. Less lethal upfront stun, but annoying lingering wound. This spell does nothing if used on the same target again before they heal.
	miracle = TRUE
	invocation = "torsis!"
	invocation_type = "shout"
	devotion_cost = 100  // Highest cost tier of divine spells.

/obj/effect/proc_holder/spell/invoked/torsion/cast(list/targets, mob/living/user) // The actual CBT code is stolen entirely from the admin CBT punishment command.
	var/mob/living/target = targets[1]
	if(!ishuman(target))
		return FALSE
	var/mob/living/carbon/human/humie = target
	var/obj/item/bodypart/affecting = humie.get_bodypart(BODY_ZONE_CHEST)
	if(!affecting)
		return FALSE // I don't know when a human would not have a chest, but this was in the admin command and I'm sure whoever dev'd that ran into an issue otherwise.
	if(target.gender != MALE) // This uses body type instead of actual genitals, but so does the wound itself. I shudder to think of what would get torsioned in people with no genitals...
		user.say("Viiritri, twist their ovaries!")
	else
		user.say("Viiritri, twist their balls!")
	target.visible_message(span_warning("The air churns strangely around [target]!"), span_danger("I feel a deep sense of dread..."))
	affecting.add_wound(/datum/wound/cbt) // This has its own flavor text, so above flavor text is less explicit about the torsion.
	return TRUE

/obj/effect/proc_holder/spell/invoked/torsion/arcane // If some maniac wants to make this available through scrolls, it can't be a miracle.
	name = "Telekinetic Torsion"
	miracle = FALSE
	devotion_cost = 0
	associated_skill = /datum/skill/magic/arcane
	invocation = "Twist and fall!"
	invocation_type = "shout"
	cost = 4 // Same cost as Fireball. Definitely stronger than lightning bolt.

/obj/effect/proc_holder/spell/invoked/torsion/arcane/cast(list/targets, mob/living/user) // Separate effect because we aren't asking Eora for help, we're doing it ourselves.
	var/mob/living/target = targets[1]
	if(!ishuman(target))
		return FALSE
	var/mob/living/carbon/human/humie = target
	var/obj/item/bodypart/affecting = humie.get_bodypart(BODY_ZONE_CHEST)
	if(!affecting)
		return FALSE
	target.visible_message(span_warning("The air churns strangely around [target]!"), span_danger("I feel a deep sense of dread..."))
	affecting.add_wound(/datum/wound/cbt)
	return TRUE
