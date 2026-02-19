#define CTYPE_GILD_COIN "t"

/obj/item/coin/gild

	name = "Guild Token"
	desc = "Tokens used by the adventurer's guild to exchange for food, equipment, and other meaningless items."
	icon = 'modular_rmh/icons/obj/items/tokens.dmi'
	icon_state = "t1"
	drop_sound = 'sound/foley/coinphy (1).ogg'
	base_type = "t"
	plural_name = "guild tokens"
	sellprice = 100

/obj/item/coin/gild/pile
	name = "pile of guild tokens"

/obj/item/coin/gild/pile/Initialize(mapload, coin_amount)
	. = ..()
	if(!coin_amount)
		set_quantity(rand(4,14))

#undef CTYPE_GILD_COIN
