SMODS.Joker:take_ownership("erosion",
    {
        name = "tboi-Erosion",
        config = {
            extra = {
                mult = 4
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
    },
    true
)