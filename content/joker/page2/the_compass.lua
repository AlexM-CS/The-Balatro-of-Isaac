SMODS.Joker {
    key = "the_compass",
    loc_txt = {
        name = "The Compass",
        text = {
            "For every {C:attention}Boss Blind",
            "defeated, gain {C:red}+#1#{} Mult",
            "{C:inactive}(Currently {C:red}+#2#{}{C:inactive} Mult)",
            "{s:0.8}{C:inactive}\"The end is near\""
        }
    },
    config = {
        extra = {
            mult = 0
        },
        special = {
            add = 12
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
                card.ability.special.add,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if G.GAME.blind and G.GAME.blind.boss and context.end_of_round and not context.game_over and context.cardarea == G.jokers then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.special.add
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