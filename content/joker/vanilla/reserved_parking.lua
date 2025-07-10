SMODS.Joker:take_ownership("reserved_parking",
    {
        -- Stops crashes from probability-based cards
        name = "tboi-Reserved Parking",
        config = {
            extra = {
                odds = 2,
                dollars = 1
            }
        },

        loc_vars = function(self, info_queue, card)
            if BI.show_item_pools_check() then
                local text = BI.generate_pool_text(card)
                info_queue[#info_queue + 1] = {
                    set = "Other", key = "item_pool", vars = {
                        text.is_modded,
                        text.rarity,
                        colours = {
                            text.colour
                        }
                    }
                }
            end
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "reserved_parking")
            return {
                vars = {
                    card.ability.extra.dollars,
                    numerator,
                    denominator
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
                if context.other_card:is_face() and
                    SMODS.pseudorandom_probability(card, "reserved_parking", 1, card.ability.extra.odds) then
                    if context.other_card.debuff then
                        return {
                            message = localize("k_debuffed"),
                            colour = G.C.RED
                        }
                    else
                        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                        return {
                            dollars = card.ability.extra.dollars,
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.GAME.dollar_buffer = 0
                                        return true
                                    end
                                }))
                            end
                        }
                    end
                end
            end
        end
    },
    true
)