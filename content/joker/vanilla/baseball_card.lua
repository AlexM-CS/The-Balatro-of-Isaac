SMODS.Joker:take_ownership("baseball",
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
            if context.other_joker and (context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon") then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)