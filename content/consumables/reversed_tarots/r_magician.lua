SMODS.Consumable {
    key = "r_magician",
    set = "Reversed_Tarot",
    config = {
        extra = {
            cards = 2,
            dollars = 5
        }
    },
    pos = { x = 1, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cards,
                card.ability.extra.dollars
            }
        }
    end,

    use = function(self, card, area, copier)
        for _, playing_card in ipairs(G.hand.highlighted) do
            local percent = 1.15 - (_ - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
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
                trigger = "after",
                delay = 0.1,
                func = function()
                    playing_card:set_ability("c_base")
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
        ease_dollars(card.ability.extra.dollars)
    end,

    can_use = function(self, card)
        local flag = false
        if G.hand and #G.hand.highlighted == 2 then
            if G.hand.highlighted[1].ability.set == "Enhanced" and G.hand.highlighted[2].ability.set == "Enhanced" then
                flag = true
            end
        end
        return flag
    end
}