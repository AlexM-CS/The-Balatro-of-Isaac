SMODS.Joker {
    key = "luna",
    config = {
        extra = {
            poker_hand = "Flush Five"
        }
    },
    rarity = 2,
    pos = { x = 2, y = 4 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_eris
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and context.scoring_name == card.ability.extra.poker_hand then
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
                        SMODS.add_card({ key = _planet })
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