/obj/item/rogueweapon/lordscepter
	force = 20
	force_wielded = 20
	possible_item_intents = list(/datum/intent/lordbash, /datum/intent/lord_electrocute, /datum/intent/lord_silence)
	gripped_intents = list(/datum/intent/lordbash)
	name = "master's rod"
	desc = "Bend the knee."
	icon_state = "scepter"
	icon = 'icons/roguetown/weapons/32.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP
	associated_skill = /datum/skill/combat/maces
	smeltresult = /obj/item/ingot/iron
	swingsound = BLUNTWOOSH_MED
	minstr = 5
	blade_dulling = DULLING_BASHCHOP
	pickup_sound = 'modular_helmsguard/sound/sheath_sounds/draw_blunt.ogg'
	sheathe_sound = 'sound/items/wood_sharpen.ogg'

/datum/intent/lordbash
	name = "bash"
	blade_class = BCLASS_BLUNT
	icon_state = "inbash"
	attack_verb = list("bashes", "clubs", "strikes")
	penfactor = 10
	item_d_type = "blunt"

/datum/intent/lord_electrocute
	name = "electrocute"
	blade_class = null
	icon_state = "inuse"
	tranged = TRUE
	noaa = TRUE

/datum/intent/lord_silence
	name = "silence"
	blade_class = null
	icon_state = "inuse"
	tranged = TRUE
	noaa = TRUE

/obj/item/rogueweapon/lordscepter/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -10,"sy" = -7,"nx" = 11,"ny" = -6,"wx" = -1,"wy" = -6,"ex" = 3,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -1,"sy" = -4,"nx" = 1,"ny" = -3,"wx" = -1,"wy" = -6,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 20,"wturn" = 18,"eturn" = -19,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 0,"sy" = 2,"nx" = 1,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 4,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)

/obj/item/rogueweapon/lordscepter/afterattack(atom/target, mob/user, flag)
	. = ..()
	if(get_dist(user, target) > 7)
		return

	user.changeNext_move(CLICK_CD_MELEE)

	if(ishuman(user))
		var/mob/living/carbon/human/HU = user

		if((HU.job != "Monarch") && (HU.job != "Consort"))
			to_chat(user, span_danger("The rod doesn't obey me."))
			return

		if(ishuman(target))
			var/mob/living/carbon/human/H = target

			if(H == HU)
				return

			if(H.anti_magic_check())
				return

			if(!(H in SStreasury.bank_accounts))
				return

			if(istype(user.used_intent, /datum/intent/lord_electrocute))
				HU.visible_message(span_warning("[HU] electrocutes [H] with the [src]."))
				H.electrocute_act(5, src)
				to_chat(H, span_danger("I'm electrocuted by the scepter!"))
				return

			if(istype(user.used_intent, /datum/intent/lord_silence))
				HU.visible_message(span_warning("[HU] silences [H] with the [src]."))
				H.dna.add_mutation(/datum/mutation/human/mute)
				addtimer(CALLBACK(H.dna, TYPE_PROC_REF(/datum/dna/, remove_mutation), /datum/mutation/human/mute), 20 SECONDS)
				to_chat(H, span_danger("I'm silenced by the scepter!"))
				return

/obj/item/rogueweapon/mace/stunmace
	force = 15
	force_wielded = 15
	name = "stunmace"
	icon_state = "stunmace0"
	desc = "Pain is our currency here."
	gripped_intents = null
	w_class = WEIGHT_CLASS_NORMAL
	possible_item_intents = list(/datum/intent/mace/strike/stunner, /datum/intent/mace/smash/stunner)
	wbalance = 0
	minstr = 5
	wdefense = 0
	var/charge = 100
	var/on = FALSE

/datum/intent/mace/strike/stunner/afterchange()
	var/obj/item/rogueweapon/mace/stunmace/I = masteritem
	if(I)
		if(I.on)
			hitsound = list('sound/items/stunmace_hit (1).ogg','sound/items/stunmace_hit (2).ogg')
		else
			hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	. = ..()

/datum/intent/mace/smash/stunner/afterchange()
	var/obj/item/rogueweapon/mace/stunmace/I = masteritem
	if(I)
		if(I.on)
			hitsound = list('sound/items/stunmace_hit (1).ogg','sound/items/stunmace_hit (2).ogg')
		else
			hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	. = ..()

