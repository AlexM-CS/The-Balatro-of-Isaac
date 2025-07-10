SMODS.Joker:take_ownership("ice_cream",
    {
        config = {
            extra = {
                chip_mod = 5,
                chips = 100
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
                    card.ability.extra.chips,
                    card.ability.extra.chip_mod
                }
            }
        end,
        calculate = function(self, card, context)
            if context.after and context.main_eval and not context.blueprint then
                if card.ability.extra.chips - card.ability.extra.chip_mod <= 0 then
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
                                if G.jokers.cards[i].ability.extra.chips == nil then
                                    G.jokers.cards[i].ability.extra.chips = 100
                                else
                                    G.jokers.cards[i].ability.extra.chips = G.jokers.cards[i].ability.extra.chips + 100
                                end
                            end
                        end
                    end
                    return {
                        message = localize("k_melted_ex"),
                        colour = G.C.CHIPS
                    }
                else
                    card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_mod
                    return {
                        message = localize({
                            type = "variable",
                            key = "a_chips_minus",
                            vars = { card.ability.extra.chip_mod }
                        }),
                        colour = G.C.CHIPS
                    }
                end
            end
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    },
    true
)