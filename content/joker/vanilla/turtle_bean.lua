SMODS.Joker:take_ownership("turtle_bean",
    {
        config = {
            extra = {
                h_size = 5,
                h_mod = 1
            }
        },

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = { key = "food", set = "Other" }
            if BI.show_item_pools_check() then
                local text = BI.generate_pool_text(card)
                info_queue[#info_queue + 1] = {
                    set = "Other", key = "item_pool", vars = {
                        text.is_modded,
                        text.rarity,
                        colours = {
                            text.colour
                        }
                    }
                }
            end
            return {
                vars = {
                    card.ability.extra.h_size,
                    card.ability.extra.h_mod
                }
            }
        end,

        calculate = function(self, card, context)
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                if card.ability.extra.h_size - card.ability.extra.h_mod <= 0 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("tarot1")
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({
                                trigger = "after",
                                delay = 0.3,
                                blockable = false,
                                func = function()
                                    card:remove()
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                    if SMODS.find_card("j_tboi_binge_eater") then
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i].config.center_key == "j_tboi_binge_eater" then
                                if G.jokers.cards[i].ability.extra.h_size == nil then
                                    G.jokers.cards[i].ability.extra.h_size = 5
                                else
                                    G.jokers.cards[i].ability.extra.h_size = G.jokers.cards[i].ability.extra.h_size + 5
                                end
                                G.hand:change_size(5)
                            end
                        end
                    end
                    return {
                        message = localize("k_eaten_ex"),
                        colour = G.C.FILTER
                    }
                else
                    card.ability.extra.h_size = card.ability.extra.h_size - card.ability.extra.h_mod
                    G.hand:change_size(-card.ability.extra.h_mod)
                    return {
                        message = localize({
                            type = "variable",
                            key = "a_handsize_minus",
                            vars = { card.ability.extra.h_mod }
                        }),
                        colour = G.C.FILTER
                    }
                end
            end
        end,

        add_to_deck = function(self, card, from_debuff)
            G.hand:change_size(card.ability.extra.h_size)
        end,
        
        remove_from_deck = function(self, card, from_debuff)
            G.hand:change_size(-card.ability.extra.h_size)
        end
    },
    true
)