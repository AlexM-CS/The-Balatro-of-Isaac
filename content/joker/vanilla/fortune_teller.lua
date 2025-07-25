SMODS.Joker:take_ownership("fortune_teller",
    {
        config = {
            extra = {
                mult = 1
            }
        },

        loc_vars = function(self, info_queue, card)
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