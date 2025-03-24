function spellCallback(cid, position, count)
	if Creature(cid) then
		if count > 0 or math.random(0, 1) == 1 then
			position:sendMagicEffect(CONST_ME_DRAWBLOOD)
			doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, position, 0, -120, -250, CONST_ME_HITAREA)
		end

		if count < 5 then
			count = count + 1
			addEvent(spellCallback, math.random(1000, 4000), cid, position, count)
		end
	end
end

function onTargetTile(creature, position)
	spellCallback(creature:getId(), position, 0)
end

local combat = Combat()
combat:setArea(createCombatArea(AREA_CROSS5X5))
combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ARROW)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end
