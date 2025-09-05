/obj/effect/proc_holder/spell/invoked/smite
	name = "Divine Smite"
	overlay_state = "null"
	releasedrain = 50
	chargetime = 3
	charge_max = 10 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy //can be arcane, druidic, blood, holy
	miracle = TRUE
	devotion_cost = 5

	invocation = "I CAST YOU DOWN!"
	invocation_type = "shout" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/invoked/smite/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/mob/living/L = target
		var/mob/U = user
		var/obj/item/held_item = user.get_active_held_item() //get held item
		var/aoe_range = 1
		if(held_item)
			held_item.melee_attack_chain(U, L)
			L.adjustFireLoss(20) //burn target
			playsound(target, 'sound/items/firesnuff.ogg', 100)
			if(L.mob_biotypes & MOB_UNDEAD)
				L.visible_message(span_danger("[L] is burned by holy light!"), span_userdanger("I'm burned by holy light!"))
				L.adjustFireLoss(10)
				L.fire_act(1,10)
				return TRUE
			//burn effect and sound
			for(var/mob/living/M in range(aoe_range, get_turf(target))) //burn non-user mobs in an aoe
				if(M != user)
					M.adjustFireLoss(20) //burn target
					//burn effect and sound
					new /obj/effect/temp_visual/divinesmite(get_turf(M))
					playsound(M, 'sound/items/firelight.ogg', 100)
					if(M.mob_biotypes & MOB_UNDEAD)
						M.visible_message(span_danger("[M] is burned by holy light!"), span_userdanger("I'm burned by holy light!"))
						M.adjustFireLoss(10)
						M.fire_act(1,10)
						return TRUE

/obj/effect/temp_visual/divinesmite
	icon = 'icons/effects/beam.dmi'
	icon_state = "volt_ray"
	name = "smite-light"
	desc = "Holy fire. Interesting."
	randomdir = FALSE
	duration = 1 SECONDS
	layer = ABOVE_ALL_MOB_LAYER

/obj/effect/proc_holder/spell/invoked/divine_weapon
	name = "Divine Weapon"
	overlay_state = "aqua"
	releasedrain = 15
	chargedrain = 0
	chargetime = 15 SECONDS
	range = 3
	movement_interrupt = FALSE
	chargedloop = /datum/looping_sound/invokeholy
	sound = 'sound/magic/holyshield.ogg'
	invocation = "LET US ARM OURSELVES AND BEGIN THIS GRIM BALLET OF WAR!!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 300 SECONDS
	miracle = TRUE
	devotion_cost = 50

/obj/effect/proc_holder/spell/invoked/divine_weapon/cast(list/targets, mob/user = usr)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target == user)
			user.put_in_hands(giveweapon(user), FALSE)
			return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/divine_weapon/proc/giveweapon(mob/living/carbon/human/H)
	var/item_type = /obj/item/rogueweapon/sword
	var/obj/item/item
	item = new item_type
	item.infusable = FALSE
	item.AddComponent(/datum/component/holy_weapon, H)
	item.AddComponent(/datum/component/singing_item, H)
	item.AddComponent(/datum/component/spirit_holding, null, null)
	return item

/datum/component/holy_weapon
	var/obj/item/rogueweapon/weapon
	var/mob/living/weapon_owner
	var/patronchoice
	var/weapons = list(
		/obj/item/rogueweapon/huntingknife/cleaver, /obj/item/rogueweapon/huntingknife/idagger/steel, //daggers
		/obj/item/rogueweapon/sword/rapier, /obj/item/rogueweapon/sword/long, /obj/item/rogueweapon/greatsword, //swords
		/obj/item/rogueweapon/mace/steel, /obj/item/rogueweapon/mace/goden/steel, //blunt
		/obj/item/rogueweapon/stoneaxe/woodcut/steel, /obj/item/rogueweapon/stoneaxe/battle, //axes
		/obj/item/rogueweapon/whip, /obj/item/rogueweapon/flail/sflail, /obj/item/rogueweapon/flail/peasantwarflail, //flails
		/obj/item/rogueweapon/spear, /obj/item/rogueweapon/halberd, /obj/item/rogueweapon/eaglebeak, /obj/item/rogueweapon/sickle/scythe //polearms
		)

