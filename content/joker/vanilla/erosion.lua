SMODS.Joker:take_ownership("erosion",
    {
        name = "tboi-Erosion",
        config = {
            extra = {
                mult = 4
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult,
                    math.max(0, card.ability.extra.mult * (G.playing_cards and (G.GAME.starting_deck_size - #G.playing_cards) or 0)),
                    G.GAME.starting_deck_size
                }
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    mult = math.max(0, card.ability.extra.mult * (G.GAME.starting_deck_size - #G.playing_cards))
                }
            end
        end
    }
    --true
)