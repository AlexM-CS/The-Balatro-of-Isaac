SMODS.Joker {
    key = "transcendence",
    config = {
        extra = {
            mult = 6
        }
    },
    rarity = 3,
    pos = { x = 19, y = 2 },
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
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
                card.ability.extra.mult,
                G.GAME.skips * card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            return {
                message = localize({ type = "variable", key = "a_mult", vars = {
                    G.GAME.skips * card.ability.extra.mult
                }})
            }
        end
        if context.joker_main then
            return {
                mult = G.GAME.skips * card.ability.extra.mult
            }
        end
    end
}