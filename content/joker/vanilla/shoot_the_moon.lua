SMODS.Joker:take_ownership("shoot_the_moon",
    {
        config = {
            extra = {
                mult = 13
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
            if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 12 then
                if context.other_card.debuff then
                    return {
                        message = localize("k_debuffed"),
                        colour = G.C.RED
                    }
                else
                    return {
                        mult = card.ability.extra.mult
                    }
                end
            end
        end
    },
    true
)