/datum/action/cooldown/spell/after_cast(atom/cast_on)
	. = ..()

	handle_wild_magic(cast_on)

/datum/action/cooldown/spell/proc/restore_frog_form(mob/living/frog)
	if(!frog || QDELETED(frog))
		return

	var/datum/status_effect/shapechange_mob/from_spell/shape = frog.has_status_effect(/datum/status_effect/shapechange_mob/from_spell)

	if(!shape)
		return

	frog.visible_message(
		span_notice("[frog] shimmers and reforms into their original shape!"))
	shape.restore_caster()


/datum/action/cooldown/spell/proc/restore_mist_form(mob/living/mist)
	if(!mist || QDELETED(mist))
		return

	var/datum/status_effect/shapechange_mob/from_spell/shape = mist.has_status_effect(/datum/status_effect/shapechange_mob/from_spell)

	if(!shape)
		return

	mist.visible_message(
		span_notice("The mist condenses, reforming into a solid body!"))
	shape.restore_caster()

/datum/action/cooldown/spell/proc/restore_cat_form(mob/living/cat)
    if(!cat || QDELETED(cat))
        return
    var/datum/status_effect/shapechange_mob/from_spell/shape = cat.has_status_effect(/datum/status_effect/shapechange_mob/from_spell)
    if(!shape)
        return
    cat.visible_message(span_notice("[cat] shimmers and reforms into their original shape!"))
    shape.restore_caster()

/datum/action/cooldown/spell/proc/restore_crow_form(mob/living/crow)
    if(!crow || QDELETED(crow))
        return
    var/datum/status_effect/shapechange_mob/from_spell/shape = crow.has_status_effect(/datum/status_effect/shapechange_mob/from_spell)
    if(!shape)
        return
    crow.visible_message(span_notice("The crow reforms into [owner]'s original body!"))
    shape.restore_caster()

