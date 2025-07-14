SMODS.Joker:take_ownership("scholar",
    {
        config = {
            extra = {
                mult = 4,
                chips = 20
            }
        },

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.chips
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
                return {
                    mult = card.ability.extra.mult,
                    chips = card.ability.extra.chips
                }
            end
        end
    },
    true
)