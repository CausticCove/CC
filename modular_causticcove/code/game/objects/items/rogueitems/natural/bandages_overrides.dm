//Overrides and buffs cloths and bandages to soak up more blood, for much longer.
/obj/item/natural/cloth
	//"Bandage Effectiveness" is how much blood we reduce by a % value using decimal math.
	bandage_effectiveness = 0.50 //50% Bloodloss reduction.

	//500 health, 500 blood soaked.
	bandage_health = 500

	//5 Seconds as opposed to the, as of this edit, 7 seconds. This speed scales with medical skill. and STA_SPD.
	bandage_speed = 5 SECONDS

/obj/item/natural/cloth/bandage
	//Sticking to 90% so that other players can see that they're still bleeding but it shouldn't be enough bleeding for them to drop into crit
	//anytime soon. Water and potions should easily replenish lost blood. Used to be 75%.
	bandage_effectiveness = 0.90

	//Can stop bleeding for a very long time on a limb.
	bandage_health = 1250

	//1 second faster than normal cloth.
	bandage_speed = 4 SECONDS
