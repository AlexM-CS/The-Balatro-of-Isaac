SMODS.Joker {
    key = "boom",
    config = {
        extra = {
            bombs = 10
        }
    },
    rarity = 1,
    pos = { x = 18, y = 2 },
    atlas = "tboi_jokers",
    cost = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "bomb", set = "Other" }
        return {
            vars = {
                card.ability.extra.bombs
            }
        }
    end
}