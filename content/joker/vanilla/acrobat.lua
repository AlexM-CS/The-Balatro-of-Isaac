SMODS.Joker:take_ownership("acrobat",
    {
        config = {
            extra = {
                Xmult = 3
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
            if context.joker_main and G.GAME.current_round.hands_left == 0 then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)