SMODS.Joker:take_ownership("gift",
    {
        config = {
            extra = {
                sell_value = 1
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
                    card.ability.extra.sell_value
                }
            }
        end,

        calculate = function(self, card, context)
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                for _, area in ipairs({ G.jokers, G.consumeables }) do
                    for _, other_card in ipairs(area.cards) do
                        if other_card.set_cost then
                            other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
                                card.ability.extra.sell_value
                            other_card:set_cost()
                        end
                    end
                end
                return {
                    message = localize("k_val_up"),
                    colour = G.C.MONEY
                }
            end
        end
    },
    true
)