SMODS.Joker {
    key = "neptunus",
    config = {
        extra = {
            poker_hand = "Straight Flush"
        }
    },
    rarity = 3,
    pos = { x = 2, y = 4 },
    atlas = "tboi_jokers",
    cost = 8,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.scoring_name == card.ability.extra.poker_hand and context.repetition and context.cardarea == G.play then
            return {
                repetitions = 1
            }
        end
    end
}