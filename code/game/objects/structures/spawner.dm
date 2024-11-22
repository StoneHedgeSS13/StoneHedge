/obj/structure/spawner
	name = "monster nest"
	icon = 'icons/mob/animal.dmi'
	icon_state = "hole"
	max_integrity = 100

	move_resist = MOVE_FORCE_EXTREMELY_STRONG
	anchored = TRUE
	density = FALSE

	var/max_mobs = 5
	var/spawn_time = 3000 //300 seconds default
	var/mob_types = list(/mob/living/simple_animal/hostile/carp)
	var/spawn_text = "emerges from"
	var/faction = list("hostile")
	var/spawner_type = /datum/component/spawner

/obj/structure/spawner/Initialize()
	. = ..()
	AddComponent(spawner_type, mob_types, spawn_time, faction, spawn_text, max_mobs)

/obj/structure/spawner/attack_animal(mob/living/simple_animal/M)
	if(faction_check(faction, M.faction, FALSE)&&!M.client)
		return
	..()


/obj/structure/spawner/syndicate
	name = "warp beacon"
	icon = 'icons/obj/device.dmi'
	icon_state = "syndbeacon"
	spawn_text = "warps in from"
	mob_types = list(/mob/living/simple_animal/hostile/syndicate/ranged)
	faction = list(ROLE_SYNDICATE)

/obj/structure/spawner/clown
	name = "Laughing Larry"
	desc = ""
	icon_state = "clownbeacon"
	icon = 'icons/obj/device.dmi'
	max_integrity = 200
	max_mobs = 15
	spawn_time = 150
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/clown, /mob/living/simple_animal/hostile/retaliate/clown/fleshclown, /mob/living/simple_animal/hostile/retaliate/clown/clownhulk, /mob/living/simple_animal/hostile/retaliate/clown/longface, /mob/living/simple_animal/hostile/retaliate/clown/clownhulk/chlown, /mob/living/simple_animal/hostile/retaliate/clown/clownhulk/honcmunculus, /mob/living/simple_animal/hostile/retaliate/clown/mutant/blob, /mob/living/simple_animal/hostile/retaliate/clown/banana, /mob/living/simple_animal/hostile/retaliate/clown/honkling, /mob/living/simple_animal/hostile/retaliate/clown/lube)
	spawn_text = "climbs out of"
	faction = list("clown")

/obj/structure/spawner/mining
	name = "monster den"
	desc = ""
	icon_state = "hole"
	max_integrity = 200
	max_mobs = 3
	icon = 'icons/mob/nest.dmi'
	spawn_text = "crawls out of"
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/asteroid/goldgrub, /mob/living/simple_animal/hostile/retaliate/rogue/asteroid/goliath, /mob/living/simple_animal/hostile/retaliate/rogue/asteroid/hivelord, /mob/living/simple_animal/hostile/retaliate/rogue/asteroid/basilisk, /mob/living/simple_animal/hostile/retaliate/rogue/asteroid/fugu)
	faction = list("mining")

/obj/structure/spawner/mining/goldgrub
	name = "goldgrub den"
	desc = ""
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/asteroid/goldgrub)

/obj/structure/spawner/mining/goliath
	name = "goliath den"
	desc = ""
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/asteroid/goliath)

/obj/structure/spawner/mining/hivelord
	name = "hivelord den"
	desc = ""
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/asteroid/hivelord)

/obj/structure/spawner/mining/basilisk
	name = "basilisk den"
	desc = ""
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/asteroid/basilisk)

/obj/structure/spawner/mining/wumborian
	name = "wumborian fugu den"
	desc = ""
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/asteroid/fugu)

/obj/structure/spawner/skeleton
	name = "bone pit"
	desc = ""
	icon = 'icons/roguetown/mob/monster/wraith.dmi'
	icon_state = "hauntpile"
	max_integrity = 500
	spawn_time = 600
	max_mobs = 5
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/skeleton/axe = 6,
	/mob/living/simple_animal/hostile/rogue/skeleton/spear = 6,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard = 5,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/spear = 5,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/shield = 4,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/xbow = 3,
	/mob/living/simple_animal/hostile/rogue/skeleton/bow = 4,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard = 2,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard_spear = 2,
	/mob/living/simple_animal/hostile/rogue/gravelord = 1)
	spawn_text = "jumps out of"
	faction = list("undead")

