SMODS.Joker:take_ownership("fibonacci",
    {
        config = {
            extra = {
                mult = 8
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
            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() == 2 or
                    context.other_card:get_id() == 3 or
                    context.other_card:get_id() == 5 or
                    context.other_card:get_id() == 8 or
                    context.other_card:get_id() == 14 then
                    return {
                        mult = card.ability.extra.mult
                    }
                end
            end
        end
    },
    true
)