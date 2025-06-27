SMODS.Joker {
    key = "uranus",
    config = {
        extra = {
            poker_hand = "Two Pair"
        },
        special = {
            ante_scaling_mod = 0.01
        }
    },
    rarity = 3,
    pos = { x = 1, y = 4 },
    atlas = "tboi_jokers",
    cost = 10,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.special.ante_scaling_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and context.scoring_name == card.ability.extra.poker_hand then
            G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * (1 - card.ability.special.ante_scaling_mod)
            return {
                message = localize("k_descaled"),
                colour = G.C.SECONDARY_SET.Planet
            }
        end
    end
}