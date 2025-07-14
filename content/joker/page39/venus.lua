SMODS.Joker {
    key = "venus",
    config = {
        extra = {
            odds = 9,
            h_plays = 1,
            poker_hand = "Three of a Kind"
        }
    },
    rarity = 2,
    pos = { x = 4, y = 4 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.h_plays
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and
           context.main_eval and
           context.scoring_name == card.ability.extra.poker_hand and
           SMODS.pseudorandom_probability(card, "venus", 1, card.ability.extra.odds) then
            return {
                func = function()
                    ease_hands_played(card.ability.extra.h_plays)
                    return true
                end,
                message = localize({
                    type = "variable",
                    key = "a_hands",
                    vars = { card.ability.extra.h_plays }
                })
            }
        end
    end
}