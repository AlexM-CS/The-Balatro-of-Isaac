SMODS.Joker:take_ownership("seeing_double",
    {
        config = {
            extra = {
                Xmult = 2
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
            if context.joker_main and SMODS.seeing_double_check(context.scoring_hand, "Clubs") then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end,
    }
)