/datum/component/holy_weapon/Initialize(mob/living/L)
	if(!istype(parent, /obj/item/rogueweapon))
		return COMPONENT_INCOMPATIBLE
	else
		weapon_owner = L
		weapon = parent
		weapon.name += ", [L.patron.name]'s Eternal Dance"
		weapon.desc += " It is summoned by divine power, and uses the wielder's connection to it instead of standard abilities. Right click with an empty hand to change this weapon's form."
		weapon.force *= 1.2
		weapon.throwforce *= 1.2
		weapon.block_chance *= 1.2
		weapon.armor_penetration *= 1.2
		weapon.wdefense *= 1.2
		weapon.max_blade_int *= 1.2
		weapon.blade_int = weapon.max_blade_int
		weapon.max_integrity *= 2
		weapon.obj_integrity = weapon.max_integrity
		// weapon.add_atom_colour("#f9a602", FIXED_COLOUR_PRIORITY) // I thought to make the weapons golden, but it doesn't show up on the onmob sprite, and I'm too braindead to figure it out
		weapon.minstr = 1
		weapon.smeltresult = null // Do not melt your funky holy weapon
		ADD_TRAIT(weapon, TRAIT_NOEMBED, TRAIT_GENERIC)
		weapon.associated_skill = /datum/skill/magic/holy
		//var/mutable_appearance/magic_overlay = mutable_appearance('icons/effects/effects.dmi', "electricity")
		//item.add_overlay(magic_overlay)

/datum/component/holy_weapon/RegisterWithParent()
	if(istype(parent, /obj/item/rogueweapon))
		RegisterSignal(parent, COMSIG_ATOM_ATTACK_HAND_RIGHT, PROC_REF(attack_right))
		RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(equipped))
		// RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(dropped))

/datum/component/holy_weapon/proc/attack_right(obj/item/source, mob/user)
	var/mob/living/target = user
	if(target == weapon_owner)
		var/obj/item/rogueweapon/weaponchoice = input("Choose your holy weapon", "Available weapons") as anything in weapons
		var/obj/item/item
		item = new weaponchoice
		item.AddComponent(/datum/component/holy_weapon, weapon_owner)
		item.AddComponent(/datum/component/singing_item, parent.GetComponent(/datum/component/singing_item).weapon_owner, parent.GetComponent(/datum/component/singing_item).personality)
		var/datum/mind/soul_to_bind = null
		if(parent.GetComponent(/datum/component/spirit_holding).bound_spirit)
			soul_to_bind = parent.GetComponent(/datum/component/spirit_holding).bound_spirit.mind
		item.AddComponent(/datum/component/spirit_holding, soul_to_bind, target)
		weapon_owner.put_in_hands(item, FALSE)
		qdel(parent)
	else
		to_chat(weapon_owner, span_warning("[target] tried to activate [weapon]!"))
		weapon.say("You are not my master...")

/datum/component/holy_weapon/proc/equipped(obj/item/source, mob/user, slot)
	var/mob/living/target = user
	if(target != weapon_owner) //you dont own the weapon
		to_chat(weapon_owner, span_warning("[target] tried to equip [weapon]!")) //message the rightful owner
		to_chat(target, span_danger("[weapon] slips from your grasp!")) //message the wielder
		target.dropItemToGround(source) //this is not yours, drop it

/obj/effect/proc_holder/spell/invoked/revive/minhur
	name = "Raise Unto Battle"
	invocation = "RISE! STAND! SING! THE BATTLE WAITS NOT FOR YOU!!"
