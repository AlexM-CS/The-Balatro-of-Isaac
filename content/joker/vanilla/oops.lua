SMODS.Joker:take_ownership("oops",
    {
        -- Stops crashes from probability-based cards
        name = "tboi-Oops! All 6's",
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
        end,

        calculate = function(self, card, context)
            if context.mod_probability and not context.blueprint then
                return {
                    numerator = context.numerator * 2
                }
            end
        end,
    },
    true
)