SMODS.Joker:take_ownership("popcorn",
    {
        config = {
            extra = {
                mult_loss = 4,
                mult = 20
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.mult_loss
                }
            }
        end,
        calculate = function(self, card, context)
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                if card.ability.extra.mult - card.ability.extra.mult_loss <= 0 then
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
                    return {
                        message = localize("k_eaten_ex"),
                        colour = G.C.RED
                    }
                else
                    card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
                    return {
                        message = localize({
                            type = "variable",
                            key = "a_mult_minus",
                            vars = { card.ability.extra.mult_loss }
                        }),
                        colour = G.C.MULT
                    }
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    },
    true
)