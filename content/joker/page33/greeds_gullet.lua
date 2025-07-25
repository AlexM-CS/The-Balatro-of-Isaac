SMODS.Joker {
    --[[
    NOTE: As of 6/21/2025, this card has a small visual bug.
    When copied by Blueprint or Brainstorm, the '+# Hands' message will
    always appear under Greed's Gullet instead of under the copying cards.
    This is in contrast to Burglar, where the text is correctly displayed
    under the copy card.
    NOTE: Fixed as of Update 1.0.9.0
    ]]--
    key = "greeds_gullet",
    config = {
        extra = {
            h_plays = 1,
            dollars = 50
        }
    },
    rarity = 1,
    pos = { x = 0, y = 4 },
    atlas = "tboi_jokers",
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_plays,
                card.ability.extra.dollars,
                card.ability.extra.h_plays * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            local _hands = card.ability.extra.h_plays * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
            return {
                message = localize({
                    type = "variable",
                    key = "a_hands",
                    vars = { _hands }
                }),
                func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = "immediate",
                        func = function()
                            ease_hands_played(_hands, true)
                            return true
                        end
                    }))
                end
            }
        end
    end
}