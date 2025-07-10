SMODS.Joker:take_ownership("hiker",
    {
        config = {
            extra = {
                chips = 5
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
            if context.individual and context.cardarea == G.play then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
                    card.ability.extra.chips
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.CHIPS
                }
            end
        end
    },
    true
)