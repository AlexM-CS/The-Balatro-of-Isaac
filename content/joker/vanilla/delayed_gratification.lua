SMODS.Joker:take_ownership("delayed_grat",
    {
        config = {
            extra = {
                dollars = 2
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
                    card.ability.extra.dollars
                }
            }
        end,

        calc_dollar_bonus = function(self, card)
            return G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0 and
                G.GAME.current_round.discards_left * card.ability.extra.dollars or nil
        end
    },
    true
)