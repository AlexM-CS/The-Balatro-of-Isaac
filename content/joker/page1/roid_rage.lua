SMODS.Joker {
    key = "roid_rage",
    config = {
        extra = {
            chips = 200,
        },
        special = {
            subtract = 2
        }
    },
    rarity = 2,
    pos = { x = 13, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                math.max(card.ability.extra.chips, 0),
                card.ability.special.subtract
            }
        }
    end,

    calculate = function(self, card, context)
        if G.GAME.blind and G.GAME.blind.boss and context.end_of_round and not context.game_over and context.cardarea == G.jokers then
            card.ability.extra.chips = 200
            return {
                message = localize("k_reset"),
                colour = G.C.BLUE
            }
        end
        if context.joker_main then
            return {
                chips = math.max(card.ability.extra.chips, 0)
            }
        end
        if context.after then
            if not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips - #context.scoring_hand * card.ability.special.subtract
                return {
                    message = localize({
                        type = "variable",
                        key = "a_chips_minus",
                        vars = { #context.scoring_hand * card.ability.special.subtract }
                    }),
                    colour = G.C.BLUE
                }
            end
        end
    end
}