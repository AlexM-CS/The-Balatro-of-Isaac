SMODS.Joker:take_ownership("fortune_teller",
    {
        config = {
            extra = {
                mult = 1
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
                    card.ability.extra.mult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)
                }
            }
        end,

        calculate = function(self, card, context)
            if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "Tarot" then
                return {
                    message = localize({
                        type = "variable",
                        key = "a_mult",
                        vars = { card.ability.extra.mult * G.GAME.consumeable_usage_total.tarot }
                    }),
                }
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)
                }
            end
        end
    },
    true
)