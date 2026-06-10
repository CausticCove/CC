/datum/mob_descriptor/stature
	abstract_type = /datum/mob_descriptor/stature
	slot = MOB_DESCRIPTOR_SLOT_STATURE

/datum/mob_descriptor/stature/man
	name = "Man/Woman"

/datum/mob_descriptor/stature/man/get_description(mob/living/described)
	switch(described.pronouns)
		if(SHE_HER)
			return "woman"
		if(HE_HIM)
			return "man"
		if(THEY_THEM)
			return "person"
		else
			return "creacher"


/datum/mob_descriptor/stature/gentleman
	name = "Gentleman/Gentlewoman"
/datum/mob_descriptor/stature/gentleman/get_description(mob/living/described)
	switch(described.pronouns)
		if(SHE_HER)
			return "gentlewoman"
		if(HE_HIM)
			return "gentleman"
		if(THEY_THEM)
			return "gentleperson"
		else
			return "gentlecreacher"
/datum/mob_descriptor/stature/patriarch
	name = "Patriarch/Matriarch"
/datum/mob_descriptor/stature/patriarch/get_description(mob/living/described)
	switch(described.pronouns)
		if(SHE_HER)
			return "matriarch"
		if(HE_HIM)
			return "patriarch"
		if(THEY_THEM)
			return "hierarch"
		else
			return "hierarch"
/datum/mob_descriptor/stature/hag
	name = "Hag/Codger"
/datum/mob_descriptor/stature/hag/get_description(mob/living/described)
	switch(described.pronouns)
		if(SHE_HER)
			return "hag"
		if(HE_HIM)
			return "codger"
		if(THEY_THEM)
			return "senior"
		else
			return "elder"
/datum/mob_descriptor/stature/villain
	name = "Villain/Villainess"
/datum/mob_descriptor/stature/villain/get_description(mob/living/described)
	switch(described.pronouns)
		if(SHE_HER)
			return "villainess"
		if(HE_HIM)
			return "villain"
		if(THEY_THEM)
			return "antagonist"
		else
			return "antagonist"
/datum/mob_descriptor/stature/bimbo
	name = "Bimbo/Bimboy"
/datum/mob_descriptor/stature/bimbo/get_description(mob/living/described)
	switch(described.pronouns)
		if(SHE_HER)
			return "bimbo"
		if(HE_HIM)
			return "bimboy"
		if(THEY_THEM)
			return "bimbo"
		else
			return "bimbo"

/datum/mob_descriptor/stature/thug
	name = "Thug"
/datum/mob_descriptor/stature/knave
	name = "Knave"
/datum/mob_descriptor/stature/wench
	name = "Wench"
/datum/mob_descriptor/stature/snob
	name = "Snob"
/datum/mob_descriptor/stature/slob
	name = "Slob"
/datum/mob_descriptor/stature/brute
	name = "Brute"
/datum/mob_descriptor/stature/highbrow
	name = "Highbrow"
/datum/mob_descriptor/stature/scholar
	name = "Scholar"
/datum/mob_descriptor/stature/rogue
	name = "Rogue"
/datum/mob_descriptor/stature/hermit
	name = "Hermit"
/datum/mob_descriptor/stature/pushover
	name = "Pushover"
/datum/mob_descriptor/stature/beguiler
	name = "Beguiler"
/datum/mob_descriptor/stature/daredevil
	name = "Daredevil"
/datum/mob_descriptor/stature/valiant
	name = "Valiant"
/datum/mob_descriptor/stature/adventurer
	name = "Adventurer"
/datum/mob_descriptor/stature/fiend
	name = "Fiend"
/datum/mob_descriptor/stature/stoic
	name = "Stoic"
/datum/mob_descriptor/stature/stooge
	name = "Stooge"
/datum/mob_descriptor/stature/fool
	name = "Fool"
/datum/mob_descriptor/stature/bookworm
	name = "Bookworm"
/datum/mob_descriptor/stature/lowlife
	name = "Lowlife"

/datum/mob_descriptor/stature/dignitary
	name = "Dignitary"

/datum/mob_descriptor/stature/degenerate
	name = "Degenerate"

/datum/mob_descriptor/stature/zealot
	name = "Zealot"

/datum/mob_descriptor/stature/churl
	name = "Churl"

/datum/mob_descriptor/stature/archon
	name = "Archon"

/datum/mob_descriptor/stature/vizier
	name = "Vizier"

/datum/mob_descriptor/stature/blaggard
	name = "Blaggard"

/datum/mob_descriptor/stature/creep
	name = "Creep"

/datum/mob_descriptor/stature/freek
	name = "Freek"

/datum/mob_descriptor/stature/weerdoe
	name = "Weerdoe"

/datum/mob_descriptor/stature/plump
	name = "Plump figure"

/datum/mob_descriptor/stature/savant
	name = "Savant"

/datum/mob_descriptor/stature/wanderer
	name = "Wanderer"

