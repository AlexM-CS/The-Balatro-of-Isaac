SMODS.Joker:take_ownership("half",
    {
        config = {
            extra = {
                mult = 20,
                size = 3
            }
        },

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.size
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main and #context.full_hand <= card.ability.extra.size then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    },
    true
)