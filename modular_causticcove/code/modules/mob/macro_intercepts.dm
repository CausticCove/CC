// Grabbed this from OV's port of it, it's to intercept if these actions are used in a macro and instead it does nothing instead of doing the actual click action. Just to be safe, like Shadow said.
// https://github.com/ParadiseSS13/Paradise/pull/6631
/mob/verb/ClickSubstitute(params as command_text)
	set hidden = 1
	set name = ".click"

/mob/verb/DblClickSubstitute(params as command_text)
	set hidden = 1
	set name = ".dblclick"

/mob/verb/MouseSubstitute(params as command_text)
	set hidden = 1
	set name = ".mouse"
