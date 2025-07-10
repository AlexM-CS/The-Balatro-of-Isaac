SMODS.Joker:take_ownership("steel_joker",
    {
        -- Some scaling Jokers cause crashes when their original calculation code runs,
        -- this prevents them from using the vanilla calculation
        name = "tboi-Steel Joker",
        config = {
            extra = {
                Xmult = 0.2
            }
        },

        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
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
            local steel_tally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(playing_card, "m_steel") then
                        steel_tally = steel_tally + 1
                    end
                end
            end
            return {
                vars = {
                    card.ability.extra.Xmult,
                    1 + card.ability.extra.Xmult * steel_tally
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                local steel_tally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(playing_card, "m_steel") then
                        steel_tally = steel_tally + 1
                    end
                end
            end
            return {
                Xmult = 1 + card.ability.extra.Xmult * steel_tally
            }
            end
        end
    },
    true
)