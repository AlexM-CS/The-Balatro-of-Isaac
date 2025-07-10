SMODS.Joker:take_ownership("space",
    {
        -- Stops crashes from probability-based cards
        name = "tboi-Space Joker",
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
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "space")
            return {
                vars = {
                    numerator,
                    denominator
                }
            }
        end,

        calculate = function(self, card, context)
            if context.before and context.main_eval and SMODS.pseudorandom_probability(card, "space", 1, card.ability.extra.odds) then
                return {
                    level_up = true,
                    message = localize("k_level_up_ex")
                }
            end
        end
    },
    true
)