/datum/action/cooldown/spell/proc/handle_wild_magic(atom/cast_on)
	if(!owner)
		return
	if(!HAS_TRAIT(owner, TRAIT_WILDMAGIC))
		return
	if(prob(30))
		return

	owner.visible_message(span_notice("[owner] causes unpredictable magical effects."))
	switch(rand(1, 50))
		if(1)
			var/datum/action/cooldown/spell/enchantment/green_flame/G = new
			G.owner = owner
			G.cast(owner)
			owner.visible_message(span_danger("[owner] infuses their weapon!"))
		if(2)
			var/obj/projectile/magic/flashpowder/P = new
			P.fire(owner, target)
			owner.visible_message(span_danger("[owner] casts flashpowder!"))
		if(3)
			var/datum/action/cooldown/spell/undirected/teleport/radius_turf/T = new
			T.owner = owner
			T.inner_tele_radius = 1
			T.outer_tele_radius = 5
			T.cast(owner)
			owner.visible_message(span_danger("[owner] vanishes in a violent magical distortion!"))
		if(4)
			var/datum/action/cooldown/spell/projectile/fireball/F = new
			F.owner = owner
			owner.visible_message(span_danger("[owner]'s unstable magic erupts into a FIREBALL!"))
			F.cast(cast_on)
		if(5)
			var/datum/action/cooldown/spell/aoe/on_turf/ensnare/E = new
			E.owner = owner
			var/turf/center
			if(isturf(cast_on))
				center = cast_on
			else
				center = get_turf(cast_on)
			if(center)
				owner.visible_message(span_danger("Arcyne tendrils erupt from the ground around [owner]!"))
				E.cast(center)
		if(6)
			var/datum/action/cooldown/spell/undirected/touch/entangler/H = new
			H.owner = owner
			owner.visible_message(span_nicegreen("Living vines spiral around [owner]'s hand as Dendor answers the chaos!"))
			H.cast(owner)
		if(7)
			var/datum/action/cooldown/spell/undirected/shapeshift/frog/F = new
			F.owner = owner
			owner.visible_message(span_danger("[owner]'s body twists and collapses into a small, croaking shape!"))
			var/mob/living/frog = F.do_shapeshift(owner)
			if(!frog)
				return
			addtimer(
				CALLBACK(src, PROC_REF(restore_frog_form), frog), 10 SECONDS)
		if(8)
			var/datum/action/cooldown/spell/undirected/shapeshift/mist/M = new
			M.owner = owner
			owner.visible_message(span_danger("[owner]'s body dissolves into drifting mist!"))
			var/mob/living/mist = M.do_shapeshift(owner)
			if(!mist)
				return
			addtimer(CALLBACK(src, PROC_REF(restore_mist_form), mist), 10 SECONDS)
		if(9)
			var/datum/action/cooldown/spell/undirected/jaunt/ethereal_jaunt/J = new
			J.owner = owner
			owner.visible_message(span_danger("[owner] flickers and slips partially out of reality!"))
			J.cast(owner)
		if(10)
			var/datum/action/cooldown/spell/undirected/conjure_item/smoke_bomb/S = new
			S.owner = owner
			owner.visible_message(span_notice("[owner] coughs as a cloud of smoke erupts from thin air!"))
			S.cast(owner)
		if(11)
			var/datum/action/cooldown/spell/undirected/conjure_item/poison_bomb/P = new
			P.owner = owner
			owner.visible_message(span_danger("[owner]'s magic curdles into a sickly green vapor!"))
			P.cast(owner)
		if(12)
			var/datum/action/cooldown/spell/undirected/conjure_item/light/L = new
			L.owner = owner
			owner.visible_message(span_notice("A brilliant orb of condensed light bursts into existence near [owner]!"))
			L.cast(owner)
		if(13)
			var/datum/action/cooldown/spell/undirected/conjure_item/brick/B = new
			B.owner = owner
			owner.visible_message(span_warning("Reality hardens in [owner]'s hand with a dull, ominous *thunk*!"))
			B.cast(owner)
		if(14)
			var/datum/action/cooldown/spell/status/guidance/G = new
			G.owner = owner
			owner.visible_message(span_notice("[owner] mutters a small incantation; a faint orange glow surrounds them briefly!"))
			G.cast(owner)
		if(15)
			var/datum/action/cooldown/spell/status/haste/H = new
			H.owner = owner
			owner.visible_message(span_notice("[owner] whispers a quick spell; their movements shimmer and quicken!"))
			H.cast(owner)
		if(16)
			var/datum/action/cooldown/spell/undirected/giant_shape/G = new
			G.owner = owner
			owner.visible_message(span_notice("[owner] channels the power of a giant; their body begins to grow and tremble!"))
			G.cast(owner)
		if(17)
			var/datum/action/cooldown/spell/undirected/shadow_step/SS = new
			SS.owner = owner
			owner.visible_message(span_warning("[owner] melts into the shadows!"))
			SS.cast(owner)
		if(18)
			var/datum/action/cooldown/spell/undirected/secondsight/SSS = new
			SSS.owner = owner
			owner.visible_message(span_notice("[owner]'s vision sharpens, revealing hidden truths!"))
			SSS.cast(owner)
		if(19)
			var/datum/action/cooldown/spell/undirected/blade_ward/BW = new
			BW.owner = owner
			owner.visible_message(span_notice("[owner] traces a warding sigil in the air!"))
			BW.cast(owner)
		if(20)
			var/datum/action/cooldown/spell/undirected/longstrider/LS = new
			LS.owner = owner
			owner.visible_message(span_notice("[owner] mutters an incantation and a dim pulse of light radiates out from them!"))
			LS.cast(owner)
		if(21)
			var/datum/action/cooldown/spell/undirected/feather_falling/FF = new
			FF.owner = owner
			owner.visible_message(span_notice("[owner] whispers the incantation and a soft aura surrounds them!"))
			FF.cast(owner)
		if(22)
			var/datum/action/cooldown/spell/undirected/forcewall/FW = new
			FW.owner = owner
			owner.visible_message(span_notice("[owner] conjures a shimmering wall of force!"))
			FW.cast(owner)
		if(23)
			var/datum/action/cooldown/spell/projectile/lightning/BOL = new
			BOL.owner = owner
			owner.visible_message(span_warning("[owner] yells 'THUNDER STRIKE!!!' and lightning crackles around them!"))
			BOL.cast(owner)
		if(24)
			var/datum/action/cooldown/spell/projectile/frost_bolt/FB = new
			FB.owner = owner
			owner.visible_message(span_notice("[owner] hurls a beam of frost forward!"))
			FB.cast(owner)
		if(25)
			var/datum/action/cooldown/spell/projectile/arcyne_bolt/AB = new
			AB.owner = owner
			owner.visible_message(span_notice("[owner] fires rapid bolts of arcyne power!"))
			AB.cast(owner)
		if(26)
			var/datum/action/cooldown/spell/projectile/acid_splash/AS = new
			AS.owner = owner
			owner.visible_message(span_warning("[owner] hurls a glob of caustic acid!"))
			AS.cast(owner)
		if(27)
			var/datum/action/cooldown/spell/conjure/kneestingers/KNI = new
			KNI.owner = owner
			owner.visible_message(span_notice("[owner] whispers 'Treefather light the way.' and kneestingers sprout!"))
			KNI.cast(owner)
		if(28)
			var/datum/action/cooldown/spell/conjure/phantom_ear/PE = new
			PE.owner = owner
			owner.visible_message(span_notice("[owner] whispers 'Lend me thine ear.' and a phantom ear appears."))
			PE.cast(owner)
		if(29)
			var/datum/action/cooldown/spell/conjure/rous/RO = new
			RO.owner = owner
			owner.visible_message(span_notice("[owner] calls for their brethren!"))
			RO.cast(owner)
		if(30)
			var/datum/action/cooldown/spell/conjure/bonfire/BO = new
			BO.owner = owner
			owner.visible_message(span_notice("[owner] shouts 'Bonfire!' and a magical flame appears."))
			BO.cast(owner)
		if(31)
			var/datum/action/cooldown/spell/conjure/raise_lesser_undead/UL = new
			UL.owner = owner
			owner.visible_message(span_warning("[owner] shouts 'SERVE ME!' and a skeleton rises."))
			UL.cast(owner)
		if(32)
			var/datum/action/cooldown/spell/conjure/web/WB = new
			WB.owner = owner
			owner.visible_message(span_notice("[owner] whispers 'Strands that bind!' and webs appear around you."))
			WB.cast(owner)
		if(33)
			var/datum/action/cooldown/spell/conjure/familiar/FM = new
			FM.owner = owner
			owner.visible_message(span_notice("[owner] shouts 'B'ST FR'ND!' and a spectral wolf familiar appears."))
			FM.cast(owner)
		if(34)
			var/datum/action/cooldown/spell/beam/beam_of_frost/BOF = new
			BOF.owner = owner
			owner.visible_message(span_notice("[owner] shouts 'Chill!' and a frost beam emerges."))
			BOF.cast(owner)
		if(35)
			var/datum/action/cooldown/spell/aoe/on_turf/snap_freeze/SF = new
			SF.owner = owner
			owner.visible_message(span_notice("[owner] shouts 'Air be still!' and frost envelops the area."))
			SF.cast(owner)
		if(36)
			var/datum/action/cooldown/spell/aoe/on_turf/meteor_storm/MS = new
			MS.owner = owner
			owner.visible_message(span_boldwarning("[owner] shouts 'METEOR STORM!!!' and meteors rain from the sky!"))
			MS.cast(owner)
		if(37)
			var/datum/action/cooldown/spell/aoe/on_turf/arcyne_storm/AS = new
			AS.owner = owner
			owner.visible_message(span_notice("[owner] shouts 'BE TORN APART!!!' and arcyne energy swirls."))
			AS.cast(owner)
		if(38)
			var/datum/action/cooldown/spell/aoe/repulse/RP = new
			RP.owner = owner
			owner.visible_message(span_notice("[owner] shouts 'GITTAH WEIGH' and throws everything around away!"))
			RP.cast(owner)
		if(39)
			var/datum/action/cooldown/spell/aoe/repulse/dragon/TS = new
			TS.owner = owner
			owner.visible_message(span_notice("[owner] sweeps their tail with force!"))
			TS.cast(owner)
		if(40)
			var/datum/action/cooldown/spell/aoe/churn_undead/CU = new
			CU.owner = owner
			owner.visible_message(span_notice("[owner] shouts 'The Undermaiden rebukes!' and churns the undead."))
			CU.cast(owner)
		if(41)
			var/datum/action/cooldown/spell/undirected/shapeshift/cat/C = new
			C.owner = owner
			owner.visible_message(span_danger("[owner]'s body shifts and shrinks into a nimble cat!"))
			var/mob/living/cat = C.do_shapeshift(owner)
			if(!cat)
				return
			addtimer(CALLBACK(src, PROC_REF(restore_cat_form), cat), 10 SECONDS)
		if(42)
			var/datum/action/cooldown/spell/undirected/shapeshift/crow/C = new
			C.owner = owner
			owner.visible_message(span_danger("[owner]'s body twists and feathers sprout as they become a crow!"))
			var/mob/living/crow = C.do_shapeshift(owner)
			if(!crow)
				return
			addtimer(CALLBACK(src, PROC_REF(restore_crow_form), crow), 10 SECONDS)
		if(43)
			var/datum/action/cooldown/spell/gravity/G = new
			G.owner = owner
			owner.visible_message(span_danger("[owner] crushes the space around [target]!"))
			G.cast(cast_on)
		if(44)
			var/datum/action/cooldown/spell/find_flaw/FF = new
			FF.owner = owner
			owner.visible_message(span_notice("[owner] peers into [target] and detects hidden flaws!"))
			FF.cast(cast_on)
		if(45)
			var/datum/action/cooldown/spell/chill_touch/CT = new
			CT.owner = owner
			owner.visible_message(span_danger("[owner] reaches out with a skeletal hand!"))
			CT.cast(cast_on)
		if(46)
			var/datum/action/cooldown/spell/blade_burst/BB = new
			BB.owner = owner
			owner.visible_message(span_danger("[owner] summons a storm of blades!"))
			BB.cast(cast_on)
		if(47)
			var/datum/action/cooldown/spell/beast_tame/BT = new
			BT.owner = owner
			owner.visible_message(span_notice("[owner] whispers to tame the wild beast!"))
			BT.cast(cast_on)
		if(48)
			var/datum/action/cooldown/spell/blindness/BL = new
			BL.owner = owner
			owner.visible_message(span_danger("[owner] shrouds [target]'s eyes in darkness!"))
			BL.cast(cast_on)
		if(49)
			var/datum/action/cooldown/spell/essence/silence/SIL = new
			SIL.owner = owner
			owner.visible_message(span_notice("[owner] creates a zone of absolute silence!"))
			SIL.cast(cast_on)
		if(50)
			var/datum/action/cooldown/spell/essence/toxic_cleanse/TC = new
			TC.owner = owner
			owner.visible_message(span_notice("[owner] cleanses all toxins from the area!"))
			TC.cast(cast_on)
