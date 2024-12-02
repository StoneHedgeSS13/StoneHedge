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
	faction = list("orcs")

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

//Destructible mob spawners. Have a faster respawn rate, useful for events.

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

//Indestructible invisible mob spawners. Use these for areas with respawning chests.

/obj/structure/spawner/invisible
	name = ""
	desc = ""
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF 
	spawn_time = 4200 //7 minutes
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
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard_spear = 2)
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
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe = 1,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/female = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe/female = 1)

/obj/structure/spawner/invisible/monster/wolf
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/poison = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 8)
	faction = list("wolfs")

/obj/structure/spawner/invisible/monster/werewolf
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/horny = 8)
	faction = list("wolfs")

/obj/structure/spawner/invisible/monster/werewolf/safe
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/safe/horny = 8)

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
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin/cave = 3,		//archer
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 3)		//archer
	spawn_text = "appears out of hiding!"
	faction = list("orcs")

//Invisible spawners capable of handling carbon mobs. Use in dungeons and areas with respawning chests.

/obj/effect/mob_spawner/goblin
	max_spawned_mobs = 14
	mobs_to_spawn = 7
	spawn_interval = 3000 //5 minutes
	spawn_range = 9
	player_range = 13
	ambush_mobs = list(
		/mob/living/carbon/human/species/goblin/npc = 6,
		/mob/living/carbon/human/species/goblin/npc/hell = 1,
		/mob/living/carbon/human/species/goblin/npc/cave = 4,
		/mob/living/carbon/human/species/goblin/npc/sea= 1,
		/mob/living/carbon/human/species/goblin/npc/moon = 1)

/obj/effect/mob_spawner/skeleton
	max_spawned_mobs = 10
	mobs_to_spawn = 5
	spawn_interval = 3600
	spawn_range = 10
	player_range = 15
	ambush_mobs = list(
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/shield = 40,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/xbow = 30,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard = 20,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard_spear = 20,
		/mob/living/carbon/human/species/skeleton/npc/dungeon = 30,
		/mob/living/carbon/human/species/skeleton/npc/dungeon/boss = 5)

/obj/effect/mob_spawner/minotaur
	max_spawned_mobs = 8
	mobs_to_spawn = 4
	spawn_interval = 3600
	spawn_range = 10
	player_range = 15
	ambush_mobs = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 20,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/female = 20,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe/female = 5)

/obj/effect/mob_spawner/mossback
	max_spawned_mobs = 8
	mobs_to_spawn = 4
	spawn_interval = 3000
	spawn_range = 10
	player_range = 15
	accepted_turf = /turf/open/water/cleanshallow
	ambush_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/mossback)

/obj/effect/mob_spawner/wilderness
	max_spawned_mobs = 6
	mobs_to_spawn = 3
	spawn_interval = 3000
	spawn_range = 15
	player_range = 20
	accepted_turf = /turf/open/floor/rogue/dirt
	ambush_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/saiga = 10,
	/mob/living/simple_animal/hostile/retaliate/rogue/saigabuck = 15,
	/mob/living/simple_animal/hostile/retaliate/rogue/goat = 10,
	/mob/living/simple_animal/hostile/retaliate/rogue/goatmale = 15)

/obj/effect/mob_spawner/wilderness/hostile
	max_spawned_mobs = 8
	mobs_to_spawn = 4
	spawn_interval = 6000
	ambush_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 10,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 15)

/obj/effect/mob_spawner/skeleton/lich
	max_spawned_mobs = 10
	mobs_to_spawn = 10
	spawn_interval = 3000
	spawn_range = 7
	player_range = 20
	ambush_mobs = list(
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/shield/lich = 20,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/xbow/lich = 20,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard/lich = 20,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard_spear/lich = 20,
		/mob/living/carbon/human/species/skeleton/npc/dungeon/lich = 10)

/obj/effect/mob_spawner/temporary/lich/boss
	max_spawned_mobs = 1
	mobs_to_spawn = 1
	spawn_interval = 3000
	spawn_range = 0
	player_range = 1
	temporary = TRUE
	ambush_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/boss/lich)
