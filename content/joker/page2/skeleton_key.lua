SMODS.Joker {
    key = "skeleton_key",
    config = {
        extra = {
            keys = 99
        }
    },
    rarity = 3,
    pos = { x = 16, y = 2 },
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "key", set = "Other" }
        return {
            vars = {
                card.ability.extra.keys
            }
        }
    end
}