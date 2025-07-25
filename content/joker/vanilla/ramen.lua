SMODS.Joker:take_ownership("ramen",
    {
        --[[
        NOTE: As of 6/20/2025, this card is bugged, kind of.
        There is a known bug (even in Vanilla) where Ramen can be eaten
        multiple times if the amount of discarded cards goes beyond its normal
        1.00 threshold. This bug is abusable with Binge Eater, which relies on
        food items being eaten. Since it exists even in Vanilla Balatro, I will
        not be attempting to fix it until its fixed in Vanilla as well.
        ]]--
        config = {
            extra = {
                Xmult_loss = 0.01,
                Xmult = 2
            },
            special = {
                flag = true
            }
        },

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = { key = "food", set = "Other" }
            return {
                vars = {
                    card.ability.extra.Xmult,
                    card.ability.extra.Xmult_loss
                }
            }
        end,

        calculate = function(self, card, context)
            if context.discard and not context.blueprint and card.ability.special.flag then
                if card.ability.extra.Xmult - card.ability.extra.Xmult_loss <= 1 then
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
                                    G.jokers.cards[i].ability.extra.Xmult = 2
                                else
                                    G.jokers.cards[i].ability.extra.Xmult = G.jokers.cards[i].ability.extra.Xmult + 2
                                end
                            end
                        end
                    end
                    card.ability.special.flag = false
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
    },
    true
)