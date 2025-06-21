SMODS.Joker {
    --[[
    NOTE: As of 6/21/2025, this card has a small visual bug.
    When copied by Blueprint or Brainstorm, the '+# Hands' message will
    always appear under Raw Liver instead of under the copying cards.
    This is in contrast to Burglar, where the text is correctly displayed
    under the copy card.
    ]]--
    key = "raw_liver",
    config = {
        extra = {
            h_plays = 1
        }
    },
    rarity = 2,
    pos = { x = 15, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_plays
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and G.jokers then
            local count = 0
            for _, joker in ipairs(G.jokers.cards) do if joker.config.center.rarity == 2 or joker.config.center.rarity == "Uncommon" then count = count + 1 end end
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_hands_played(count)
                    SMODS.calculate_effect({
                        message = localize({
                            type = "variable",
                            key = "a_hands",
                            vars = { count }
                        })
                        }, context.blueprint_card or card)
                    return true
                end
            }))
            return nil, true
        end
    end
}