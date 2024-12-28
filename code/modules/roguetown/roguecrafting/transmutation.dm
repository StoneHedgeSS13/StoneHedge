/datum/crafting_recipe/roguetown/transmutation
	req_table = FALSE
	verbage_simple = "transmute"
	skillcraft = /datum/skill/misc/alchemy
	subtype_reqs = TRUE
	structurecraft = /obj/structure/fluff/alch
	alchemists_only = FALSE


/datum/crafting_recipe/roguetown/transmutation/distill
	name = "distill water"
	verbage_simple = ""
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/water = 1)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/datum/reagent/water = 99) // 45 and 90 u allows for bottle duping. This requires 33oz containers, preventing the dupe.
	craftdiff = 1

/datum/crafting_recipe/roguetown/transmutation/w2m
	name = "water to milk"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/milk = 1)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/datum/reagent/water = 99) // 45 and 90 u allows for bottle duping. This requires 33oz containers, preventing the dupe.
	craftdiff = 3

/datum/crafting_recipe/roguetown/transmutation/w2w
	name = "water to wine" /// eat your heart out god.
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/wine = 1)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/datum/reagent/water = 99) // 45 and 90 u allows for bottle duping. This requires 33oz containers, preventing the dupe.
	craftdiff = 3

/datum/crafting_recipe/roguetown/transmutation/g2wes
	name = "grain to westleach"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/wheat = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/transmutation/w2swa
	name = "westleach to swampweed"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/transmutation/f2gra
	name = "fiber to grain"
	result = list(/obj/item/reagent_containers/food/snacks/grown/wheat = 1)
	reqs = list(/obj/item/natural/fibers = 4)
	craftdiff = 3

/datum/crafting_recipe/roguetown/transmutation/b2app
	name = "berry to apple"
	result = list(/obj/item/reagent_containers/food/snacks/grown/apple = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/transmutation/poisonberry
	name = "corrupt berry"
	result = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 1, /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/transmutation/safeberry
	name = "purify berry"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison = 1, /obj/item/reagent_containers/food/snacks/grown/herbs = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/transmutation/w2coa
	name = "small log to coal"
	result = list(/obj/item/rogueore/coal = 1)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	craftdiff = 0
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/transmutation/w2l
	name = "small logs into large log"
	result = list(/obj/item/grown/log/tree/large = 1)
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/fibers)
	craftdiff = 0

/datum/crafting_recipe/roguetown/transmutation/l2coa
	name = "log to coal"
	result = list(/obj/item/rogueore/coal,/obj/item/rogueore/coal,/obj/item/rogueore/coal,/obj/item/rogueore/coal)
	reqs = list(/obj/item/grown/log/tree/large = 1)
	craftdiff = 1
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/transmutation/s2coa
	name = "stone to coal"
	result = list(/obj/item/rogueore/coal = 1)
	reqs = list(/obj/item/natural/stone = 4)
	craftdiff = 2

/datum/crafting_recipe/roguetown/transmutation/coa2s
	name = "coal to stones"
	result = list(/obj/item/natural/stone,/obj/item/natural/stone,/obj/item/natural/stone)
	reqs = list(/obj/item/rogueore/coal = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/transmutation/c2irn
	name = "coal to iron"
	result = list(/obj/item/rogueore/iron = 1)
	reqs = list(/obj/item/rogueore/coal = 2)
	craftdiff = 3
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/i2gol
	name = "iron to gold"
	result = list(/obj/item/rogueore/gold = 1)
	reqs = list(/obj/item/rogueore/iron = 4)
	craftdiff = 4
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/i2top // Keep topaz and their trinkets cheap to prevent wealth creep. Cheap means of getting gem dust, for potions.
	name = "iron to topaz"
	result = list(/obj/item/roguegem/yellow = 1)
	reqs = list(
		/obj/item/rogueore/iron = 1,
		/obj/item/natural/stone = 1)
	craftdiff = 4
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/alglass // TO-DO: add construction recipe for church windows using this. Touching a church window with mage hand will invert it to the evil version and vice versa.
	name = "stone to alchemical glass"
	result = list(/obj/item/roguegem = 1)
	reqs = list(
		/obj/item/reagent_containers/powder/sublimate = 1,
		/obj/item/natural/stone = 1)
	craftdiff = 3
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/t2gem
	name = "topaz to emerald"
	result = list(/obj/item/roguegem/green = 1)
	reqs = list(
		/obj/item/roguegem/yellow = 2)
	craftdiff = 4
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/g2saf
	name = "emerald to sapphire"
	result = list(/obj/item/roguegem/violet = 1)
	reqs = list(
		/obj/item/roguegem/green = 1,
		/obj/item/roguegem/yellow = 1)
	craftdiff = 4
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/s2blo
	name = "sapphire to turquise"
	result = list(/obj/item/roguegem/blue = 1)
	reqs = list(
		/obj/item/roguegem/violet = 1,
		/obj/item/roguegem/yellow = 1)
	craftdiff = 4
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/b2ron
	name = "turquoise to ruby"
	result = list(/obj/item/roguegem/red = 1)
	reqs = list(
		/obj/item/roguegem/blue = 1,
		/obj/item/roguegem/yellow = 1)
	craftdiff = 5
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/r2dia
	name = "ruby to diamond"
	result = list(/obj/item/roguegem/diamond = 1)
	reqs = list(
		/obj/item/roguegem/red = 1,
		/obj/item/roguegem/yellow = 1)
	craftdiff = 5
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/d2ros
	name = "diamonds to riddle of steel" /// holy grail requires legendary. (sell price on average is 350. ruby and diamond worth 100 each. you get to legndary you deserve 150-200 profit)
	result = list(/obj/item/riddleofsteel = 1)
	reqs = list(
		/obj/item/roguegem/diamond = 1,
		/obj/item/rogueore/iron = 3, //3 iron and 1 coal, same as the ratio of materials in a greatforge.
		/obj/item/rogueore/coal = 1)
	craftdiff = 6
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/e2s
	name = "steel to silver" // Making it is still pretty involved, but at least now you aren't wasting 3 entire ingots of steel plus almost 300 mammon worth of potential profit for a single silver ingot.
	result = list(
		/obj/item/ingot/silver,
		/obj/item/ingot/silver,
		/obj/item/ingot/silver,
		/obj/item/ingot/silver)
	reqs = list(/obj/item/rogueore/gold = 2, /obj/item/ingot/steel = 4, /obj/item/roguegem/violet = 2)
	craftdiff = 6
	alchemists_only = TRUE

/datum/crafting_recipe/roguetown/transmutation/moon
	name = "Moondust"
	result = list(/obj/item/reagent_containers/powder/moondust)
	reqs = list(
		/obj/item/ash = 1,
		/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 2) // Probably better to just buy from the merchant.
	craftdiff = 1

/datum/crafting_recipe/roguetown/transmutation/t2sub
	name = "Sublimate Topaz Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/toper = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1


/datum/crafting_recipe/roguetown/transmutation/g2sub
	name = "Sublimate Emerald Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/gemerald = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/transmutation/s2sub
	name = "Sublimate Sapphire Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/saffira = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/transmutation/b2sub
	name = "Sublimate Quartz Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/blortz = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/transmutation/r2sub
	name = "Sublimate Ruby Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/rontz = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/transmutation/d2sub
	name = "Sublimate Diamond Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,)
	reqs = list(
		/obj/item/reagent_containers/powder/dorpel = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/transmutation/m2sub
	name = "Sublimate Malum's Fire"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,)
	reqs = list(
		/obj/item/reagent_containers/powder/mfire = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1
