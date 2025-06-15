SMODS.Joker:take_ownership("ramen",
    {
        config = {
            extra = {
                Xmult_loss = 0.01,
                Xmult = 2
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.Xmult,
                    card.ability.extra.Xmult_loss
                }
            }
        end,
        calculate = function(self, card, context)
            if context.discard and not context.blueprint then
                if card.ability.extra.Xmult - card.ability.extra.Xmult_loss <= 1 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("tarot1")
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
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
                    return {
                        message = localize("k_eaten_ex"),
                        colour = G.C.FILTER
                    }
                else
                    card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.Xmult_loss
                    return {
                        message = localize ({
                            type = "variable",
                            key = "a_xmult_minus",
                            vars = { card.ability.extra.Xmult_loss }
                        }),
                        colour = G.C.RED
                    }
                end
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    }
    --true
)