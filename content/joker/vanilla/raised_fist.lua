SMODS.Joker:take_ownership("raised_fist",
    {
        config = {
            special = {
                raised_fist_Xmult = 2
            }
        },

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.special.raised_fist_Xmult
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
                local temp_Mult, temp_ID = 15, 15
                local raised_card = nil
                for i = 1, #G.hand.cards do
                    if temp_ID >= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) then
                        temp_Mult = G.hand.cards[i].base.nominal
                        temp_ID = G.hand.cards[i].base.id
                        raised_card = G.hand.cards[i]
                    end
                end
                if raised_card == context.other_card then
                    if context.other_card.debuff then
                        return {
                            message = localize("k_debuffed"),
                            colour = G.C.RED
                        }
                    else
                        return {
                            mult = card.ability.special.raised_fist_Xmult * temp_Mult
                        }
                    end
                end
            end
        end
    },
    true
)