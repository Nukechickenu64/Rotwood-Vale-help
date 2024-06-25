/obj/effect/proc_holder/spell
	var/is_cantrip = FALSE
	var/spell_cast_level = 1
	var/uses = -1 //if -1, infinite

/obj/effect/proc_holder/spell


/obj/effect/proc_holder/spell/proc/process_mana_uses(var/user)
	if(is_cantrip == TRUE)
		if(uses > 0 || uses == -1)
			if(ishuman(user))
				var/stam_cost
				var/mob/living/carbon/human/caster = user

				var/level_negated = 20 - spell_cast_level

				var/stamdivisor = level_negated + caster.STAWIS
				if(stamdivisor < 1)
					stamdivisor = 1

				stam_cost = (caster.maxrogstam / stamdivisor) * 2
				if(stam_cost > caster.rogstam)
					to_chat(caster, "you don't have enough mana for that")
					return FALSE

				caster.rogstam_add(-stam_cost)
				caster.update_rogstam()
				if(uses != -1)
					uses -= 1
					action.button.maptext = num2text(uses)
					if(uses == 0)
						del(action.button)
						del(src)
				return TRUE
		else
			del(action.button)
			del(src)
			return FALSE
