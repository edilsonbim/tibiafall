local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
function onGetFormulaValues1(player, skill, attack, factor)
    local min = ((skill*attack)+player:getEffectiveSkillLevel(SKILL_SHIELD)*1.2)/20+10
    local max = ((skill*attack)+player:getEffectiveSkillLevel(SKILL_SHIELD)*1.5)/18+55
    return -min, -max
end
setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
function onGetFormulaValues2(player, skill, attack, factor)
    local min = ((skill*attack)+player:getEffectiveSkillLevel(SKILL_SHIELD)*1.2)/20+85
    local max = ((skill*attack)+player:getEffectiveSkillLevel(SKILL_SHIELD)*1.5)/18+195
    return -min, -max
end
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid:getId(), var = var }
addEvent(onCastSpell1, 1000, parameters)
addEvent(onCastSpell2, 1001, parameters)

return true
end