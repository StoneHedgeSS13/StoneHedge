/datum/action/cooldown/spell/undirected/wildrage
	name = "Wild Rage"
	desc = "Enter a rage, that releases all the magic roiling inside you, causing a random magical effect."
	button_icon_state = "bcry"
	sound = 'sound/magic/barbroar.ogg'

	antimagic_flags = NONE

	associated_skill = /datum/skill/combat/unarmed
	associated_stat = STATKEY_STR

	charge_required = FALSE
	has_visual_effects = FALSE
	cooldown_time = 1 MINUTES
	spell_type = SPELL_STAMINA
	spell_cost = 10

/datum/action/cooldown/spell/undirected/wildrage/is_valid_target(atom/cast_on)
	. = ..()
	if(!.)
		return
	return isliving(owner)

/datum/action/cooldown/spell/undirected/wildrage/cast(mob/living/cast_on)
	. = ..()
	cast_on.emote("rage", forced = TRUE)
	cast_on.apply_status_effect(/datum/status_effect/buff/wildrage)

	var/turf/target_turf = get_turf(cast_on)
	if(!target_turf)
		return FALSE
	owner.visible_message(span_notice("[owner] causes unpredictable magical effects."))

	switch(rand(1, 8))
		if(1)
			var/datum/action/cooldown/spell/enchantment/green_flame/G = new
			G.owner = owner
			G.cast(owner)
			owner.visible_message(span_danger("[owner] infuses their weapon!"))
		if(2)
			var/datum/action/cooldown/spell/aoe/on_turf/ensnare/E = new
			E.owner = owner
			E.cast(target_turf)
			owner.visible_message(span_danger("[owner] summons ensnare!"))
		if(3)
			var/datum/action/cooldown/spell/undirected/teleport/radius_turf/T = new
			T.owner = owner
			T.inner_tele_radius = 1
			T.outer_tele_radius = 5
			T.cast(owner)
			owner.visible_message(span_danger("[owner] teleports randomly!"))
		if(4)
			var/datum/action/cooldown/spell/healing/greater/H = new
			H.owner = owner
			H.cast(owner)
			owner.visible_message(span_danger("[owner] heals rapidly!"))
		if(5)
			var/atom/target = get_ranged_target_turf(owner, owner.dir, 8)
			if(!target)
				return

			var/datum/action/cooldown/spell/projectile/lightning/L = new
			L.owner = owner
			L.cast(target)
			owner.visible_message(span_danger("[owner] shoots lightning!"))
		if(6)
			var/atom/flash_target = get_ranged_target_turf(owner, owner.dir, 5)
			if(flash_target)
				var/datum/action/cooldown/spell/projectile/flashpowder/F = new
				F.owner = owner
				F.cast(flash_target)
				owner.visible_message(span_danger("[owner] casts flashpowder!"))

		if(7)
			var/datum/action/cooldown/spell/aoe/repulse/R = new
			R.owner = owner
			R.cast(owner)
			owner.visible_message(span_danger("[owner] causes a repulse!"))
		if(8)
			var/datum/action/cooldown/spell/undirected/blade_ward/BW = new
			BW.owner = owner
			owner.visible_message(span_notice("[owner] traces a warding sigil in the air!"))
			BW.cast(owner)
