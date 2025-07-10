SMODS.Joker:take_ownership("rocket",
    {
        config = {
            extra = {
                dollars = 1,
                increase = 2
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
                    card.ability.extra.dollars,
                    card.ability.extra.increase
                }
            }
        end,

        calculate = function(self, card, context)
            if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
                card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.increase
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.MONEY
                }
            end
        end,

        calc_dollar_bonus = function(self, card)
            return card.ability.extra.dollars
        end
    },
    true
)