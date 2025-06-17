SMODS.Joker {
    key = "the_compass",
    config = {
        extra = {
            mult_gain = 12,
            mult = 0
        }
    },
    rarity = 2,
    pos = { x = 20, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_gain,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if G.GAME.blind and G.GAME.blind.boss and context.end_of_round and not context.game_over and context.cardarea == G.jokers then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}