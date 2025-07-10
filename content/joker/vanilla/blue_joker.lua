SMODS.Joker:take_ownership("blue_joker",
    {
        -- Some scaling Jokers cause crashes when their original calculation code runs,
        -- this prevents them from using the vanilla calculation
        name = "tboi-Blue Joker",
        config = {
            extra = {
                chips = 2
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
                    card.ability.extra.chips,
                    card.ability.extra.chips * ((G.deck and G.deck.cards) and #G.deck.cards or 52)
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips * #G.deck.cards
                }
            end
        end
    },
    true
)