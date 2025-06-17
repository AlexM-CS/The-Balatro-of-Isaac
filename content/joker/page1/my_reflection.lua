SMODS.Joker {
    key = "my_reflection",
    config = {
        special = {
            temp = nil
        }
    },
    rarity = 2,
    pos = { x = 4, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.special.temp = hand_chips
            hand_chips = mult
            mult = card.ability.special.temp
            update_hand_text({}, {mult = mult, chips = hand_chips})
            G.E_MANAGER:add_event(Event({
                func = (function()
                    play_sound("gong", 0.94, 0.3)
                    play_sound("gong", 0.94*1.5, 0.2)
                    play_sound("tarot1", 1.5)
                    ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
                    ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        blockable = false,
                        blocking = false,
                        delay =  4.3,
                        func = (function() 
                                ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                                ease_colour(G.C.UI_MULT, G.C.RED, 2)
                            return true
                        end)
                    }))
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        blockable = false,
                        blocking = false,
                        no_delete = true,
                        delay =  6.3,
                        func = (function() 
                            G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                            G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
                            return true
                        end)
                    }))
                    return true
                end)
            }))
            return {
                message = localize("k_swapped"),
                colour = G.C.PURPLE
            }
        end
    end
}