SMODS.Joker:take_ownership("walkie_talkie",
    {
        config = {
            extra = {
                chips = 10,
                mult = 4
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.mult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and
                (context.other_card:get_id() == 10 or context.other_card:get_id() == 4) then
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult
                }
            end
        end
    }
    --true
)