/datum/mob_descriptor/stature/hustler
	name = "Hustler"

/datum/mob_descriptor/stature/samaritan
	name = "Samaritan"

/datum/mob_descriptor/stature/pupil
	name = "Pupil"

/datum/mob_descriptor/stature/soldier
	name = "Soldier"

/datum/mob_descriptor/stature/recluse
	name = "Recluse"

/datum/mob_descriptor/stature/socialite
	name = "Socialite"

/datum/mob_descriptor/stature/shitheel
	name = "Shitheel"

/datum/mob_descriptor/stature/critter
	name = "Critter"

// this one technically already exists but it was a very specific selection choice & i've got a request to add it
/datum/mob_descriptor/stature/creacher
	name = "Creacher"

/datum/mob_descriptor/stature/cur
	name = "Cur"

/datum/mob_descriptor/stature/wretch
	name = "Wretch"

/datum/mob_descriptor/stature/dullard
	name = "Dullard"

// basterd. specifically basterd. it is funnier this way.
/datum/mob_descriptor/stature/basterd
	name = "Basterd"

/datum/mob_descriptor/stature/hotspur
	name = "Hotspur"

/datum/mob_descriptor/stature/pest
	name = "Pest"

/datum/mob_descriptor/stature/shrew
	name = "Shrew"

/datum/mob_descriptor/stature/tyrant
	name = "Tyrant"

/datum/mob_descriptor/stature/virago
	name = "Virago"

/datum/mob_descriptor/stature/yob
	name = "Yob"

/datum/mob_descriptor/stature/adversary
	name = "Adversary"

/datum/mob_descriptor/stature/foe
	name = "Foe"

/datum/mob_descriptor/stature/gatecrasher
	name = "Gatecrasher"

/datum/mob_descriptor/stature/idol
	name = "Idol"

/datum/mob_descriptor/stature/nemesis
	name = "Nemesis"

/datum/mob_descriptor/stature/eejit
	name = "Eejit"

/datum/mob_descriptor/stature/crone
	name = "Crone"

/datum/mob_descriptor/stature/nerdowell
	name = "Nerdowell"

/datum/mob_descriptor/stature/peon
	name = "Peon"

/datum/mob_descriptor/stature/scion
	name = "Scion"

/datum/mob_descriptor/stature/swashbuckler
	name = "Swashbuckler"

/datum/mob_descriptor/stature/fatass
	name = "Fat-Ass"

/datum/mob_descriptor/stature/grapplebait
	name = "Grapplebait"

/datum/mob_descriptor/stature/buttplug
	name = "Buttplug" //might be too silly but im risking it

/datum/mob_descriptor/stature/plug
	name = "Plug"

/datum/mob_descriptor/stature/snakeinthegrass
	name = "Snake-In-The-Grass"

/datum/mob_descriptor/stature/blob
	name = "Blob"

/datum/mob_descriptor/stature/thing
	name = "Thing"

/datum/mob_descriptor/stature/dummy
	name = "Dummy"

/datum/mob_descriptor/stature/coatrack
	name = "Coatrack"

/datum/mob_descriptor/stature/plushie
	name = "Plushie"

/datum/mob_descriptor/stature/doll
	name = "Doll"

/datum/mob_descriptor/stature/rat
	name = "Rat"

/datum/mob_descriptor/stature/doorbuster
	name = "Door-buster"

/datum/mob_descriptor/stature/fruit
	name = "Fruit"

/datum/mob_descriptor/stature/calamity
	name = "Calamity"

/datum/mob_descriptor/stature/dolt
	name = "Dolt"

/datum/mob_descriptor/stature/sumac
	name = "Sumac"

/datum/mob_descriptor/stature/himbo
	name = "Himbo"

/datum/mob_descriptor/stature/chud
	name = "Chud"

/datum/mob_descriptor/stature/subject
	name = "Subject"

/datum/mob_descriptor/stature/oni
	name = "Oni"

/datum/mob_descriptor/stature/snack
	name = "Snack"

/datum/mob_descriptor/stature/ambrose
	name = "Ambrose"

/datum/mob_descriptor/stature/dweller
	name = "Dweller"

/datum/mob_descriptor/stature/outlaw
	name = "Outlaw"

/datum/mob_descriptor/stature/fleshlight //might be pushing it
	name = "Fleshlight"

/datum/mob_descriptor/stature/mess
	name = "Mess"

/datum/mob_descriptor/stature/yowler
	name = "Yowler"

/datum/mob_descriptor/stature/whiner
	name = "Whiner"

/datum/mob_descriptor/stature/rag
	name = "Rag"

/datum/mob_descriptor/stature/mop
	name = "Mop"

/datum/mob_descriptor/stature/cuddlebug
	name = "Cuddlebug"

/datum/mob_descriptor/stature/victim
	name = "Victim"

/datum/mob_descriptor/stature/jackal
	name = "Jackal"
