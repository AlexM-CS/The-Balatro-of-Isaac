SMODS.Joker:take_ownership("green_joker",
    {
        name = "tboi-Green Joker",
        config = {
            extra = {
                mult_gain = 1,
                mult = 0
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult_gain,
                    card.ability.extra.mult_gain,
                    card.ability.extra.mult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.discard and not context.blueprint and context.other_card == context.full_hand[#context.full_hand] then
                local prev_mult = card.ability.extra.mult
                card.ability.extra.mult = math.max(0, card.ability.extra.mult - card.ability.extra.mult_gain)
                if card.ability.extra.mult ~= prev_mult then
                    return {
                        message = localize { type = "variable", key = "a_mult_minus", vars = { card.ability.extra.mult_gain } },
                        colour = G.C.RED
                    }
                end
            end
            if context.before and context.main_eval and not context.blueprint then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize { type = "variable", key = "a_mult", vars = { card.ability.extra.mult_gain } }
                }
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    }
)