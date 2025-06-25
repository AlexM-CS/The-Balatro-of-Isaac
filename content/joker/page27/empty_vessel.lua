SMODS.Joker {
    key = "empty_vessel",
    config = {
        extra = {
            dollars = 3
        }
    },
    rarity = 2,
    pos = { x = 10, y = 3 },
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and G.GAME.chips + hand_chips * mult < G.GAME.blind.chips then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end
}