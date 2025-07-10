SMODS.Joker:take_ownership("hallucination",
    {
        config = {
            extra = {
                odds = 2
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
                    G.GAME.probabilities.normal or 1,
                    card.ability.extra.odds
                }
            }
        end,

        calculate = function(self, card, context)
            if context.open_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if pseudorandom("hallucination"..G.GAME.round_resets.ante) < G.GAME.probabilities.normal / card.ability.extra.odds then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = "before",
                        delay = 0.0,
                        func = (function()
                            SMODS.add_card {
                                set = "Tarot",
                                key_append = "hallucination"
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    return {
                        message = localize("k_plus_tarot"),
                        colour = G.C.PURPLE,
                    }
                end
            end
        end
    },
    true
)