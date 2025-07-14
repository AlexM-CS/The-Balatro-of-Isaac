SMODS.Joker {
    key = "the_belt",
    config = {
        extra = {
            chip_mod = 20,
            chips = 0
        }
    },
    rarity = 1,
    pos = { x = 6, y = 3 },
    atlas = "tboi_jokers",
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_mod,
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if G.GAME.blind and context.end_of_round and not context.game_over and context.cardarea == G.jokers then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.BLUE
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}