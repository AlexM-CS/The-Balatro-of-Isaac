SMODS.Consumable {
    key = "rune_shard",
    set = "Rune",
    loc_txt = {
        name = "Rune Shard",
        text = {
            "Reuse the last {V:1}Rune",
            "used this run",
            "{s:0.8}{C:inactive}\"It still glows faintly\""
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
                    BI.C.Rune
                }
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}