/obj/item/rogueweapon/mace/stunmace/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/rogueweapon/mace/stunmace/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/rogueweapon/mace/stunmace/funny_attack_effects(mob/living/target, mob/living/user, nodmg)
	. = ..()
	if(on)
		target.electrocute_act(5, src)
		charge -= 33
		if(charge <= 0)
			on = FALSE
			charge = 0
			update_icon()
			if(user.a_intent)
				var/datum/intent/I = user.a_intent
				if(istype(I))
					I.afterchange()

/obj/item/rogueweapon/mace/stunmace/hedgeknight/funny_attack_effects(mob/living/target, mob/living/user, nodmg)
	. = ..()
	if(on)
		target.electrocute_act(15, src)
		target.Paralyze(10 SECONDS)//STR maxxers cannot be reliably chained, so electrocution may be used as an alternative.
		charge -= 25
		if(charge <= 0)
			on = FALSE
			charge = 0
			update_icon()
			if(user.a_intent)
				var/datum/intent/I = user.a_intent
				if(istype(I))
					I.afterchange()

/obj/item/rogueweapon/mace/stunmace/update_icon()
	if(on)
		icon_state = "stunmace1"
	else
		icon_state = "stunmace0"

/obj/item/rogueweapon/mace/stunmace/attack_self(mob/user)
	if(on)
		on = FALSE
	else
		if(charge <= 33)
			to_chat(user, span_warning("It's out of juice."))
			return
		user.visible_message(span_warning("[user] flicks [src] on."))
		on = TRUE
		charge--
	playsound(user, pick('sound/items/stunmace_toggle (1).ogg','sound/items/stunmace_toggle (2).ogg','sound/items/stunmace_toggle (3).ogg'), 100, TRUE)
	if(user.a_intent)
		var/datum/intent/I = user.a_intent
		if(istype(I))
			I.afterchange()
	update_icon()
	add_fingerprint(user)

/obj/item/rogueweapon/mace/stunmace/process()
	if(on)
		charge--
	else
		if(charge < 100)
			charge++
	if(charge <= 0)
		on = FALSE
		charge = 0
		update_icon()
		var/mob/user = loc
		if(istype(user))
			if(user.a_intent)
				var/datum/intent/I = user.a_intent
				if(istype(I))
					I.afterchange()
		playsound(src, pick('sound/items/stunmace_toggle (1).ogg','sound/items/stunmace_toggle (2).ogg','sound/items/stunmace_toggle (3).ogg'), 100, TRUE)

/obj/item/rogueweapon/mace/stunmace/extinguish()
	if(on)
		var/mob/living/user = loc
		if(istype(user))
			user.electrocute_act(5, src)
		on = FALSE
		charge = 0
		update_icon()
		playsound(src, pick('sound/items/stunmace_toggle (1).ogg','sound/items/stunmace_toggle (2).ogg','sound/items/stunmace_toggle (3).ogg'), 100, TRUE)

/obj/item/rogueweapon/katar
	slot_flags = ITEM_SLOT_HIP
	force = 16
	possible_item_intents = list(/datum/intent/katar/cut, /datum/intent/katar/thrust)
	name = "katar"
	desc = "A blade that sits above the users fist. Commonly used by those proficient at unarmed fighting"
	icon_state = "katar"
	icon = 'icons/roguetown/weapons/32.dmi'
	gripsprite = FALSE
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	parrysound = list('sound/combat/parry/bladed/bladedsmall (1).ogg','sound/combat/parry/bladed/bladedsmall (2).ogg','sound/combat/parry/bladed/bladedsmall (3).ogg')
	max_blade_int = 150
	max_integrity = 300
	swingsound = list('sound/combat/wooshes/bladed/wooshsmall (1).ogg','sound/combat/wooshes/bladed/wooshsmall (2).ogg','sound/combat/wooshes/bladed/wooshsmall (3).ogg')
	associated_skill = /datum/skill/combat/unarmed
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	throwforce = 12
	wdefense = 4
	wbalance = 1
	thrown_bclass = BCLASS_CUT
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel

/datum/intent/katar
	clickcd = 8

