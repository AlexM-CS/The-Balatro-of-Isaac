SMODS.Consumable {
    key = "r_lovers",
    set = "tboi_reversed",
    config = {
        extra = {
            max_highlighted = 3
        }
    },
    pos = { x = 1, y = 1 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.max_highlighted
            }
        }
    end,

    use = function(self, card, area, copier)
        local _suit = pseudorandom_element({"Spades", "Hearts", "Clubs", "Diamonds"}, pseudoseed("r_lovers"))
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
                    SMODS.change_base(playing_card, _suit)
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
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.max_highlighted
    end
}