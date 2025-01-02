
/obj/item/book/granter/spell/spells5e/
	desc = "A scroll of potential known only to those that can decipher its secrets."
	icon = 'icons/roguetown/items/misc.dmi'
	oneuse = TRUE
	drop_sound = 'sound/foley/dropsound/paper_drop.ogg'
	pickup_sound =  'sound/blank.ogg'
	remarks = list("Fascinating!", "Is that so...", "Like this?", "Really now...", "There's a little schmutz on this section...")
	sellprice = 30

/obj/item/book/granter/spell/spells5e/get_real_price()
	return sellprice

/obj/item/book/granter/spell/spells5e/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		qdel(src) //no need this trash.
		user.visible_message(span_warning("[src] has had its magic ink ripped from the scroll, it disintegrates to dust!"))

// Containers and Special Items
//backpack prepacked with scrolls for testing
/obj/item/storage/backpack/rogue/backpack/spells5e/PopulateContents()
	new /obj/item/book/granter/spell/spells5e/acidsplash5e(src)
	new /obj/item/book/granter/spell/spells5e/bladeward5e(src)
	new /obj/item/book/granter/spell/spells5e/createbonfire5e(src)
	new /obj/item/book/granter/spell/spells5e/chilltouch5e(src)
	new /obj/item/book/granter/spell/spells5e/frostbite5e(src)
	new /obj/item/book/granter/spell/spells5e/guidance5e(src)
	new /obj/item/book/granter/spell/spells5e/infestation5e(src)
	new /obj/item/book/granter/spell/spells5e/light5e(src)
	new /obj/item/book/granter/spell/spells5e/lightninglure5e(src)
	new /obj/item/book/granter/spell/spells5e/magicstone5e(src)

// Cantrips (Level 0)
/obj/item/book/granter/spell/spells5e/acidsplash5e
	name = "Scroll of Acid Splash"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e
	spellname = "acid splash"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/bladeward5e
	name = "Scroll of Blade Ward"
	spell = /obj/effect/proc_holder/spell/self/bladeward5e
	spellname = "blade ward"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/boomingblade5e
	name = "Scroll of Booming Blade"
	spell = /obj/effect/proc_holder/spell/invoked/boomingblade5e
	spellname = "booming blade"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/chilltouch5e
	name = "Scroll of Chill Touch"
	spell = /obj/effect/proc_holder/spell/invoked/chilltouch5e
	spellname = "chill touch"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/createbonfire5e
	name = "Scroll of Create Bonfire"
	spell = /obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e
	spellname = "create bonfire"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/decompose5e
	name = "Scroll of Decompose"
	spell = /obj/effect/proc_holder/spell/invoked/decompose5e
	spellname = "decompose"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/eldritchblast5e
	name = "Scroll of Eldritch Blast"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/eldritchblast5e
	spellname = "eldritch blast"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/encodethoughts5e
	name = "Scroll of Encode Thoughts"
	spell = /obj/effect/proc_holder/spell/targeted/encodethoughts5e
	spellname = "encode thoughts"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/firebolt5e
	name = "Scroll of Fire Bolt"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/firebolt5e
	spellname = "fire bolt"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/frostbite5e
	name = "Scroll of Frostbite"
	spell = /obj/effect/proc_holder/spell/invoked/frostbite5e
	spellname = "frostbite"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/greenflameblade5e
	name = "Scroll of Green-Flame Blade"
	spell = /obj/effect/proc_holder/spell/invoked/greenflameblade5e
	spellname = "green-flame blade"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/guidance5e
	name = "Scroll of Guidance"
	spell = /obj/effect/proc_holder/spell/invoked/guidance5e
	spellname = "guidance"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/infestation5e
	name = "Scroll of Infestation"
	spell = /obj/effect/proc_holder/spell/invoked/infestation5e
	spellname = "infestation"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/light5e
	name = "Scroll of Light"
	spell = /obj/effect/proc_holder/spell/self/light5e
	spellname = "light"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/lightninglure5e
	name = "Scroll of Lightning Lure"
	spell = /obj/effect/proc_holder/spell/targeted/lightninglure5e
	spellname = "lightning lure"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/magicstone5e
	name = "Scroll of Magic Stone"
	spell = /obj/effect/proc_holder/spell/invoked/magicstone5e
	spellname = "magic stone"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/mending5e
	name = "Scroll of Mending"
	spell = /obj/effect/proc_holder/spell/invoked/mending5e
	spellname = "mending"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/mindsliver5e
	name = "Scroll of Mind Sliver"
	spell = /obj/effect/proc_holder/spell/invoked/mindsliver5e
	spellname = "mind sliver"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/poisonspray5e
	name = "Scroll of Poison Spray"
	spell = /obj/effect/proc_holder/spell/invoked/poisonspray5e
	spellname = "poison spray"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/primalsavagery5e
	name = "Scroll of Primal Savagery"
	spell = /obj/effect/proc_holder/spell/self/primalsavagery5e
	spellname = "primal savagery"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/rayoffrost5e
	name = "Scroll of Ray of Frost"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/rayoffrost5e
	spellname = "ray of frost"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/replenishnature5e
	name = "Scroll of Replenish Nature"
	spell = /obj/effect/proc_holder/spell/invoked/replenish
	spellname = "replenish nature"
	icon_state = "scrollred"

