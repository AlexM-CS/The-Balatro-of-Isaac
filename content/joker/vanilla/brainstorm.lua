SMODS.Joker:take_ownership("brainstorm",
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
            if card.area and card.area == G.jokers then
                local compatible = G.jokers.cards[1] and G.jokers.cards[1] ~= card and
                    G.jokers.cards[1].config.center.blueprint_compat
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
                                    colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
                                    r = 0.05,
                                    padding = 0.06
                                },
                                nodes = {
                                    { n = G.UIT.T, config = { text = " "..localize("k_".. (compatible and "compatible" or "incompatible")).." ", colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                                }
                            }
                        }
                    }
                }
                return {
                    main_end = main_end
                }
            end
        end,
    },
    true
)