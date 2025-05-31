SMODS.Consumable {
    key = "r_temperance",
    set = "tboi_reversed",
    loc_txt = {
        name = "Temperance?",
        text = {
            "Sell all your {C:attention}Jokers",
            "Create #1# {C:blue}Spectral{} cards",
            "{C:inactive}(Must have room)",
            "{s:0.8}{C:inactive}\"May your hunger be satiated"
        }
    },
    config = {

    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}