SMODS.Joker:take_ownership("mad",
    {
        config = {
            extra = {
                t_mult = 10,
                type = "Two Pair"
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
                    card.ability.extra.t_mult,
                    localize(card.ability.extra.type, "poker_hands")
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
                return {
                    mult = card.ability.extra.t_mult
                }
            end
        end
    },
    true
)