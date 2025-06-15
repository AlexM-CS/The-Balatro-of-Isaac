SMODS.Joker:take_ownership("lucky_cat",
    {
        config = {
            extra = {
                Xmult_gain = 0.25,
                Xmult = 1
            }
        },
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
            return {
                vars = {
                    card.ability.extra.Xmult_gain,
                    card.ability.extra.Xmult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not context.blueprint then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.MULT,
                    message_card = card
                }
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    }
    --true
)