SMODS.Joker:take_ownership("baron",
    {
        config = {
            extra = {
                Xmult = 1.5
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.Xmult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 13 then
                if context.other_card.debuff then
                    return {
                        message = localize("k_debuffed"),
                        colour = G.C.RED
                    }
                else
                    return {
                        x_mult = card.ability.extra.Xmult
                    }
                end
            end
        end
    }
    --true
)