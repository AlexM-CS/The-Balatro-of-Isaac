SMODS.Joker {
    key = "sad_onion",
    loc_txt = {
        name = "The Sad Onion",
        text = {
            "{C:blue}+#1#{} Chips for",
            "every {C:attention}Joker{} card",
            "{C:inactive}(Currently {}{C:blue}+#2#{}{C:inactive} Chips)",
            "{s:0.8}{C:inactive}\"Tears up\""
        }
    },
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