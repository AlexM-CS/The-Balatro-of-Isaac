SMODS.Joker:take_ownership("bootstraps",
    {
        config = {
            extra = {
                mult = 2,
                dollars = 5
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
            return {
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.dollars,
                    card.ability.extra.mult * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
                }
            end
        end
    },
    true
)