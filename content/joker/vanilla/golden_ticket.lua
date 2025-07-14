SMODS.Joker:take_ownership("ticket",
    {
        config = {
            extra = {
                dollars = 4
            }
        },

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
            return {
                vars = {
                    card.ability.extra.dollars
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and
                SMODS.has_enhancement(context.other_card, "m_gold") then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                return {
                    dollars = card.ability.extra.dollars,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end,
    },
    true
)