/obj/structure/spawner/goblin
	name = "hole"
	desc = ""
	icon_state = "hole"
	icon = 'icons/mob/nest.dmi'
	max_integrity = 500
	spawn_time = 600
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin/cave = 3,		//archer
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 3)		//archer
	spawn_text = "climbs out of"
	faction = list("orc")

/obj/structure/spawner/ghost
	name = "bone pile"
	desc = ""
	icon = 'icons/roguetown/mob/monster/wraith.dmi'
	icon_state = "hauntpile"
	max_integrity = 500
	spawn_time = 600
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/ghost/cursed = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/cursed/cursed2 = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith2 = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith3 = 1)
	spawn_text = "appears out of"
	faction = list("undead")	

/obj/structure/spawner/ghost/cursedsouls
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/ghost/cursed = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/cursed/cursed2 = 1)
	
/obj/structure/spawner/ghost/wraiths
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/ghost/wraith = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith2 = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith3 = 1)

/obj/structure/spawner/monster
	name = "monster hole"
	desc = ""
	icon_state = "hole"
	icon = 'icons/mob/nest.dmi'
	max_integrity = 500
	spawn_time = 600
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/female = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe/female = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/poison = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 8,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 1,
	/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 6,
	/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 7,
	/mob/living/simple_animal/hostile/retaliate/rogue/mole = 6)
	spawn_text = "climbs out of"
	faction = list("caves")

/obj/structure/spawner/monster/minotaur
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/female = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe/female = 3)

/obj/structure/spawner/monster/wolf
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/poison = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 8)

/obj/structure/spawner/monster/mossback
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 6)

/obj/structure/spawner/monster/spider
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/spider = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 1)

/obj/structure/spawner/monster/troll
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll = 4)

/obj/structure/spawner/invisible
	name = ""
	desc = ""
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF 
	spawn_time = 3000
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/gravelord = 1)
	spawn_text = "jumps out in ambush!"
	faction = list("undead")

/obj/structure/spawner/invisible/skeleton
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/skeleton/axe = 6,
	/mob/living/simple_animal/hostile/rogue/skeleton/spear = 6,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard = 5,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/spear = 5,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/shield = 4,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/xbow = 3,
	/mob/living/simple_animal/hostile/rogue/skeleton/bow = 4,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard = 2,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard_spear = 2,
	/mob/living/simple_animal/hostile/rogue/gravelord = 1)
	spawn_text = "jumps out in ambush!"
	faction = list("undead")

/obj/structure/spawner/invisible/ghost
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/ghost/cursed = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/cursed/cursed2 = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith2 = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith3 = 1)
	spawn_text = "appears out of thin air!"
	faction = list("undead")	

/obj/structure/spawner/invisible/ghost/cursedsouls
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/ghost/cursed = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/cursed/cursed2 = 1)
	
/obj/structure/spawner/invisible/ghost/wraiths
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/ghost/wraith = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith2 = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith3 = 1)

/obj/structure/spawner/invisible/monster
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/female = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe/female = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/poison = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 8,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 1,
	/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 6,
	/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 7,
	/mob/living/simple_animal/hostile/retaliate/rogue/mole = 6)
	spawn_text = "lunges from the shadows!"
	faction = list("caves")

/obj/structure/spawner/invisible/monster/minotaur
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/female = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe/female = 3)

/obj/structure/spawner/invisible/monster/wolf
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/poison = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 8)
	faction = list("wolfs")

/obj/structure/spawner/invisible/monster/spider
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/spider = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 1)
	faction = list("spiders")

/obj/structure/spawner/invisible/monster/mossback
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 6)
	faction = list("crabs")

/obj/structure/spawner/invisible/monster/troll
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll = 4)

/obj/structure/spawner/invisible/goblin
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin/cave = 3,		//archer
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 3)		//archer
	spawn_text = "appears out of hiding!"
	faction = list("orcs")
