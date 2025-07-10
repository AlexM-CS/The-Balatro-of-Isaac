SMODS.Joker:take_ownership("chaos",
    {
        -- Prevents Chaos the Clown from giving an extra free reroll
        name = "tboi-Chaos the Clown",
        config = {
            extra = {
                rerolls = 1
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
                    card.ability.extra.rerolls
                }
            }
        end,

        add_to_deck = function(self, card, from_debuff)
            SMODS.change_free_rerolls(card.ability.extra.rerolls)
        end,

        remove_from_deck = function(self, card, from_debuff)
            SMODS.change_free_rerolls(-card.ability.extra.rerolls)
        end
    },
    true
)