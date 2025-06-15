SMODS.Joker:take_ownership("lusty_joker",
    {
        config = {
            extra = {
                s_mult = 3, 
                suit = "Hearts"
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.s_mult,
                    localize(card.ability.extra.suit, "suits_singular")
                }
            }
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and
                context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    mult = card.ability.extra.s_mult
                }
            end
        end
    },
    true
)