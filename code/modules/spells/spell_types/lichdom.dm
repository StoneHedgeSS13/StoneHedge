/obj/effect/proc_holder/spell/targeted/lichdom
	name = "Lesser Lichdom"
	desc = "A forbidden necromantic ritual that binds your soul to a single item, granting a form of immortality. As a lesser lich, you will rise again after death, though each resurrection weakens your new form. The phylactery is fragile - guard it well."
	school = "necromancy"
	charge_max = 10 SECONDS
	clothes_req = FALSE
	centcom_cancast = FALSE
	invocation = "NECREM MORTIS!"
	invocation_type = "shout"
	range = -1
	level_max = 0
	cooldown_min = 40
	include_user = TRUE

	action_icon = 'icons/mob/actions/roguespells.dmi'
	action_icon_state = "raiseskele"
	action_background_icon_state = "bg_spell"

	releasedrain = 100
	chargedrain = 1
	chargetime = 50
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	cost = 5

/obj/effect/proc_holder/spell/targeted/lichdom/cast(list/targets, mob/user = usr)
	for(var/mob/M in targets)
		var/list/hand_items = list()
		if(iscarbon(M))
			hand_items = list(M.get_active_held_item(), M.get_inactive_held_item())
		if(!hand_items.len)
			to_chat(M, span_warning("You must hold an item you wish to make your phylactery!"))
			return

		var/obj/item/marked_item
		for(var/obj/item/item in hand_items)
			marked_item = item
			to_chat(M, span_warning("You begin to focus your very being into [item]..."))
			break

		if(!marked_item)
			to_chat(M, span_warning("None of the items you hold are suitable for emplacement of your fragile soul."))
			return

		playsound(user, 'sound/misc/deadbell.ogg', 100, FALSE)
		playsound(user, pick('sound/vo/male/gen/agony (1).ogg','sound/vo/male/gen/agony (2).ogg'), 50, FALSE)
		new /obj/effect/temp_visual/cult/sparks(get_turf(user))

		user.visible_message(span_hierophant("[user] begins chanting in an otherworldly language as dark energies gather!"))
		to_chat(M, span_cultlarge("The ritual begins... There is no turning back now."))

		if(!do_after(M, 100, needhand=FALSE, target=marked_item))
			to_chat(M, span_warning("Your soul snaps back to your body as you stop ensouling [marked_item]!"))
			return

		user.visible_message(span_hierophant("Dark energies begin to swirl around [user] as blood starts to seep from their eyes and mouth!"))
		playsound(user, pick('sound/combat/fracture/fracturewet (1).ogg',
							'sound/combat/fracture/fracturewet (2).ogg',
							'sound/combat/fracture/fracturewet (3).ogg'), 100, TRUE)
		new /obj/effect/decal/cleanable/blood/gibs(get_turf(user))
		new /obj/effect/temp_visual/dir_setting/bloodsplatter(get_turf(user), pick(GLOB.alldirs))

		if(!do_after(M, 100, needhand=FALSE, target=marked_item))
			to_chat(M, span_warning("Your soul snaps back to your body as you stop ensouling [marked_item]!"))
			return

		user.visible_message(span_hierophant("[user]'s skin begins to turn ashen and crack as chunks of flesh slough off their bones!"))
		playsound(user, pick('sound/combat/fracture/fracturedry (1).ogg',
							'sound/combat/fracture/fracturedry (2).ogg',
							'sound/combat/fracture/fracturedry (3).ogg'), 100, TRUE)
		playsound(user, pick('sound/vo/male/gen/firescream (1).ogg',
							'sound/vo/male/gen/firescream (2).ogg',
							'sound/vo/male/gen/firescream (3).ogg'), 50, TRUE)
		new /obj/effect/decal/cleanable/blood/gibs(get_turf(user))
		new /obj/effect/temp_visual/dir_setting/bloodsplatter(get_turf(user), pick(GLOB.alldirs))

		if(!do_after(M, 100, needhand=FALSE, target=marked_item))
			to_chat(M, span_warning("Your soul snaps back to your body as you stop ensouling [marked_item]!"))
			return

		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			for(var/obj/item/bodypart/B in H.bodyparts)
				B.skeletonize(FALSE)

			H.hair_color = "bababa"
			H.facial_hair_color = "bababa"
			H.update_body()
			H.update_hair()
			H.update_body_parts(redraw = TRUE)

			ADD_TRAIT(H, TRAIT_NOMOOD, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_EASYDISMEMBER, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_LIMBATTACHMENT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOHUNGER, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOBREATH, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOSLEEP, TRAIT_GENERIC)
			H.mob_biotypes |= MOB_UNDEAD
			H.faction |= list("lesser_undead")

			H.change_stat("strength", -5)
			H.change_stat("endurance", -5)
			H.change_stat("speed", -3)
			H.change_stat("intelligence", 6)

			H.setMaxHealth(75)
			H.health = H.maxHealth

			playsound(user, 'sound/misc/deadbell.ogg', 100, FALSE)
			to_chat(M, span_cultlarge("Your mortal flesh burns away as dark energies suffuse your form! Blood boils to ash, organs crumble to dust, yet you endure. You have transcended death itself - you are now a lich!"))

		marked_item.name = "ensouled [marked_item.name]"
		marked_item.desc += "\nA terrible aura surrounds this item, its very existence is offensive to Yamais herself..."
		marked_item.add_atom_colour("#003300", ADMIN_COLOUR_PRIORITY)

		new /obj/item/lesser_phylactery(marked_item, M.mind)
		M.mind.RemoveSpell(src)

