local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)

function onGetFormulaValues(player, skill, attack, factor)
    local min = ((skill*attack)+player:getEffectiveSkillLevel(SKILL_SHIELD))/24+10
    local max = ((skill*attack)+player:getEffectiveSkillLevel(SKILL_SHIELD))/20+55
    return -min, -max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onTargetCreature(creature, target)
	local player = target:getPlayer()
	if not player then
		return
	end
    target:setNoMove(true, 2)
end
combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
local function onCastSpell1(parameters)
doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var }
addEvent(onCastSpell1, 100, parameters)
return true
end