/datum/intent/katar/cut
	name = "cut"
	icon_state = "incut"
	attack_verb = list("cuts", "slashes")
	animname = "cut"
	blade_class = BCLASS_CUT
	hitsound = list('sound/combat/hits/bladed/smallslash (1).ogg', 'sound/combat/hits/bladed/smallslash (2).ogg', 'sound/combat/hits/bladed/smallslash (3).ogg')
	penfactor = 0
	chargetime = 0
	swingdelay = 0
	clickcd = 8
	item_d_type = "slash"

/datum/intent/katar/thrust
	name = "thrust"
	icon_state = "instab"
	attack_verb = list("thrusts", "stabs")
	animname = "stab"
	blade_class = BCLASS_STAB
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 40
	chargetime = 0
	clickcd = 8
	item_d_type = "stab"

/obj/item/rogueweapon/katar/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -7,"sy" = -4,"nx" = 7,"ny" = -4,"wx" = -3,"wy" = -4,"ex" = 1,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 110,"sturn" = -110,"wturn" = -110,"eturn" = 110,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/mace/pipe        ////////////// reskin of iron mace but bigger
	possible_item_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "pipe"
	desc = "Beloved problem solver."
	icon_state = "leadpipe"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	bigboy = TRUE
	gripsprite = TRUE
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = BLUNTWOOSH_MED

/obj/item/rogueweapon/mace/pipe/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/huntingknife/skin                                    ///////////// reSKINNED hunting knife
	name = "skinning knife"
	desc = "More than one way to skin a seelie."
	icon_state = "skinningknife"


/obj/item/rogueweapon/mace/cudgel/thornlash
	name = "thornlash cudgel"
	desc = "A runed cudgel wrapped in mystical thorny vines. The vines pulse with druidic energy, ready to subdue and restrain wrongdoers."
	force = 10
	force_wielded = 16
	color = "#795548"
	possible_item_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1000
	wdefense = 10
	associated_skill = /datum/skill/combat/maces
	sharpness = IS_BLUNT
	var/cuffing = FALSE

/obj/item/rogueweapon/mace/cudgel/thornlash/funny_attack_effects(mob/living/target, mob/living/user, nodmg)
	. = ..()
	if(!nodmg && isliving(target))
		var/mob/living/L = target
		var/stamina_damage = wielded ? 65 : 45
		L.rogfat_add(stamina_damage)

		if(prob(25))
			L.Knockdown(4 SECONDS)
			to_chat(L, span_danger("The thorny cudgel sweeps my legs out from under me!"))
			user.visible_message(span_warning("[user] sweeps [L]'s legs with the thornlash cudgel!"))

		if(prob(25) && iscarbon(L))
			var/mob/living/carbon/C = L
			var/obj/item/I = C.get_active_held_item()
			if(I)
				C.dropItemToGround(I)
				to_chat(C, span_danger("The thorny vines wrap around my wrist, forcing me to drop what I'm holding!"))
				user.visible_message(span_green("[user]'s thornlash cudgel disarms [C]!"))

		if(prob(25) && iscarbon(L))
			var/mob/living/carbon/C = L
			C.reagents.add_reagent(/datum/reagent/medicine/soporpot, 1)
			to_chat(C, span_danger("The thorny vines inject something into my bloodstream!"))
			user.visible_message(span_green("[user]'s thornlash cudgel injects a substance into [C]!"))

		if(iscarbon(L))
			var/mob/living/carbon/C = L
			if((C.IsParalyzed() || C.rogfat >= C.maxrogfat) && !C.handcuffed && !cuffing)
				cuffing = TRUE
				user.visible_message(span_green("[user] begins wrapping [C]'s wrists with vines!"))
				to_chat(C, span_userdanger("[user] begins wrapping my wrists with vines!"))
				if(do_after(user, 3 SECONDS, C))
					if(C.handcuffed || (!C.IsParalyzed() && C.rogfat < C.maxrogfat))
						cuffing = FALSE
						return
					var/obj/item/rope/vine_cuffs = new(C)
					vine_cuffs.name = "thorny vine restraints"
					vine_cuffs.desc = "Restraints made from druidically-enhanced thorny vines. They seem particularly difficult to break free from."
					vine_cuffs.color = "#0F3F0F"
					C.handcuffed = vine_cuffs
					C.update_handcuffed()
					user.visible_message(span_warning("[user] restrains [C] with vines!"))
					to_chat(C, span_userdanger("[user] restrains me with vines!"))
					playsound(C, 'sound/foley/dropsound/cloth_drop.ogg', 30, TRUE)
					SSblackbox.record_feedback("tally", "handcuffs", 1, type)
				cuffing = FALSE

