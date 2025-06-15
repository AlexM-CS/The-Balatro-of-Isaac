SMODS.Joker:take_ownership("even_steven",
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
            if context.individual and context.cardarea == G.play then
                if context.other_card:get_id() <= 10 and
                    context.other_card:get_id() >= 0 and
                    context.other_card:get_id() % 2 == 0 then
                    return {
                        mult = card.ability.extra.mult
                    }
                end
            end
        end
    }
    --true
)