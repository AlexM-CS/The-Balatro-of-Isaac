SMODS.Joker:take_ownership("stone",
    {
        -- Some scaling Jokers cause crashes when their original calculation code runs,
        -- this prevents them from using the vanilla calculation
        name = "tboi-Stone Joker",
        config = {
            extra = {
                chips = 25
            }
        },

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
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
            local stone_tally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(playing_card, "m_stone") then stone_tally = stone_tally + 1 end
                end
            end
            return {
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.chips * stone_tally
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.joker_main then
                local stone_tally = 0
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(playing_card, "m_stone") then stone_tally = stone_tally + 1 end
                end
                return {
                    chips = card.ability.extra.chips * stone_tally
                }
            end
        end,
    },
    true
)