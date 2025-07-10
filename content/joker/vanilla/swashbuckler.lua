SMODS.Joker:take_ownership("swashbuckler",
    {
        config = {
            extra = {
                mult = 1
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
            local sell_cost = 0
            for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                if joker ~= card then
                    sell_cost = sell_cost + joker.sell_cost
                end
            end
            return {
                vars = {
                    card.ability.extra.mult * sell_cost
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                local sell_cost = 0
                for _, joker in ipairs(G.jokers.cards) do
                    if joker ~= card then
                        sell_cost = sell_cost + joker.sell_cost
                    end
                end
                return {
                    mult = card.ability.extra.mult * sell_cost
                }
            end
        end
    },
    true
)