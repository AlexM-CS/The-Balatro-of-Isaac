SMODS.Joker {
    key = "1up",
    config = {
        extra = {
        }
    },
    rarity = 3,
    pos = { x = 10, y = 2 },
    atlas = "tboi_jokers",
    cost = 10,
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
        if context.end_of_round and context.game_over and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("tarot1")
                    card:start_dissolve()
                    return true
                end
            }))
            return {
                message = localize({
                    type = "variable",
                    key = "k_saved",
                    vars = { "1 Up" }
                }),
                colour = G.C.RED
            }
        end
    end
}