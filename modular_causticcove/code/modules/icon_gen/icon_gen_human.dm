///Creates a flat icon for hoomans. Should be much more optimized and less jangled than get_flat_human_icon, because it doesn't spawn a dummy and then copies over all the slop... that the people who made it can think of, which is outdated and a debt to constantly maintain. Also makes the character spin for a split moment like https://tenor.com/view/im-only-human-im-only-human-after-all-im-only-human-after-all-spinning-gif-im-only-human-spinning-gif-rory-charles-gif-27618185 but it's not visible ingame so whatever, go my shitcode!
/mob/living/carbon/human/proc/get_flat_icon(showDirs = GLOB.cardinals)
	var/icon/out_icon = icon('icons/effects/effects.dmi', "nothing")
	var/originaldir = dir
	for(var/D in showDirs)
		setDir(D)
		//COMPILE_OVERLAYS(src)
		var/icon/partial = getFlatIcon(src)
		if(partial.Width() > 32 || partial.Height() > 32)
			var/middlewidthstart = ((partial.Width() - 32) / 2) +1
			var/middleheightstart = ((partial.Height() - 32) / 2 ) +1

			partial.Crop(middlewidthstart,middleheightstart,middlewidthstart+31,middlewidthstart+31)
		out_icon.Insert(partial,dir=D)
	setDir(originaldir)
	return out_icon
