SMODS.Joker {
    key = "sad_onion",
    config = {
        extra = {
            chips = 75
        }
    },
    rarity = 3,
    pos = { x = 0, y = 2 },
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        local _arg2 = nil
        if G.jokers ~= nil then
            _arg2 = card.ability.extra.chips * #G.jokers.cards
        else
            _arg2 = 0
        end
        return {
            vars = {
                card.ability.extra.chips,
                _arg2
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips * #G.jokers.cards
            }
        end
    end
}