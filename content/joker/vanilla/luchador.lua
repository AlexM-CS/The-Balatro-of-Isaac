SMODS.Joker:take_ownership("luchador",
    {
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
            local main_end = nil
            if card.area and (card.area == G.jokers) then
                local disableable = G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.boss))
                main_end = {
                    {
                        n = G.UIT.C,
                        config = { align = "bm", minh = 0.4 },
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = {
                                    ref_table = card,
                                    align = "m",
                                    colour = disableable and G.C.GREEN or G.C.RED,
                                    r = 0.05,
                                    padding = 0.06
                                },
                                nodes = {
                                    { n = G.UIT.T, config = { text = " "..localize(disableable and "k_active" or "ph_no_boss_active").." ", colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.9 } },
                                }
                            }
                        }
                    }
                }
            end
            return { main_end = main_end }
        end,
    },
    true
)