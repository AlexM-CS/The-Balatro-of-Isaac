SMODS.Joker:take_ownership("to_the_moon",
    {
        config = {
            extra = {
                interest = 1
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
                    card.ability.extra.interest
                }
            }
        end,

        add_to_deck = function(self, card, from_debuff)
            G.GAME.interest_amount = G.GAME.interest_amount + card.ability.extra.interest
        end,

        remove_from_deck = function(self, card, from_debuff)
            G.GAME.interest_amount = G.GAME.interest_amount - card.ability.extra.interest
        end
    },
    true
)