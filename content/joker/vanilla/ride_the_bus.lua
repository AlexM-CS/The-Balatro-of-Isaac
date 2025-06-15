SMODS.Joker:take_ownership("ride_the_bus",
    {
        -- Some scaling Jokers cause crashes when their original calculation code runs,
        -- this prevents them from using the vanilla calculation
        name = "tboi-Ride the Bus",
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
                    card.ability.extra.mult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.before and context.main_eval and not context.blueprint then
                local faces = false
                for _, playing_card in ipairs(context.scoring_hand) do
                    if playing_card:is_face() then
                        faces = true
                        break
                    end
                end
                if faces then
                    local last_mult = card.ability.extra.mult
                    card.ability.extra.mult = 0
                    if last_mult > 0 then
                        return {
                            message = localize('k_reset')
                        }
                    end
                else
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
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