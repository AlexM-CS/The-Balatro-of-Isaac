SMODS.Joker {
    key = "1up",
    config = {
        extra = {
        }
    },
    rarity = 3,
    pos = { x = 10, y = 2 },
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
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("tarot1")
                    card:start_dissolve()
                    return true
                end
            }))
            return {
                saved = "ph_1_up",
                message = localize("k_saved_ex"),
                colour = G.C.RED
            }
        end
    end
}