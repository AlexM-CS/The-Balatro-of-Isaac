SMODS.Joker {
    key = "midas_touch",
    config = {
        extra = {
            enhance_odds = 5,
            seal_odds = 20,
            mod_conv = "m_gold",
            seal = "Gold"
        }
    },
    rarity = 2,
    pos = { x = 10, y = 3 },
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.enhance_odds,
                card.ability.extra.seal_odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and pseudorandom("tboi_midas_touch") < G.GAME.probabilities.normal / card.ability.extra.enhance_odds then
            local _joker = card
            local _card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    _joker:juice_up(0.3, 0.5)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.2,
                func = function()
                    _card:set_ability(G.P_CENTERS[_joker.ability.extra.mod_conv])
                    return true
                end
            }))
        end
        if context.individual and context.cardarea == G.play and pseudorandom("tboi_midas_touch") < G.GAME.probabilities.normal / card.ability.extra.seal_odds then
            local _joker = card
            local _card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    _joker:juice_up(0.3, 0.5)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.2,
                func = function()
                    _card:set_seal(_joker.ability.extra.seal, nil, true)
                    return true
                end
            }))
        end
    end
}