/obj/item/key/guildroomi
	name = "Guild room I key"
	desc = "The key to the first room."
	icon_state = "brownkey"
	lockids = list("groom1")

/obj/item/key/guildroomii
	name = "Guild room II key"
	desc = "The key to the second room."
	icon_state = "brownkey"
	lockids = list("groom2")

/obj/item/key/guildroomiii
	name = "Guild room III key"
	desc = "The key to the third room."
	icon_state = "brownkey"
	lockids = list("groom3")

/obj/item/key/guildroomiv
	name = "Guild room IV key"
	desc = "The key to the fourth room."
	icon_state = "brownkey"
	lockids = list("groom4")

/obj/item/key/guildroomv
	name = "Guild room V key"
	desc = "The key to the fifth room."
	icon_state = "brownkey"
	lockids = list("groom5")

/obj/structure/fake_machine/vendor/guild_rmh
	lock = /datum/lock/key/vendor
	density = FALSE

/obj/structure/fake_machine/vendor/guild_rmh/Initialize()
    . = ..()

    for (var/X in list(/obj/item/key/guildroomi, /obj/item/key/guildroomi, /obj/item/key/guildroomii, /obj/item/key/guildroomiii, /obj/item/key/guildroomiv, /obj/item/key/guildroomv))
        var/obj/P = new X(src)
        held_items[P] = list()
        held_items[P]["NAME"] = P.name
        held_items[P]["PRICE"] = 0

    update_icon()
