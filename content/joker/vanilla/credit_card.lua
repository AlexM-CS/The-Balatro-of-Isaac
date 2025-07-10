SMODS.Joker:take_ownership("credit_card",
    {
        -- Prevents the game from crashing when picking up Credit Card
        name = "tboi-Credit Card",
        config = {
            extra = {
                bankrupt_at = 20
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
                    card.ability.extra.bankrupt_at
                }
            }
        end,

        add_to_deck = function(self, card, from_debuff)
            G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
        end,

        remove_from_deck = function(self, card, from_debuff)
            G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
        end
    },
    true
)