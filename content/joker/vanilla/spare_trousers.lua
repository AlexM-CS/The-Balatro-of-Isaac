SMODS.Joker:take_ownership("trousers",
    {
        config = {
            extra = {
                mult_gain = 2,
                mult = 0
            }
        },

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult_gain,
                    localize("Two Pair", "poker_hands"),
                    card.ability.extra.mult
                }
            }
        end,

        calculate = function(self, card, context)
            if context.before and context.main_eval and not context.blueprint and (next(context.poker_hands["Two Pair"]) or next(context.poker_hands["Full House"])) then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.RED
                }
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