SMODS.Joker:take_ownership("hit_the_road",
    {
        config = {
            extra = {
                Xmult_gain = 0.5,
                Xmult = 1
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
            if context.discard and not context.blueprint and
               not context.other_card.debuff and
               context.other_card:get_id() == 11 then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                return {
                    message = localize({
                        type = "variable",
                        key = "a_xmult",
                        vars = { card.ability.extra.Xmult }
                    }),
                    colour = G.C.RED
                }
            end
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                if next(SMODS.find_card("j_tboi_crickets_head")) then
                    card.ability.extra.Xmult = 1.5
                else
                    card.ability.extra.Xmult = 1
                end
                return {
                    message = localize("k_reset"),
                    colour = G.C.RED
                }
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end,
    }
    --true
)