SMODS.Joker:take_ownership("obelisk",
    {
        name = "tboi-Obelisk",
        config = {
            extra = {
                Xmult_gain = 0.2,
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
            if context.before and context.main_eval and not context.blueprint then
                local reset = true
                local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
                for k, v in pairs(G.GAME.hands) do
                    if k ~= context.scoring_name and v.played >= play_more_than and v.visible then
                        reset = false
                        break
                    end
                end
                if reset then
                    if card.ability.extra.Xmult > 1 then
                        if next(SMODS.find_card("j_tboi_crickets_head")) then
                            card.ability.extra.Xmult = 1.5
                        else
                            card.ability.extra.Xmult = 1
                        end
                        return {
                            message = localize("k_reset")
                        }
                    end
                else
                    card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                end
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end,
    }
)