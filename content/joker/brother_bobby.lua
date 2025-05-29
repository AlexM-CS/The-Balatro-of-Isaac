SMODS.Joker {
    key = "brother_bobby",
    loc_txt = {
        name = "Brother Bobby",
        text = {
            "{C:attention}Familiar",
            "No extra effect",
            "{s:0.8}{C:inactive}\"Friends 'till the end\""
        }
    },
    config = {
        extra = {
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
    end,

    calculate = function(self, card, context)
        return BI.calculate_familiar(self, card, context)
    end
}