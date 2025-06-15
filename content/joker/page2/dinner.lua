SMODS.Joker {
    key = "dinner",
    loc_txt = {
        name = "Dinner",
        text = {
            "{C:red}+#1#{} Hands, {X:red,C:white}X#2#{} Mult",
            "Eaten after {C:attention}#3#{} rounds",
            "{s:0.8}{C:inactive}\"HP up\""
        }
    },
    config = {
        extra = {
            h_size = 1,
            Xmult = 1.25,
            hands_left = 4
        }
    },
    rarity = 1,
    pos = { x = 1, y = 3 },
    atlas = "tboi_jokers",
    cost = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "food", set = "Other" }
        return {
            vars = {
                card.ability.extra.h_size,
                card.ability.extra.Xmult,
                card.ability.extra.hands_left
            }
        }
    end,

    add_to_deck = function(self, card)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_size
        ease_hands_played(card.ability.extra.h_size)
    end,

    remove_from_deck = function(self, card)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_size
        ease_hands_played(-card.ability.extra.h_size)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
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