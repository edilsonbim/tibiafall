local combat0 = Combat()
combat0:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat0:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat0:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POFF)

local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setArea(createCombatArea(AREA_CIRCLE2X2))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))
--adicionar no spell pra push
function onTargetCreature2(creature, target)
if (creature ~= target) and (target:isPlayer()) then 
		pushTarget(creature, target)
	end 

	return true 
end 

combat2:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature2")

local function onCastSpell0(parameters)
doCombat(parameters.cid, combat0, parameters.var)
end

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var }
addEvent(onCastSpell0, 10, parameters)
addEvent(onCastSpell1, 10, parameters)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell2, 500, parameters)
addEvent(onCastSpell2, 600, parameters)
addEvent(onCastSpell2, 700, parameters)
addEvent(onCastSpell2, 800, parameters)
addEvent(onCastSpell1, 900, parameters)
addEvent(onCastSpell2, 1000, parameters)
addEvent(onCastSpell2, 1100, parameters)
addEvent(onCastSpell2, 1200, parameters)
addEvent(onCastSpell2, 1300, parameters)
addEvent(onCastSpell2, 1400, parameters)
addEvent(onCastSpell1, 1500, parameters)

return true
end