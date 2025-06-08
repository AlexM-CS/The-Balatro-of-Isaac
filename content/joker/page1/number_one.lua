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
        special = {
            amount_chips = 25,
            amount_mult = 2,
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
                card.ability.special.amount_mult,
                card.ability.special.amount_chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            card.ability.special.stored = math.floor((mult - mult / 2) / card.ability.spcial.amount_mult)
            mult = mult / 2
            return {
                mult = 0,
                message = localize("k_halved"),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.special.stored * card.ability.extra.amount_chips
            }
        end
    end
}