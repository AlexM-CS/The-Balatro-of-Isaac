-- Functions to be used by The Balatro of Isaac

----------------------------------------------------------------------------------------------------
-- Hooked Vanilla functions:
----------------------------------------------------------------------------------------------------

-- Hooks Card:set_cost
local set_cost_ref = Card.set_cost
function Card:set_cost()
    set_cost_ref(self)
    if self.ability.set == "Planet" and self.ability.name == "Jupiter" and self.sell_cost ~= nil and G.GAME.jupiter_value ~= nil then
        self.sell_cost = self.sell_cost + G.GAME.jupiter_value
    end
end

-- Hooks evaluate_poker_hand
local evaluate_poker_hand_ref = evaluate_poker_hand
function evaluate_poker_hand(hand)
    local results = evaluate_poker_hand_ref(hand)
    if (next(SMODS.find_card("j_tboi_saturnus"))) then
        if not results["Straight"][1] then
            for _, v in ipairs(G.handlist) do
                if results[v][1] then
                    results["Straight"] = results[v]
                    break
                end
            end
        end
    end
    return results
end

----------------------------------------------------------------------------------------------------
-- The Balatro of Isaac functions:
----------------------------------------------------------------------------------------------------

-- Registers things in the mod to be shown in-game
function BI.register(items, path)
    for i = 1, #items do
        SMODS.load_file(path.."/"..items[i]..".lua")()
    end
end

-- Calculates the effects of familiars
function BI.calculate_familiar(self, card, context)
    if context.before then
        card.ability.special.target = pseudorandom_element(context.scoring_hand, pseudoseed("familiar"))
    end
    if context.repetition and context.cardarea == G.play then
        if context.other_card == card.ability.extra.target then
            return {
                repetitions = BI.FAMILIARS.repetitions
            }
        end
    end
    if context.after then card.ability.special.target = nil end
end

-- Calculates the effects of flies
function BI.calculate_flies(self, card, context)
    if context.joker_main then
        return {
            chips = card.ability.special.flies * BI.FLIES.fly_chips,
            mult = card.ability.special.flies * BI.FLIES.fly_mult
        }
    end
end