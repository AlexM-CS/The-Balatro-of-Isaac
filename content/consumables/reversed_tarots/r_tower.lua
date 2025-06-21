SMODS.Consumable {
    key = "r_tower",
    set = "tboi_reversed",
    config = {
        extra = {
            mod_conv = "m_stone"
        }
    },
    pos = { x = 1, y = 3 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
        return {
            vars = {
            }
        }
    end,

    use = function(self, card, area, copier)
        for _, playing_card in ipairs(G.hand.cards) do
            local percent = 1.15 - (_ - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    playing_card:flip()
                    play_sound("card1", percent)
                    playing_card:juice_up(0.3, 0.3)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                func = function()
                    playing_card:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    playing_card:flip()
                    play_sound("card1", percent)
                    playing_card:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
    end,

    can_use = function(self, card)
        return G.hand
    end
}