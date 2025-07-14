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
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        return BI.calculate_familiar(card, context) 
    end
}