SMODS.Joker:take_ownership("blueprint",
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
                local other_joker
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
                end
                local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
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
                                    { n = G.UIT.T, config = { text = " "..localize("k_"..(compatible and "compatible" or "incompatible")).." ", colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
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