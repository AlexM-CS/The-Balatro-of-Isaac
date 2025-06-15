SMODS.Joker:take_ownership("card_sharp",
    {
        name = "tboi-Card Sharp",
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
            if context.joker_main and G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)