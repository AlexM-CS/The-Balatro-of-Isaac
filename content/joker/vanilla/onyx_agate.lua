SMODS.Joker:take_ownership("onyx_agate",
    {
        config = {
            extra = {
                mult = 7
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
                    card.ability.extra.mult
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    },
    true
)