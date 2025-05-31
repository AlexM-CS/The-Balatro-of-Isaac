SMODS.Joker {
    key = "skatole",
    loc_txt = {
        name = "Skatole",
        text = {
            "All {C:attention}Flies{} give",
            "{C:red}+#1#{} Mult",
            "{s:0.8}{C:inactive}\"Fly love\""
        }
    },
    config = {
        extra = {
            mult = 1
        }
    },
    rarity = 1,
    pos = { x = 8, y = 2},
    atlas = "tboi_jokers",
    cost = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "flies", set = "Other" }
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    add_to_deck = function(self, card)
        BI.FLIES.fly_mult = BI.FLIES.fly_mult + card.ability.extra.mult
    end,

    remove_from_deck = function(self, card)
        BI.FLIES.fly_mult = BI.FLIES.fly_mult - card.ability.extra.mult
    end
}