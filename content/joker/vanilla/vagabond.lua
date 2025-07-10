SMODS.Joker:take_ownership("vagabond",
    {
        config = {
            extra = {
                dollars = 4
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
                    card.ability.extra.dollars
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main and
                #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if G.GAME.dollars <= card.ability.extra.dollars then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.add_card {
                                set = "Tarot",
                                key_append = "vagabond"
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    return {
                        message = localize("k_plus_tarot"),
                    }
                end
            end
        end
    },
    true
)