// Level 1 Spells - Cost 400
/obj/item/book/granter/spell/spells5e/bladeburst5e
	name = "Scroll of Blade Burst"
	spell = /obj/effect/proc_holder/spell/invoked/blade_burst
	spellname = "blade burst"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells5e/darkvision5e
	name = "Scroll of Darkvision"
	spell = /obj/effect/proc_holder/spell/targeted/touch/darkvision
	spellname = "darkvision"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells5e/featherfall5e
	name = "Scroll of Featherfall"
	spell = /obj/effect/proc_holder/spell/invoked/featherfall
	spellname = "featherfall"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells5e/fetch5e
	name = "Scroll of Fetch"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fetch
	spellname = "fetch"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells5e/forcewall5e
	name = "Scroll of Force Wall"
	spell = /obj/effect/proc_holder/spell/invoked/forcewall_weak
	spellname = "force wall"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells5e/haste5e
	name = "Scroll of Haste"
	spell = /obj/effect/proc_holder/spell/invoked/haste
	spellname = "haste"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells5e/message5e
	name = "Scroll of Message"
	spell = /obj/effect/proc_holder/spell/invoked/message
	spellname = "message"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells5e/prestidigitation5e
	name = "Scroll of Prestidigitation"
	spell = /obj/effect/proc_holder/spell/targeted/touch/prestidigitation
	spellname = "prestidigitation"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells5e/push5e
	name = "Scroll of Repulse"
	spell = /obj/effect/proc_holder/spell/invoked/push_spell
	spellname = "repulse"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells5e/slowdown5e
	name = "Scroll of Slowdown"
	spell = /obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe
	spellname = "slowdown"
	icon_state = "scrollblue"

// Level 2 Spells - Cost 800
/obj/item/book/granter/spell/spells5e/animateobject5e
	name = "Scroll of Animate Object"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/animate_object
	spellname = "animate object"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/cloakofflies5e
	name = "Scroll of Cloak of Flies"
	spell = /obj/effect/proc_holder/spell/self/cloakofflies
	spellname = "cloak of flies"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/drainstamina5e
	name = "Scroll of Drain"
	spell = /obj/effect/proc_holder/spell/invoked/drain_stam
	spellname = "drain"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/eldritchcurse5e
	name = "Scroll of Eldritch Curse"
	spell = /obj/effect/proc_holder/spell/invoked/eldritchcurse
	spellname = "eldritch curse"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/eldritchhealing5e
	name = "Scroll of Eldritch Healing"
	spell = /obj/effect/proc_holder/spell/invoked/eldritchhealing
	spellname = "eldritch healing"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/greaterfireball5e
	name = "Scroll of Greater Fireball"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater
	spellname = "greater fireball"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/instantsummons5e
	name = "Scroll of Item Summons"
	spell = /obj/effect/proc_holder/spell/targeted/summonitem
	spellname = "item summons"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/lightningbolt5e
	name = "Scroll of Lightning Bolt"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt
	spellname = "lightning bolt"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/nondetection5e
	name = "Scroll of Nondetection"
	spell = /obj/effect/proc_holder/spell/targeted/touch/nondetection
	spellname = "nondetection"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/seeliedust5e
	name = "Scroll of Seelie Dust"
	spell = /obj/effect/proc_holder/spell/invoked/seelie_dust
	spellname = "seelie dust"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/seeliekiss5e
	name = "Scroll of Regenerative Kiss"
	spell = /obj/effect/proc_holder/spell/targeted/seelie_kiss
	spellname = "regenerative kiss"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/stripclothes5e
	name = "Scroll of Strip Clothes"
	spell = /obj/effect/proc_holder/spell/invoked/strip
	spellname = "strip clothes"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/summonrat5e
	name = "Scroll of Call Beast"
	spell = /obj/effect/proc_holder/spell/invoked/summon_rat
	spellname = "call beast"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/tamerous5e
	name = "Scroll of Tame Rous"
	spell = /obj/effect/proc_holder/spell/targeted/roustame
	spellname = "tame rous"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells5e/watersplash5e
	name = "Scroll of Water Splash"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/splash
	spellname = "water splash"
	icon_state = "scrollgreen"

