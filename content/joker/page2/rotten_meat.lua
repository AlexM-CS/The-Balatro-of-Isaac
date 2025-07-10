SMODS.Joker {
    key = "rotten_meat",
    config = {
        extra = {
            h_plays = 1,
            repetitions = 1,
            hands_left = 4
        }
    },
    rarity = 1,
    pos = { x = 4, y = 3 },
    atlas = "tboi_jokers",
    cost = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "food", set = "Other" }
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
                card.ability.extra.h_plays,
                card.ability.extra.repetitions,
                card.ability.extra.hands_left
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_plays
        ease_hands_played(card.ability.extra.h_plays)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_plays
        ease_hands_played(-card.ability.extra.h_plays)
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() < 11 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
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
                            if G.jokers.cards[i].ability.extra.h_plays == nil then                           
                                G.jokers.cards[i].ability.extra.h_plays = card.ability.extra.h_plays
                            else
                                G.jokers.cards[i].ability.extra.h_plays = G.jokers.cards[i].ability.extra.h_plays + card.ability.extra.h_plays
                            end
                            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_plays
                            if G.jokers.cards[i].ability.extra.number_repetitions == nil then
                                G.jokers.cards[i].ability.extra.number_repetitions = card.ability.extra.repetitions
                            else
                                G.jokers.cards[i].ability.extra.number_repetitions = G.jokers.cards[i].ability.extra.number_repetitions + card.ability.extra.repetitions
                            end
                        end
                    end
                end
                return {
                    message = localize("k_eaten_ex"),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.hands_left = card.ability.extra.hands_left - 1
                return {
                    message = card.ability.extra.hands_left.."",
                    colour = G.C.FILTER
                }
            end
        end
    end
}