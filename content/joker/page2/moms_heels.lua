SMODS.Joker {
    key = "moms_heels",
    config = {
        extra = {
            h_size = 1,
            mult_gain = 3,
            mult = 0
        }
    },
    rarity = 1,
    pos = { x = 8, y = 3 },
    atlas = "tboi_jokers",
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_size,
                card.ability.extra.mult_gain,
                card.ability.extra.mult
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,

    calculate = function(self, card, context)
        if context.debuffed_hand or context.joker_main then
            if G.GAME.blind.triggered then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize("k_upgrade_ex")
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}