SMODS.Joker {
    key = "mercurius",
    config = {
        extra = {
            poker_hand = "Pair"
        }
    },
    rarity = 3,
    pos = { x = 20, y = 3 },
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        info_queue[#info_queue + 1] = G.P_CENTERS.c_mercury
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
            }
        }
    end,

    calculate = function(self, card, context)
        if context.skip_blind then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.0,
                func = function()
                    local _planet = nil
                    for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                        if v.config.hand_type == card.ability.extra.poker_hand then
                            _planet = v.key
                        end
                    end
                    if _planet then
                        SMODS.add_card({key = _planet, edition = "e_negative"})
                    end
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return {
                message = localize("k_plus_planet"),
                colour = G.C.SECONDARY_SET.Planet
            }
        end
    end
}