// Level 3 Spells - Cost 1600
/obj/item/book/granter/spell/spells5e/bloodbolt5e
	name = "Scroll of Blood Bolt"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning
	spellname = "blood bolt"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells5e/bloodsteal5e
	name = "Scroll of Blood Steal"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/bloodsteal
	spellname = "blood steal"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells5e/commandundead5e
	name = "Scroll of Command Undead"
	spell = /obj/effect/proc_holder/spell/self/command_undead
	spellname = "command undead"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells5e/disappear5e
	name = "Scroll of Disappear"
	spell = /obj/effect/proc_holder/spell/invoked/Disappear
	spellname = "disappear"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells5e/eyebite5e
	name = "Scroll of Eyebite"
	spell = /obj/effect/proc_holder/spell/invoked/eyebite
	spellname = "eyebite"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells5e/findfamiliar5e
	name = "Scroll of Find Familiar"
	spell = /obj/effect/proc_holder/spell/self/findfamiliar
	spellname = "find familiar"
	icon_state = "scrollpurple"

/* it's broken but i'll fix it later.
/obj/item/book/granter/spell/spells5e/lichdom5e
	name = "Scroll of Lesser Lichdom"
	desc = "A dark necromantic scroll that seems to pulse with an otherworldly energy. The parchment is made of an unusual material that feels cold to the touch, and the ink seems to writhe and move of its own accord."
	spell = /obj/effect/proc_holder/spell/targeted/lichdom
	spellname = "lesser lichdom"
	icon_state = "scrollpurple"
	remarks = list("The pursuit of immortality through lichdom is a dangerous path, one that strips away not only your mortal form but your very soul.", "A soul bound to a phylactery is never truly free. The price of eternal life is a curse, for the lich will never know rest again.", "To achieve lichdom, one must master the deepest secrets of necromancy—those that most would call abominable. But is it worth the cost?", "In the pursuit of godlike power, a lich sacrifices all that is left of their humanity. The question remains—what is the point of eternal life if you lose what makes you truly alive?")
*/
/obj/item/book/granter/spell/spells5e/lifesteal5e
	name = "Scroll of Life Steal"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/lifesteal
	spellname = "life steal"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells5e/mistystep5e
	name = "Scroll of Misty Step"
	spell = /obj/effect/proc_holder/spell/targeted/ethereal_jaunt
	spellname = "misty step"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells5e/raiseundead5e
	name = "Scroll of Raise Undead"
	spell = /obj/effect/proc_holder/spell/invoked/raise_undead
	spellname = "raise undead"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells5e/rayofsickness5e
	name = "Scroll of Ray of Sickness"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/sickness
	spellname = "ray of sickness"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells5e/strengthenundead5e
	name = "Scroll of Infuse Unlife"
	spell = /obj/effect/proc_holder/spell/invoked/strengthen_undead
	spellname = "infuse unlife"
	icon_state = "scrollpurple"

// Mapping only
/obj/item/book/granter/spell/spells5e/random
	name = "random spell scroll spawner"
	desc = "This item spawns a random 5e spell scroll on roundstart. Mapping only!"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells5e/random/Initialize()
	. = ..()
	var/list/scroll_types = subtypesof(/obj/item/book/granter/spell/spells5e) - list(/obj/item/book/granter/spell/spells5e/random)
	var/chosen_type = pick(scroll_types)
	var/obj/structure/bookcase/B = locate() in get_turf(src)
	var/obj/item/spawned_scroll = new chosen_type(B ? B : get_turf(src))

	if(B)
		B.contents += spawned_scroll
	return INITIALIZE_HINT_QDEL
