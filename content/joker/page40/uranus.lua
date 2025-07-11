SMODS.Joker {
    key = "uranus",
    config = {
        extra = {
            poker_hand = "Two Pair"
        },
        special = {
            ante_scaling_mod = 0.02
        }
    },
    rarity = 3,
    pos = { x = 5, y = 4 },
    atlas = "tboi_jokers",
    cost = 10,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        if BI.show_item_pools_check() then
            local text = BI.generate_pool_text(card)
            info_queue[#info_queue + 1] = {
                set = "Other", key = "item_pool", vars = {
                    text.is_modded,
                    text.pool,
                    colours = {
                        text.colour
                    }
                }
            }
        end
        return {
            vars = {
                card.ability.special.ante_scaling_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if G.GAME.last_hand_played == card.ability.extra.poker_hand and context.end_of_round and not context.game_over and context.cardarea == G.jokers then
            G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * (1 - card.ability.special.ante_scaling_mod)
            return {
                message = localize("k_descaled"),
                colour = G.C.SECONDARY_SET.Planet
            }
        end
    end
}