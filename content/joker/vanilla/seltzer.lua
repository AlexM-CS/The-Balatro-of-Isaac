SMODS.Joker:take_ownership("selzer",
    {
        config = {
            extra = {
                hands_left = 10
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.hands_left
                }
            }
        end,
        calculate = function(self, card, context)
            if context.repetition and context.cardarea == G.play then
                return {
                    repetitions = 1
                }
            end
            if context.after and not context.blueprint then
                if card.ability.extra.hands_left - 1 <= 0 then
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
                                if G.jokers.cards[i].ability.extra.number_repetitions == nil then
                                    G.jokers.cards[i].ability.extra.number_repetitions = 1
                                else
                                    G.jokers.cards[i].ability.extra.number_repetitions = G.jokers.cards[i].ability.extra.number_repetitions + 1
                                end
                                if G.jokers.cards[i].ability.extra.face_repetitions == nil then
                                    G.jokers.cards[i].ability.extra.face_repetitions = 1
                                else
                                    G.jokers.cards[i].ability.extra.face_repetitions = G.jokers.cards[i].ability.extra.face_repetitions + 1
                                end
                                if G.jokers.cards[i].ability.extra.ace_repetitions == nil then
                                    G.jokers.cards[i].ability.extra.ace_repetitions = 1
                                else
                                    G.jokers.cards[i].ability.extra.ace_repetitions = G.jokers.cards[i].ability.extra.ace_repetitions + 1
                                end
                            end
                        end
                    end
                    return {
                        message = localize("k_drank_ex"),
                        colour = G.C.FILTER
                    }
                else
                    card.ability.extra.hands_left = card.ability.extra.hands_left - 1
                    return {
                        message = card.ability.extra.hands_left .. "",
                        colour = G.C.FILTER
                    }
                end
            end
        end
    },
    true
)