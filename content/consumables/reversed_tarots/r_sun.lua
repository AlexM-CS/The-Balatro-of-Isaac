SMODS.Consumable {
    key = "r_sun",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Sun?",
        text = {
            "Destroy all {V:1}Hearts",
            "cards in your hand",
            "{s:0.8}{C:inactive}\"May the darkness swallow",
            "{s:0.8}{C:inactive}all around you\""
        }
    },
    pos = { x = 4, y = 3 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {
                    G.C.SUITS["Hearts"]
                }
            }
        }
    end,

    use = function(self, card, area, copier)
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_card.base.suit == "Hearts" then
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
        return G.hand
    end
}