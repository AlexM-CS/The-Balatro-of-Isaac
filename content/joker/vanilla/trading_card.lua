SMODS.Joker:take_ownership("trading",
    {
        config = {
            extra = {
                dollars = 3
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
            return {
                vars = {
                    card.ability.extra.dollars
                }
            }
        end,

        calculate = function(self, card, context)
            if context.first_hand_drawn then
                local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
            end
            if context.discard and not context.blueprint and
                G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
                return {
                    dollars = card.ability.extra.dollars,
                    remove = true
                }
            end
        end
    },
    true
)