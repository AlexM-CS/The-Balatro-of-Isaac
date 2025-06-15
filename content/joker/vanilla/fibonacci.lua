SMODS.Joker:take_ownership("fibonacci",
    {
        config = {
            extra = {
                mult = 8
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
                if context.other_card:get_id() == 2 or
                    context.other_card:get_id() == 3 or
                    context.other_card:get_id() == 5 or
                    context.other_card:get_id() == 8 or
                    context.other_card:get_id() == 14 then
                    return {
                        mult = card.ability.extra.mult
                    }
                end
            end
        end
    },
    true
)