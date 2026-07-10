/datum/book_entry/magic1
	name = "Chapter I: Gathering Materials"
	category = "Instructions"

/datum/book_entry/magic1/inner_book_html(mob/user)
	return {"
	<div>
	<h2>Gathering Materials:</h2>
	To summon creatures and enchant items, you must gather the appropriate materials. This includes:
	<ul>
		<li> Manacrystals - Obtained from using prestidigitation on manafountains & spawn randomly around map</li>
		<li> Manabloom flowers - Randomly spawn in the swamp, can be grown,</li>
		<li> Obsidian shards - Obtained from using prestidigitation on lava turfs,</li>
		<li> Runed Artifacts - Can be randomly found in the swamp.</li>
		<li> Leyline Shards - inactive leylines spawn around the map. interact with them to activate them, and again to recieve a shard (Potentially getting attacked by a leyline lycan)</li>
	</ul>
	<p>
		Rumors has it that there is a mana fountain in the western part of the swamp, and a leyline in the eastern part of the swamp.
	</p>
	<p>
		Then you can use them to create various arcana items and summons, which can be used in turn to make Arcanic meld that unlock accesses to more powerful summons and enchantments.
	</p>
	</div>
	"}

/datum/book_entry/magic2
	name = "Chapter II: Binding Creatures"
	category = "Instructions"

/datum/book_entry/magic2/inner_book_html(mob/user)
	return {"
	<div>
	<h2>Materials and Enchanting:</h2>
	<p>
		Slain creatures drop realm-aligned materials. Each realm has four circles of materials:
	</p>
	<ul>
		<li><b>Infernal:</b>Infernal Ash, Hellhound Fang, Infernal Core, Abyssal Flame</li>	
		<li><b>Fae:</b> Fairy Dust, Iridescent Scale, Heartwood Core, Sylvan Essence</li>
		<li><b>Elemental:</b> Elemental Mote, Elemental Shard, Elemental Fragment, Elemental Relic</li>
	</ul>
	<p>
		<b>Enchanting</b> uses realm materials (plus cinnabar and a scroll) on an Imbuement Array to create
		enchantment scrolls. Third and fourth circle enchantments also require a leyline shard.
		The Imbuement Array can perform up to third circle enchantments.
		The Greater Imbuement Array is required for fourth circle enchantments, but can also perform all lower circles.
		Each item may only hold a single enchantment.
	</p>
	<p>
		<b>Arcanic Melds</b> are crafted by combining one material from each of the three realms at the same tier.
		This means you need to fight creatures at leylines of different alignments - or trade with other mages.
	</p>
	<h2>Binding Familiars:</h2>
	<p>
		To bind a familiar to your service, draw a <b>Binding Array</b>
		and supply realm materials. The bound creature can then be
		released from a summoning circle to serve you.
	</p>
	<h3>Other Materials</h3>
	<ul>
		<li><b>Runed Artifacts</b> - Found in the wilds, especially the bog. Required for binding rituals.</li>
		<li><b>Leyline Shards</b> - Dropped by leyline lycans (summon them with the Leyline Luring ritual). Required for third circle and above enchantments.</li>
		<li><b>Cinnabar</b> - Required for all enchantments. Available from merchants or found in mines.</li>
	</ul>
	</div>
	"}
