SMODS.Joker {
    key = "number_one",
    loc_txt = {
        name = "Number One",
        text = {
            "Halves base {C:red}Mult",
            "For every {C:red}#1#{} Mult lost",
            "this gives {C:blue}+#2#{} Chips",
            "{s:0.8}{C:inactive}\"Tears up\""
        }
    },
    config = {
        extra = {
            amount_mult = 1,
            amount_chips = 10,
            stored = nil
        }
    },
    rarity = 2,
    pos = { x = 5, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.amount_mult,
                card.ability.extra.amount_chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.stored = math.floor((mult - mult / 2) / card.ability.extra.amount_mult)
            mult = mult / 2
            return {
                mult = 0,
                message = localize("k_halved"),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.stored * card.ability.extra.amount_chips
            }
        end
    end
}