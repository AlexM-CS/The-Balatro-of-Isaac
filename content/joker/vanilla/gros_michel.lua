SMODS.Joker:take_ownership("gros_michel",
    {
        config = {
            extra = {
                odds = 6,
                mult = 15
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
                    card.ability.extra.mult,
                    (G.GAME and G.GAME.probabilities.normal or 1),
                    card.ability.extra.odds
                }
            }
        end,
        calculate = function(self, card, context)
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                if pseudorandom("gros_michel") < G.GAME.probabilities.normal / card.ability.extra.odds then
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
                                if G.jokers.cards[i].ability.extra.mult == nil then
                                    G.jokers.cards[i].ability.extra.mult = card.ability.extra.mult
                                else
                                    G.jokers.cards[i].ability.extra.mult = G.jokers.cards[i].ability.extra.mult + card.ability.extra.mult
                                end
                            end
                        end
                    end
                    G.GAME.pool_flags.vremade_gros_michel_extinct = true
                    return {
                        message = localize("k_extinct_ex")
                    }
                else
                    return {
                        message = localize("k_safe_ex")
                    }
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end,
    },
    true
)