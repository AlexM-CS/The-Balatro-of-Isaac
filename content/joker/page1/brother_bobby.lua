SMODS.Joker {
    key = "brother_bobby",
    config = {
        special = {
            target = nil
        }
    },
    rarity = 1,
    pos = { x = 7, y = 2 },
    atlas = "tboi_jokers",
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "familiar", set = "Other" }
        if BI.show_item_pools_check() then
            local text = BI.generate_pool_text(card)
            info_queue[#info_queue + 1] = {
                set = "Other", key = "item_pool", vars = {
                    text.is_modded,
                    text.pool,
                    colours = {
                        text.colour
                    }
                }
            }
        end
    end,

    calculate = function(self, card, context)
        return BI.calculate_familiar(card, context) 
    end
}