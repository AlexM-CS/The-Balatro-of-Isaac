SMODS.Consumable {
    key = "r_emperor",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Emperor?",
        text = {
            "Creates up to {C:attention}#1#",
            "{set:primary_colour}Reversed Tarot{} Cards",
            "{C:inactive}(Must have room)",
            "{s:0.8}{C:inactive}\"May you find a worthy opponent\""
        }
    },
    config = {
        extra = {
            create = 2
        }
    },
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.create
            }
        }
    end,

    use = function(self, card, area, copier)

    end,

    can_use = function(self, card)

    end
}