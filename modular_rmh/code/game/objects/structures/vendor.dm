/obj/structure/fake_machine/vendor/inn_rmh
	lock = /datum/lock/key/vendor

/obj/structure/fake_machine/vendor/inn_rmh/Initialize()
    . = ..()

    // Add room keys with a price of 20
    for (var/X in list(/obj/item/key/roomi, /obj/item/key/roomii, /obj/item/key/roomiii, /obj/item/key/roomiv, /obj/item/key/roomv))
        var/obj/P = new X(src)
        held_items[P] = list()
        held_items[P]["NAME"] = P.name
        held_items[P]["PRICE"] = 20

    update_icon()
