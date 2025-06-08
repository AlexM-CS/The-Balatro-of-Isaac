SMODS.Joker {
    key = "inner_eye",
    loc_txt = {
        name = "The Inner Eye",
        text = {
            "Makes 3 random retriggers",
            "on scored cards",
            "{s:0.8}{C:inactive}\"Triple shot\""
        }
    },
    config = {
        repetitions = 1,
        special = {
            targets = {
                first = nil,
                second = nil,
                third = nil
            }
        }
    },
    rarity = 3,
    pos = { x = 1, y = 2 },
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            card.ability.special.targets.first = pseudorandom_element(context.scoring_hand, pseudoseed("inner_eye"))
            card.ability.special.targets.second = pseudorandom_element(context.scoring_hand, pseudoseed("inner_eye"))
            card.ability.special.targets.third = pseudorandom_element(context.scoring_hand, pseudoseed("inner_eye"))
        end
        if context.repetition and context.cardarea == G.play then
            local _count = 0
            if context.other_card == card.ability.special.targets.first then
                _count = _count + card.ability.repetitions
            end
            if context.other_card == card.ability.special.targets.second then
                _count = _count + card.ability.repetitions
            end
            if context.other_card == card.ability.special.targets.third then
                _count = _count + card.ability.repetitions
            end
            if _count > 0 then
                return {
                    repetitions = _count
                }
            end
        end
        if context.after then card.ability.special.targets.first = nil end
        if context.after then card.ability.special.targets.second = nil end
        if context.after then card.ability.special.targets.third = nil end
    end
}