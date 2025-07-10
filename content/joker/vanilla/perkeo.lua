SMODS.Joker:take_ownership("perkeo",
    {
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = {
                key = "e_negative_consumable",
                set = "Edition",
                config = { extra = 1 }
            }
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
        end,
    },
    true
)