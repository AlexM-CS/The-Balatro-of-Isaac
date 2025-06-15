SMODS.Joker:take_ownership("smiley",
    {
        config = {
            extra = {
                mult = 5
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
            if context.individual and context.cardarea == G.play and context.other_card:is_face() then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    },
    true
)