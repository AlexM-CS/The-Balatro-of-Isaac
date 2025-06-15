SMODS.Joker:take_ownership("caino",
    {
        config = {
            extra = {
                Xmult = 1,
                Xmult_gain = 1
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.Xmult_gain,
                    card.ability.extra.Xmult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.remove_playing_cards and not context.blueprint then
                local face_cards = 0
                for _, removed_card in ipairs(context.removed) do
                    if removed_card:is_face() then face_cards = face_cards + 1 end
                end
                if face_cards > 0 then
                    card.ability.extra.Xmult = card.ability.extra.Xmult + face_cards * card.ability.extra.Xmult_gain
                    return {
                        message = localize({
                            type = "variable",
                            key = "a_xmult",
                            vars = { card.ability.extra.Xmult }
                        })
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