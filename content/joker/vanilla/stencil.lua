SMODS.Joker:take_ownership("stencil",
    {
        config = {
            extra = {
                stencil_Xmult = 1
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.stencil_Xmult,
                    G.jokers and card.ability.extra.stencil_Xmult * math.max(1, (G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_stencil", true)) or 1
                }
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    xmult = card.ability.extra.stencil_Xmult * math.max(1, (G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_stencil", true))
                }
            end
        end
    }
    --true
)