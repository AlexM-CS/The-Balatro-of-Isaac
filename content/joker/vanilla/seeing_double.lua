SMODS.Joker:take_ownership("seeing_double",
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
            if context.joker_main and SMODS.seeing_double_check(context.scoring_hand, "Clubs") then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end,
    },
    true
)