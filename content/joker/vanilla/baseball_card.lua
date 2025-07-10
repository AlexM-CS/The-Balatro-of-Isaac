SMODS.Joker:take_ownership("baseball",
    {
        config = {
            extra = {
                Xmult = 1.5
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
                    card.ability.extra.Xmult
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.other_joker and (context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon") then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)