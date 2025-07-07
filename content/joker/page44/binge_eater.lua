SMODS.Joker {
    key = "binge_eater",
    config = {
        extra = {
        }
    },
    rarity = 4,
    pos = { x = 5, y = 4 },
    atlas = "tboi_jokers",
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "food", set = "Other" }
        return {
            vars = {
            }
        }
    end,
    
    -- We don't need add_to_deck since Binge Eater starts without any additional effects
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.h_size ~= nil then
            G.hand:change_size(-card.ability.extra.h_size)
        end
        if card.ability.extra.h_plays ~= nil then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_plays
            ease_hands_played(-card.ability.extra.h_plays)
        end
    end,

    calculate = function(self, card, context)
        if context.selling_self then
            print(card.ability.extra)
        end
        if context.joker_main then
            local ret = {}
            if card.ability.extra.chips ~= nil then ret.chips = card.ability.extra.chips end
            if card.ability.extra.mult ~= nil then ret.mult = card.ability.extra.mult end
            if card.ability.extra.Xmult ~= nil then ret.Xmult = card.ability.extra.Xmult end
            return ret
        end
        if context.repetition and context.cardarea == G.play then
            if card.ability.extra.number_repetitions ~= nil and context.other_card:get_id() < 11 then
                return {
                    repetitions = card.ability.extra.number_repetitions
                }
            end
            if card.ability.extra.face_repetitions ~= nil and context.other_card:is_face() then
                return {
                    repetitions = card.ability.extra.face_repetitions
                }
            end
            if card.ability.extra.ace_repetitions ~= nil and context.other_card:get_id() == 14 then
                return {
                    repetitions = card.ability.extra.ace_repetitions
                }
            end
        end
    end
}