SMODS.Joker:take_ownership("joker",
    {
        config = {
            extra = {
                mult = 4
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    }
    --true
)