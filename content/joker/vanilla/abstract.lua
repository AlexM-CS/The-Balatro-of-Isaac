SMODS.Joker:take_ownership("abstract",
    {
        -- Some scaling Jokers cause crashes when their original calculation code runs,
        -- this prevents them from using the vanilla calculation
        name = "tboi-Abstract Joker",
        config = {
            extra = {
                mult = 3
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.mult * (G.jokers and #G.jokers.cards or 0)
                }
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult * #G.jokers.cards
                }
            end
        end
    },
    true
)