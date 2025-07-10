SMODS.Joker:take_ownership("cloud_9",
    {
        -- Some scaling Jokers cause crashes when their original calculation code runs,
        -- this prevents them from using the vanilla calculation
        name = "tboi-Cloud 9",
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
            local nine_tally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 9 then nine_tally = nine_tally + 1 end
                end
            end
            return {
                vars = {
                    card.ability.extra.dollars,
                    card.ability.extra.dollars * nine_tally
                }
            }
        end,

        calc_dollar_bonus = function(self, card)
            local nine_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 9 then nine_tally = nine_tally + 1 end
            end
            return nine_tally > 0 and card.ability.extra.dollars * nine_tally or nil
        end
    },
    true
)