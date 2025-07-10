SMODS.Joker:take_ownership("misprint",
    {
        -- This prevents Misprint from having a bug in its description
        name = "tboi-Misprint",
        config = {
            extra = {
                max = 23,
                min = 0
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
            local r_mults = {}
            for i = card.ability.extra.min, card.ability.extra.max do
                r_mults[#r_mults + 1] = tostring(i)
            end
            local loc_mult = " ".. (localize('k_mult')).." "
            main_start = {
                { n = G.UIT.T, config = { text = "  +", colour = G.C.MULT, scale = 0.32 } },
                { n = G.UIT.O, config = { object = DynaText({ string = r_mults, colours = { G.C.RED }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
                {
                    n = G.UIT.O,
                    config = {
                        object = DynaText({
                            string = {
                                { string = "rand()", colour = G.C.JOKER_GREY }, { string = "#@"..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1) or "D"), colour = G.C.RED },
                                loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult,
                                loc_mult, loc_mult, loc_mult, loc_mult },
                            colours = { G.C.UI.TEXT_DARK },
                            pop_in_rate = 9999999,
                            silent = true,
                            random_element = true,
                            pop_delay = 0.2011,
                            scale = 0.32,
                            min_cycle_time = 0
                        })
                    }
                },
            }
            return { main_start = main_start }
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    mult = pseudorandom("misprint", card.ability.extra.min, card.ability.extra.max)
                }
            end
        end
    },
    true
)