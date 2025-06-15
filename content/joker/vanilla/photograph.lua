SMODS.Joker:take_ownership("photograph",
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
            if context.individual and context.cardarea == G.play and context.other_card:is_face() then
                local first = false
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_face() then
                        first = context.scoring_hand[i] == context.other_card
                        break
                    end
                end
                if first then
                    return {
                        xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
    },
    true
)