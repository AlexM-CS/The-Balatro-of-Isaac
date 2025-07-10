SMODS.Joker:take_ownership("business",
    {
        -- Stops crashes from probability-based cards
        name = "tboi-Business Card",
        config = {
            extra = {
                odds = 2,
                dollars = 2
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
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            return {
                vars = {
                    numerator,
                    denominator,
                    card.ability.extra.dollars
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and
                context.other_card:is_face() and
                SMODS.pseudorandom_probability(card, "business", 1, card.ability.extra.odds) then
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
    },
    true
)