SMODS.Joker {
    key = "head_of_the_keeper",
    config = {
        extra = {
            dollars = 1,
            odds = 6
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
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            pseudorandom('tboi_head_of_the_keeper') < G.GAME.probabilities.normal / card.ability.extra.odds then
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