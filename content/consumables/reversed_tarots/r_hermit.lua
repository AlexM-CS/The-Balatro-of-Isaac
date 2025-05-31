SMODS.Consumable {
    key = "r_hermit",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Hermit?",
        text = {
            "Gives {C:money}$#1#{}",
            "{s:0.8}{C:inactive}\"May you see the value",
            "{s:0.8}{C:inactive}of all things in life\"",
        }
    },
    config = {
        extra = {
            money = 15
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}