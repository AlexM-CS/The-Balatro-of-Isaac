SMODS.Joker:take_ownership("drivers_license",
    {
        config = {
            extra = {
                Xmult = 3,
                driver_amount = 16
            }
        },

        loc_vars = function(self, info_queue, card)
            local driver_tally = 0
            if G.playing_cards then
                for _, playing_card in pairs(G.playing_cards) do
                    if next(SMODS.get_enhancements(playing_card)) then driver_tally = driver_tally + 1 end
                end
            end
            return {
                vars = {
                    card.ability.extra.Xmult,
                    card.ability.extra.driver_amount,
                    driver_tally
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.joker_main then
                local driver_tally = 0
                for _, playing_card in pairs(G.playing_cards) do
                    if next(SMODS.get_enhancements(playing_card)) then driver_tally = driver_tally + 1 end
                end
                if driver_tally >= card.ability.extra.driver_amount then
                    return {
                        xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
    },
    true
)