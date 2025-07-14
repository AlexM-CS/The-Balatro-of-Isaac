SMODS.Joker {
    key = "saturnus",
    config = {
        extra = {
            poker_hand = "Straight"
        }
    },
    rarity = 2,
    pos = { x = 8, y = 4 },
    atlas = "tboi_jokers",
    cost = 6,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.evaluate_poker_hand then
            local poker_hands = context.poker_hands
            return {
                replace_scoring_name = card.ability.extra.poker_hand,
                replace_display_name = card.ability.extra.poker_hand,
                replace_poker_hands = poker_hands
            }
        end
    end
}