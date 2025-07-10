SMODS.Joker:take_ownership("throwback",
    {
        name = "tboi-Throwback",
        config = {
            extra = {
                Xmult = 0.25
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
                    1 + G.GAME.skips * card.ability.extra.Xmult
                }
            }
        end,

        calculate = function(self, card, context)
            if context.skip_blind and not context.blueprint then
                return {
                    message = localize({
                        type = "variable",
                        key = "a_xmult",
                        vars = { 1 + G.GAME.skips * card.ability.extra.Xmult }
                    })
                }
            end
            if context.joker_main then
                return {
                    Xmult = 1 + G.GAME.skips * card.ability.extra.Xmult
                }
            end
        end
    },
    true
)