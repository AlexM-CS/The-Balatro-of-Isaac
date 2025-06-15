SMODS.Joker:take_ownership("onyx_agate",
    {
        config = {
            extra = {
                mult = 7
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
            if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    }
    --true
)