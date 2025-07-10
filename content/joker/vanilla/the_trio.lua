SMODS.Joker:take_ownership("trio",
    {
        config = {
            extra = {
                Xmult = 3,
                type = "Three of a Kind"
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
                    card.ability.extra.Xmult,
                    localize(card.ability.extra.type, "poker_hands")
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)