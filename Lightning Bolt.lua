local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setArea(createCombatArea(AREA_BEAM7, AREADIAGONAL_BEAM7))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, level, maglevel)
    local min = maglevel*3+140
    local max = maglevel*3+195
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
