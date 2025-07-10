SMODS.Joker:take_ownership("troubadour",
    {
        config = {
            extra = {
                h_size = 2,
                h_plays = -1
            }
        },
        loc_vars = function(self, info_queue, card)
            if BI.show_item_pools_check() then
                local text = BI.generate_pool_text(card)
                info_queue[#info_queue + 1] = {
                    set = "Other", key = "item_pool", vars = {
                        text.is_modded,
                        text.rarity,
                        colours = {
                            text.colour
                        }
                    }
                }
            end
            return {
                vars = {
                    card.ability.extra.h_size,
                    -card.ability.extra.h_plays
                }
            }
        end,

        add_to_deck = function(self, card, from_debuff)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_plays
            G.hand:change_size(card.ability.extra.h_size)
        end,

        remove_from_deck = function(self, card, from_debuff)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_plays
            G.hand:change_size(-card.ability.extra.h_size)
        end
    },
    true
)