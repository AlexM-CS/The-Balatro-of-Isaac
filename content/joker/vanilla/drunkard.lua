SMODS.Joker:take_ownership("drunkard",
    {
        config = {
            extra = {
                d_size = 1
            }
        },

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.d_size
                }
            }
        end,

        add_to_deck = function(self, card, from_debuff)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
            ease_discard(card.ability.extra.d_size)
        end,

        remove_from_deck = function(self, card, from_debuff)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
            ease_discard(-card.ability.extra.d_size)
        end
    },
    true
)