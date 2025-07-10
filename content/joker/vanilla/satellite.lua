SMODS.Joker:take_ownership("satellite",
    {
        -- Some scaling Jokers cause crashes when their original calculation code runs,
        -- this prevents them from using the vanilla calculation
        name = "tboi-Satellite",
        config = {
            extra = {
                dollars = 1
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
            local planets_used = 0
            for k, v in pairs(G.GAME.consumeable_usage) do if v.set == "Planet" then planets_used = planets_used + 1 end end
            return {
                vars = {
                    card.ability.extra.dollars,
                    planets_used * card.ability.extra.dollars
                }
            }
        end,

        calc_dollar_bonus = function(self, card)
            local planets_used = 0
            for k, v in pairs(G.GAME.consumeable_usage) do
                if v.set == "Planet" then planets_used = planets_used + 1 end
            end
            return planets_used > 0 and planets_used * card.ability.extra.dollars or nil
        end
    },
    true
)