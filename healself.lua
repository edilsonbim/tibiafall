local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues2(player, level, maglevel)
	local min = ((maglevel/6)+player:getEffectiveSkillLevel(SKILL_SHIELD)/6)+35
	local max = ((maglevel/6)+player:getEffectiveSkillLevel(SKILL_SHIELD)/6)+40
	return min, max
end
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")

local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat1, parameters.var)
end
local function onCastSpell2(parameters)
    doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 1000, parameters)
addEvent(onCastSpell2, 2000, parameters)
addEvent(onCastSpell2, 3000, parameters)


return TRUE
end  