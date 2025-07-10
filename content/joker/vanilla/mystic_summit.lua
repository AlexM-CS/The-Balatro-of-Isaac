SMODS.Joker:take_ownership("mystic_summit",
    {
        config = {
            extra = {
                mult = 15,
                d_remaining = 0
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
                    card.ability.extra.d_remaining
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main and G.GAME.current_round.discards_left == card.ability.extra.d_remaining then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    },
    true
)