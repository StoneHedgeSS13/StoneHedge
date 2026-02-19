#define CANDLE_LUMINOSITY	3
/obj/item/candle/tin
	name = "tin candle"
	icon = 'modular_rmh/icons/obj/lighting/lighting.dmi'
	icon_state = "tcandle"
	infinite = TRUE
	sellprice = 10

/obj/item/candle/tin/update_icon_state()
	. = ..()
	icon_state = "tcandle[lit ? "_lit" : ""]"

/obj/item/candle/tin/lit
	icon_state = "tcandle_lit"
	start_lit = TRUE

#undef CANDLE_LUMINOSITY
