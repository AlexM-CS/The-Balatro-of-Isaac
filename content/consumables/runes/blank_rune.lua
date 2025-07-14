SMODS.Consumable {
    key = "blank_rune",
    set = "Rune",
    loc_txt = {
        name = "Blank Rune",
        text = {
            "Use another random {V:1}Rune",
            "{s:0.8}{C:inactive}\"???\""
        }
    },
    config = {
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_runes",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {
                    HEX("6d059f")
                }
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}