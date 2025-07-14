SMODS.Consumable {
    key = "r_star",
    set = "Reversed_Tarot",
    pos = { x = 2, y = 3 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {
                    G.C.SUITS["Diamonds"]
                }
            }
        }
    end,

    use = function(self, card, area, copier)
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_card.base.suit == "Diamonds" then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    func = function()
                        playing_card:start_dissolve()
                        return true
                    end
                }))
            end
        end        
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}