SMODS.Joker:take_ownership("scary_face",
    {
        config = {
            extra = {
                chips = 30
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
                    card.ability.extra.chips
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card:is_face() then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    },
    true
)