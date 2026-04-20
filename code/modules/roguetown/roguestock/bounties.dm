//Rememeber CC folk, if we are cherry picking we are using the OLD vault system. Not the new minting one!

/datum/roguestock/bounty/treasure
	name = "Collectable Treasures"
	desc = "Treasures are sent to the vault, where they accrue value over time. Payout is a percentage is based on the price of the treasure, with taxes removed from the payout after."
	item_type = /obj/item
	payout_price = 66 // CC Edit
	transport_item = /area/rogue/indoors/town/vault
	percent_bounty = TRUE

/obj/item
	var/submitted_to_stockpile

/datum/roguestock/bounty/treasure/get_payout_price(obj/item/I)
	if(!I)
		return ..()
	var/bounty_percent = (payout_price/100) * I.get_real_price()
	bounty_percent = round(bounty_percent)
	if(bounty_percent < 1)
		return 0
	return bounty_percent

/* Non-Ideal but a way to replicate old vault mechanics:
	- Ores are not accepted.
	- Items that are important to round-critical roles, events, or mmechanics are not accepted.
	- Statues, gemstones, cupwear, cookwear, utensils and candles will always be allowed.
	- Certain standalone items that don't meet the threshold, but are still intended to be sold off as low-tier dungeon loot - like decrepit and ancient items - will always be allowed.
	- Otherwise, anything with a standing value of thirty mammons or above can be redeemed at the Stockpile.
*/
/datum/roguestock/bounty/treasure/check_item(obj/I)
	if(!I)
		return
	if(istype(I, /obj/item))
		var/obj/item/W = I
		if(W.is_important)
			return FALSE
	if(istype(I, /obj/item/rogueore))
		return FALSE
	if(istype(I, /obj/item/bodypart/head))
		return FALSE // Thats the HEADEATER's job.
	if(istype(I, /obj/item/natural/head))
		return FALSE  // Thats the HEADEATER's job.
	if(istype(I, /obj/item/storage))
		return FALSE // Anti-exploitation fix.
	if(istype(I, /obj/item/clothing/ring/signet/triumph))
		return FALSE // Prevents 'free coinage' exploitage.
	if(istype(I, /obj/item/clothing/ring/gold/triumph))
		return FALSE // Ditto, going down.
	if(istype(I, /obj/item/clothing/ring/diamond/triumph))
		return FALSE
	if(istype(I, /obj/item/clothing/neck/roguetown/ornateamulet/noble/triumph))
		return FALSE
	if(istype(I, /obj/item/clothing/neck/roguetown/psicross/g/triumph))
		return FALSE
	if(istype(I, /obj/item/clothing/neck/roguetown/psicross/inhumen/g/triumph))
		return FALSE
	if(istype(I, /obj/item/clothing/head/roguetown/circlet/triumph))
		return FALSE
	if(istype(I, /obj/item/clothing/mask/rogue/lordmask/triumph))
		return FALSE
	if(istype(I, /obj/item/clothing/mask/rogue/facemask/goldmask/triumph))
		return FALSE
	if(istype(I, /obj/item/clothing/mask/rogue/facemask/goldmaskc/triumph))
		return FALSE
	if(istype(I, /obj/item/rogueweapon/scabbard))
		return FALSE // If you have to sell your decorated scabbards for ozium-money, you'll have to barter.
	if(I.get_real_price() > 0)
		if(istype(I, /obj/item/reagent_containers/glass/cup)) //As Randall explained, these statements allow any item in the codepath to be sold, regardless of their value.
			return TRUE
		if(istype(I, /obj/item/cooking/platter)) //This, for example, means any item that's considered a 'platter' - or a derivative of such - to be sold for some dosh.
			return TRUE
		if(istype(I, /obj/item/kitchen/fork)) //Keep this in mind for later, if you ever wish to add or remove things from this list.
			return TRUE
		if(istype(I, /obj/item/kitchen/spoon))
			return TRUE
		if(istype(I, /obj/item/candle))
			return TRUE
		if(istype(I, /obj/item/roguestatue))
			return TRUE
		if(istype(I, /obj/item/roguegem))
			return TRUE
		if(istype(I, /obj/item/clothing/ring))
			return TRUE
		if(istype(I, /obj/item/reagent_containers/glass/bucket/pot/teapot))
			return TRUE
		if(istype(I, /obj/item/tablecloth/silk)) //Standalone items that meet the price minimum can still be listed here, to 'brute-force' their redeemability in case of glitches.
			return TRUE
	if(I.get_real_price() >= 30)
		return TRUE
