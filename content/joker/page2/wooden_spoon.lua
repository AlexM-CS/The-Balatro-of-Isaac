SMODS.Joker {
    key = "wooden_spoon",
    config = {
        extra = {
            Xchips = 1.25
        }
    },
    rarity = 1,
    pos = { x = 5, y = 3 },
    atlas = "tboi_jokers",
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xchips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_chips = card.ability.extra.Xchips
            }
        end
    end
}