SMODS.Joker:take_ownership("triboulet",
    {
        config = {
            extra = {
                Xmult = 2
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
                    card.ability.extra.Xmult
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and
                (context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)