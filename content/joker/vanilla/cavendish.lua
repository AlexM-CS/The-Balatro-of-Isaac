SMODS.Joker:take_ownership("cavendish",
    {
        config = {
            extra = {
                Xmult = 3,
                odds = 1000
            }
        },

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = { key = "food", set = "Other" }
            return {
                vars = {
                    card.ability.extra.Xmult,
                    G.GAME and G.GAME.probabilities.normal or 1,
                    card.ability.extra.odds
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                if SMODS.pseudorandom_probability(card, "cavendish", 1, card.ability.extra.odds) then
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
                                if G.jokers.cards[i].ability.extra.Xmult == nil then
                                    G.jokers.cards[i].ability.extra.Xmult = card.ability.extra.Xmult
                                else
                                    G.jokers.cards[i].ability.extra.Xmult = G.jokers.cards[i].ability.extra.Xmult + card.ability.extra.Xmult
                                end
                            end
                        end
                    end
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
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)