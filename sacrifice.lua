local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_LIFEDRAIN)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues1(player, level, maglevel)
	if player:getHealth() < 71 then
		local dmin = player:getHealth() -1
		return dmin, dmin
	else
		doTargetCombatHealth(0, player, COMBAT_LIFEDRAIN, -70, -70)
	return
	end
end

combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")



local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues2(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_SHIELD)/2)+maglevel/3)+60
    local max = ((player:getEffectiveSkillLevel(SKILL_SHIELD)/2)+maglevel/3)+75
    return min, max
end
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local combat3 = createCombatObject()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat3:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues3(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_SHIELD)/2)+maglevel/3)+60
    local max = ((player:getEffectiveSkillLevel(SKILL_SHIELD)/2)+maglevel/3)+75
    return min, max
end
setCombatCallback(combat3, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")

local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

function onCastSpell(cid, var, player)
local parameters = { cid = cid:getId(), var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 100, parameters)
addEvent(onCastSpell3, 101, parameters)

return true
end  