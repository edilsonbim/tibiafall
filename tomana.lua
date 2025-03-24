local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_LIFEDRAIN)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
function onGetFormulaValues1(player, level, maglevel)
	if player:getHealth() < 61 then
		local dmin = player:getHealth() -1
		return dmin, dmin
	else
		doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -60, -60)
	return
	end
end
function onGetFormulaValues2(player, level, maglevel)
	local min = ((maglevel/6)+player:getEffectiveSkillLevel(SKILL_SHIELD)/6)+30
	local max = ((maglevel/6)+player:getEffectiveSkillLevel(SKILL_SHIELD)/6)+35
	return min, max
end
combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")

local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat1, parameters.var)
end
local function onCastSpell2(parameters)
    doCombat(parameters.cid, combat2, parameters.var)
end
function onCastSpell(cid, var, player)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 2000, parameters)
addEvent(onCastSpell2, 4000, parameters)
addEvent(onCastSpell2, 6000, parameters)
return true
end  