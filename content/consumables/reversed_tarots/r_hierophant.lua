SMODS.Consumable {
    key = "r_hierophant",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Hierophant?",
        text = {
            "Permanently add {C:blue}+#1#{} Chips",
            "to up to #2# cards",
            "{s:0.8}{C:inactive}\"Two prayers for the forgotten\""
        }
    },
    config = {
        extra = {
            upgrade = 20,
            max = 2
        }
    },
    pos = { x = 0, y = 1 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.upgrade,
                card.ability.extra.max
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}