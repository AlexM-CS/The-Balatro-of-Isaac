SMODS.Consumable {
    key = "r_lovers",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Lovers?",
        text = {
            "Select up to #1# cards",
            "Change suits randomly",
            "{s:0.8}{C:inactive}\"May your heart shatter to pieces\""
        }
    },
    config = {
        extra = {
            max = 3
        }
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