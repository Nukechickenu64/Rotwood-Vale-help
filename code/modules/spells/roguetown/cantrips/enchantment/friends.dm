/obj/effect/proc_holder/spell/self/friends
	name = "Friends"
	is_cantrip = TRUE
	spell_cast_level = 5
	uses = 4

/obj/effect/proc_holder/spell/self/friends/cast(list/targets, mob/user)
	. = ..()
	if(process_mana_uses(user))
		to_chat(user, "")
