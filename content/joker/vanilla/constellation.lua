SMODS.Joker:take_ownership("constellation",
    {
        name = "tboi-Constellation",
        config = {
            extra = {
                Xmult_gain = 0.1,
                Xmult = 1
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
                    card.ability.extra.Xmult_gain,
                    card.ability.extra.Xmult
                }
            }
        end,

        calculate = function(self, card, context)
            if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "Planet" then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                return {
                    message = localize({
                        type = "variable",
                        key = "a_xmult",
                        vars = { card.ability.extra.Xmult }
                    })
                }
            end
            if context.joker_main then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)