
/obj/machinery/light/fueled/smelter/bronze
	icon = 'modular_rmh/icons/obj/structures/forge.dmi'
	name = "bronze melter"
	desc = "An  object of human make, this furnace is capable of making bronze or iron."
	icon_state = "brosmelter0"
	base_state = "brosmelter"
	anchored = TRUE
	density = TRUE
	maxore = 4
	climbable = FALSE

/obj/machinery/light/fueled/smelter/bronze/process()
	..()
	if(on)
		if(ore.len)
			if(cooking < 40)
				cooking++
				playsound(src.loc,'sound/misc/smelter_sound.ogg', 50, FALSE)
				actively_smelting = TRUE
			else
				if(cooking == 40)
					var/alloy //moving each alloy to it's own var allows for possible additions later
					var/bronzealloy
					for(var/obj/item/I in ore)
						if(I.smeltresult == /obj/item/ingot/tin)
							bronzealloy = bronzealloy + 1
						if(I.smeltresult == /obj/item/ingot/copper)
							bronzealloy = bronzealloy + 2
					if(bronzealloy == 7)
						testing("BRONZE ALLOYED")
						alloy = /obj/item/ingot/bronze
					else
						alloy = null

					if(alloy)
						// The smelting quality of all ores added together, divided by the number of ores, and then rounded to the lowest integer (this isn't done until after the for loop)
						var/floor_mean_quality = SMELTERY_LEVEL_SPOIL
						var/ore_deleted = 0
						for(var/obj/item/I in ore)
							floor_mean_quality += ore[I]
							ore_deleted += 1
							ore -= I
							qdel(I)
						floor_mean_quality = floor(floor_mean_quality/ore_deleted)
						for(var/i in 1 to maxore)
							var/obj/item/R = new alloy(src, floor_mean_quality)
							ore += R
					else
						for(var/obj/item/I in ore)
							if(I.smeltresult)
								var/obj/item/R = new I.smeltresult(src, ore[I])
								ore -= I
								ore += R
								qdel(I)

					playsound(src,'sound/misc/smelter_fin.ogg', 100, FALSE)
					visible_message(span_notice("\The [src] finished smelting."))
					maxore = initial(maxore)
					cooking = 41
					actively_smelting = FALSE

/obj/machinery/light/fueled/smelter/hiron
	icon = 'modular_rmh/icons/obj/structures/forge.dmi'
	name = "iron bloomery"
	desc = "An  object of human make, this furnace is capable of making high quanities of iron."
	icon_state = "hironsmelter0"
	base_state = "hironsmelter"
	anchored = TRUE
	density = TRUE
	maxore = 6
	climbable = FALSE



/obj/machinery/light/fueled/smelter/hiron/process()
	..()
	if(on)
		if(ore.len)
			if(cooking < 45)
				cooking++
				playsound(src.loc,'sound/misc/smelter_sound.ogg', 50, FALSE)
				actively_smelting = TRUE
			else
				if(cooking == 45)
					for(var/obj/item/I in ore)
						if(I.smeltresult)
							var/obj/item/R = new I.smeltresult(src, ore[I])
							ore -= I
							ore += R
							qdel(I)

					playsound(src,'sound/misc/smelter_fin.ogg', 100, FALSE)
					visible_message(span_notice("\The [src] finished smelting."))
					maxore = initial(maxore)
					cooking = 46
					actively_smelting = FALSE
