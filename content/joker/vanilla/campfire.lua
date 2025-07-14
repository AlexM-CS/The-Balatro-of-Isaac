SMODS.Joker:take_ownership("campfire",
    {
        config = {
            extra = {
                Xmult_gain = 0.25,
                Xmult = 1
            }
        },

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.Xmult_gain,
                    card.ability.extra.Xmult
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.selling_card and not context.blueprint then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                return {
                    message = localize('k_upgrade_ex')
                }
            end
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                if G.GAME.blind.boss and card.ability.extra.Xmult > 1 then
                    card.ability.extra.Xmult = 1
                    return {
                        message = localize("k_reset"),
                        colour = G.C.RED
                    }
                end
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)