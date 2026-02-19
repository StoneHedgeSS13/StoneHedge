/* Tools for using with Pottery */

/* Items made from Pottery */

// Uncooked items -- Still need to be brought to a kiln
// Those are all children of natural/clay so that they can inherit the Glaze method.

//Bottle - subtype of glass bottle
/obj/item/reagent_containers/glass/bottle/claybottle
	name = "clay vessel"
	desc = "A ceramic bottle." //The sprite was anything but small
	icon = 'modular_rmh/icons/obj/items/cooking.dmi'
	icon_state = "claybottlecook"
	volume = 65 // Larger than glass bottle
	sellprice = 6
	reagent_flags = OPENCONTAINER	//So it doesn't appear through


/obj/item/reagent_containers/glass/bottle/clayvase
	name = "ceramic vase"
	desc = "A large sized ceramic vase."
	icon = 'modular_rmh/icons/obj/items/cooking.dmi'
	icon_state = "clayvasecook"
	volume = 65 // Larger than glass bottle
	sellprice = 9
	reagent_flags = OPENCONTAINER	//So it doesn't appear through


/obj/item/reagent_containers/glass/bottle/clayfancyvase
	name = "fancy ceramic vase"
	desc = "A large sized fancy ceramic vase."
	icon = 'modular_rmh/icons/obj/items/cooking.dmi'
	icon_state = "clayfancyvasecook"
	volume = 65 // Larger than glass bottle
	sellprice = 14
	reagent_flags = OPENCONTAINER	//So it doesn't appear through


/obj/item/reagent_containers/glass/cup/claycup
	name = "clay flask"
	desc = "A small ceramic flask."
	icon = 'modular_rmh/icons/obj/items/cooking.dmi'
	icon_state = "claycupcook"
	sellprice = 3
	reagent_flags = OPENCONTAINER	//So it doesn't appear through


//Bricks - Makes bricks which are used for building. (Need brick-wall sprites for this.. augh..)
/obj/item/natural/clay/claybrick
	name = "uncooked clay brick"
	desc = "an uncooked clay brick. Still needs to be cooked in a kilm."
	icon = 'modular_rmh/icons/obj/items/cooking.dmi'
	icon_state = "claybrickraw"
	//cooked_type = /obj/item/natural/brick

//Statues - Basically cheapest version of the metal-made statues, but way easier to make given no rare material usage. Just skill. Plus, dyeable.
/obj/item/natural/clay/claystatue
	name = "uncooked clay statue"
	desc = "an uncooked clay statue. Still needs to be cooked in a kilm."
	icon = 'modular_rmh/icons/obj/items/cooking.dmi'
	icon_state = "claystatueraw"
	//cooked_type = /obj/item/roguestatue/clay

/obj/item/roguestatue/clay
	name = "ceramic statue"
	desc = "A ceramic statue, shining in its eligance!"
	icon = 'modular_rmh/icons/obj/items/cooking.dmi'
	icon_state = "claystatuecooked1"
	smeltresult = null	//No resource return
	sellprice = 15		//Iron is worth 20, so these gotta be a little cheaper

/obj/item/roguestatue/clay/Initialize()
	. = ..()
	icon_state = "claystatuecooked[pick(1,2)]"

/obj/item/roguestatue/glass
	name = "glass statue"
	desc = "A statue made of fine glass. An incredible amount of skill must have went into this fragile masterpiece!"
	icon = 'modular_rmh/icons/obj/items/cooking.dmi'
	icon_state = "statueglass1"
	smeltresult = null	//No resource return
	sellprice = 70		//Silver is roughly 90 mammon, steel is 40. This sits roughly between. It's high skill to make and a bit of a grind so - worth it since resources to make aren't rare..

/obj/item/roguestatue/glass/Initialize()
	. = ..()
	icon_state = "statueglass[pick(1,2)]"
