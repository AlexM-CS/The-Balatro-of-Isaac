SMODS.Joker:take_ownership("greedy_joker",
    {
        config = {
            extra = {
                s_mult = 3, 
                suit = "Diamonds"
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