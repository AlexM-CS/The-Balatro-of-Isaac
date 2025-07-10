SMODS.Joker:take_ownership("8_ball",
    {
        config = {
            extra = {
                odds = 4
            }
        },

        loc_vars = function(self, info_queue, card)
            if BI.show_item_pools_check() then
                local text = BI.generate_pool_text(card)
                info_queue[#info_queue + 1] = {
                    set = "Other", key = "item_pool", vars = {
                        text.is_modded,
                        text.rarity,
                        colours = {
                            text.colour
                        }
                    }
                }
            end
            return {
                vars = {
                    (G.GAME and G.GAME.probabilities.normal or 1),
                    card.ability.extra.odds
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and
                #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if (context.other_card:get_id() == 8) and (pseudorandom("8_ball") < G.GAME.probabilities.normal / card.ability.extra.odds) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        extra = {
                            message = localize("k_plus_tarot"),
                            message_card = card,
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = (function()
                                        SMODS.add_card {
                                            set = "Tarot",
                                            key_append = "8_ball"
                                        }
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end)
                                }))
                            end
                        },
                    }
                end
            end
        end
    },
    true
)