/obj/item/lesser_phylactery
	name = "lesser phylactery"
	desc = "A vessel containing a bound soul. The magic sustaining it seems unstable and rushed."
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "bluespace"
	color = "#003300"
	light_system = MOVABLE_LIGHT
	light_range = 2
	light_color = "#003300"
	var/resurrections = 0
	var/datum/mind/bound_mind
	var/static/active_phylacteries = 0

/obj/item/lesser_phylactery/Initialize(mapload, datum/mind/newmind)
	. = ..()
	bound_mind = newmind
	name = "phylactery of [bound_mind.name]"
	active_phylacteries++
	START_PROCESSING(SSobj, src)

/obj/item/lesser_phylactery/Destroy()
	STOP_PROCESSING(SSobj, src)
	active_phylacteries--
	return ..()

/obj/item/lesser_phylactery/process()
	if(QDELETED(bound_mind))
		qdel(src)
		return

	if(!bound_mind.current || (bound_mind.current && bound_mind.current.stat == DEAD))
		if(!bound_mind.current || !bound_mind.current.client)
			return
		resurrect()

/obj/item/lesser_phylactery/proc/resurrect()
	if(bound_mind.current && bound_mind.current.stat != DEAD)
		return

	var/turf/item_turf = get_turf(src)
	if(!item_turf)
		return

	var/mob/old_body = bound_mind.current
	var/mob/living/carbon/human/lich = new(item_turf)
	lich.real_name = bound_mind.name
	lich.name = bound_mind.name
	lich.key = bound_mind.current.key
	lich.invisibility = 0
	lich.alpha = 255
	lich.dna.species.on_species_gain(lich)
	lich.regenerate_icons()
	bound_mind.transfer_to(lich)
	lich.revive(TRUE, TRUE)

	for(var/obj/item/bodypart/B in lich.bodyparts)
		B.skeletonize(FALSE)

	lich.hair_color = "bababa"
	lich.facial_hair_color = "bababa"
	lich.update_body()
	lich.update_hair()
	lich.update_body_parts(redraw = TRUE)

	var/base_health = 75
	var/new_max_health = max(25, base_health - (25 * resurrections))
	lich.setMaxHealth(new_max_health)
	lich.health = lich.maxHealth
	lich.mob_biotypes |= MOB_UNDEAD
	lich.faction |= list("lesser_undead")

	ADD_TRAIT(lich, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(lich, TRAIT_EASYDISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(lich, TRAIT_LIMBATTACHMENT, TRAIT_GENERIC)
	ADD_TRAIT(lich, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(lich, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(lich, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(lich, TRAIT_NOSLEEP, TRAIT_GENERIC)

	lich.equip_to_slot_or_del(new /obj/item/clothing/shoes/roguetown/boots(lich), SLOT_SHOES)
	lich.equip_to_slot_or_del(new /obj/item/clothing/under/roguetown/tights/black(lich), SLOT_PANTS)
	lich.equip_to_slot_or_del(new /obj/item/clothing/suit/roguetown/shirt/robe/necromancer(lich), SLOT_ARMOR)

	if(old_body && old_body.loc)
		var/turf/body_turf = get_turf(old_body)
		if(iscarbon(old_body))
			var/mob/living/carbon/C = old_body
			for(var/obj/item/W in C)
				C.dropItemToGround(W)
			for(var/X in C.internal_organs)
				var/obj/item/organ/I = X
				I.Remove(C)
				I.forceMove(body_turf)

		var/obj/item/lich_tracking_bone/tracker = new(body_turf)
		tracker.target_phylactery = src
		tracker.lich_name = bound_mind.name

		old_body.visible_message(span_warning("Dark energies swirl as [old_body.name]'s corpse crumbles to dust! A single bone remains, humming with dark energy!"))
		playsound(old_body, 'sound/misc/deadbell.ogg', 100, FALSE)
		new /obj/effect/temp_visual/cult/sparks(body_turf)

		old_body.dust()

	lich.Paralyze(50 + 50*resurrections)
	resurrections++

	lich.change_stat("strength", -5)
	lich.change_stat("endurance", -5)
	lich.change_stat("speed", -3)
	lich.change_stat("intelligence", 6)

/obj/item/lich_tracking_bone
	name = "resonating bone"
	desc = "A bone fragment humming with dark energy. It seems to pull slightly in a certain direction..."
	icon = 'icons/roguetown/items/natural.dmi'
	icon_state = "bone"
	color = "#003300"
	light_system = MOVABLE_LIGHT
	light_range = 2
	light_color = "#003300"
	var/obj/item/lesser_phylactery/target_phylactery
	var/lich_name

/obj/item/lich_tracking_bone/Initialize()
	. = ..()
	name = "resonating bone of [lich_name]"
	START_PROCESSING(SSobj, src)

/obj/item/lich_tracking_bone/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/lich_tracking_bone/process()
	if(QDELETED(target_phylactery))
		visible_message(span_warning("[src] crumbles to dust as its energy fades away!"))
		qdel(src)

/obj/item/lich_tracking_bone/examine(mob/user)
	. = ..()
	if(!QDELETED(target_phylactery))
		var/turf/T = get_turf(target_phylactery)
		var/turf/U = get_turf(src)
		var/direction = get_dir(U, T)
		. += span_warning("The bone pulls [dir2text(direction)].")
	else
		. += span_warning("The bone seems inert.")