/obj/item/rogueweapon/whip/druidic
	name = "druidic whip"
	desc = "A mystical living whip that seems to writhe with primal energy. Three ancient runes pulse along its handle: one glows with toxic green, another with earthen brown, and the last with crimson vitality."
	force = 15
	force_wielded = 15
	var/mode = 0 // 0 = normal, 1 = poison, 2 = draining, 3 = bleed
	var/list/mode_names = list("dormant", "venomous", "draining", "thorned")
	var/effect_message_cooldown = 0
	var/list/slow_stacks = list()

/obj/item/rogueweapon/whip/druidic/attack_self(mob/user)
	mode = (mode + 1) % 4
	var/effect_color
	switch(mode)
		if(0)
			to_chat(user, span_green("The runes dim as the whip returns to its dormant form."))
		if(1)
			effect_color = "#4CAF50"
			color = effect_color
			to_chat(user, span_green("The poison rune flares to life with toxic energy!"))
			var/obj/effect/temp_visual/dir_setting/rune_effect/RE = new(get_turf(user))
			RE.color = effect_color
		if(2)
			effect_color = "#B39DDB"
			color = effect_color
			to_chat(user, span_green("The draining rune pulses with mystical power!"))
			var/obj/effect/temp_visual/dir_setting/rune_effect/RE = new(get_turf(user))
			RE.color = effect_color
		if(3)
			effect_color = "#EF5350"
			color = effect_color
			to_chat(user, span_green("The crimson rune blazes with thorned fury!"))
			var/obj/effect/temp_visual/dir_setting/rune_effect/RE = new(get_turf(user))
			RE.color = effect_color

	playsound(user, 'sound/items/wood_sharpen.ogg', 50, TRUE)

/obj/item/rogueweapon/whip/druidic/funny_attack_effects(mob/living/target, mob/living/user, nodmg)
	. = ..()
	if(!nodmg && isliving(target) && mode != 0)
		var/mob/living/L = target
		var/turf/T = get_turf(L)
		var/effect_color
		switch(mode)
			if(1)
				effect_color = "#4CAF50"
				if(iscarbon(L))
					var/mob/living/carbon/C = L
					if(world.time > effect_message_cooldown)
						user.visible_message(span_green("[user]'s whip exudes a toxic green mist as it strikes!"))
						to_chat(C, span_green("Poisonous spores burst from the whip's strike, seeping into my wounds!"))
						effect_message_cooldown = world.time + 10 SECONDS
					C.reagents.add_reagent(/datum/reagent/toxin/berrypoison, 0.3)

			if(2)
				effect_color = "#B39DDB"
				if(world.time > effect_message_cooldown)
					user.visible_message(span_green("Magical vines sprout from [user]'s whip, reaching for [L]!"))
					to_chat(L, span_green("Mystical vines wrap around my body, draining my energy!"))
					if(iscarbon(L))
						var/mob/living/carbon/C = L
						if(C.rogstam > 50)
							C.rogstam_add(-50)
							if(iscarbon(user))
								var/mob/living/carbon/U = user
								U.rogstam_add(30)
								to_chat(U, span_green("The vines transfer [L]'s energy to me!"))
					effect_message_cooldown = world.time + 10 SECONDS

			if(3)
				effect_color = "#EF5350"
				if(iscarbon(L))
					var/mob/living/carbon/C = L
					if(world.time > effect_message_cooldown)
						user.visible_message(span_green("The whip's thorns grow and sharpen instantly as they tear into [L]!"))
						to_chat(C, span_green("The whip's thorns pulse with primal energy as they rend my flesh!"))
						effect_message_cooldown = world.time + 10 SECONDS
					C.bleed(5)

		if(T && effect_color)
			new /obj/effect/temp_visual/dir_setting/bloodsplatter(T, pick(GLOB.alldirs))
			var/obj/effect/temp_visual/dir_setting/rune_effect/RE = new(T)
			RE.color = effect_color

/obj/effect/temp_visual/dir_setting/rune_effect
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield-flash"
	duration = 6
	layer = ABOVE_MOB_LAYER
