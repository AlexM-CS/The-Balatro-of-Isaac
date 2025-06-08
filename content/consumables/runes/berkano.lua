SMODS.Consumable {
    key = "berkano",
    set = "tboi_runes",
    loc_txt = {
        name = "Berkano",
        text = {
            "All {C:attention}Jokers{} with",
            "Flies or Spiders get",
            "{C:attention}+#1#{} Flies and {C:attention}+#2#{} Spiders",
            "{s:0.8}{C:inactive}\"Companionship\""
        }
    },
    config = {
        special = {
            flies = 3,
            spiders = 3
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_runes",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.flies,
                card.ability.extra.spiders
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}