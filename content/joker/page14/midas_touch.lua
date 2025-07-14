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
    pos = { x = 11, y = 3 },
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        if BI.show_item_pools(card.config.center.set) then
            local text = BI.generate_pool_text(card)
            info_queue[#info_queue + 1] = {
                set = "Other", key = "item_pool", vars = {
                    text.is_modded,
                    text.pool,
                    colours = {
                        text.colour
                    }
                }
            }
        end
        local numerator, enhance_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.enhance_odds)
        local _, seal_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.seal_odds)
        return {
            vars = {
                numerator,
                enhance_denominator,
                seal_denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.pseudorandom_probability(card, "midas_touch", 1, card.ability.extra.enhance_odds) then
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
        if context.individual and context.cardarea == G.play and SMODS.pseudorandom_probability(card, "midas_touch", 1, card.ability.extra.seal_odds) then
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