SMODS.Joker:take_ownership("loyalty_card",
    {
        config = {
            extra = {
                Xmult = 4,
                every = 5,
                loyalty_remaining = 5
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
                    card.ability.extra.Xmult,
                    card.ability.extra.every + 1,
                    localize({
                        type = "variable",
                        key = (card.ability.extra.loyalty_remaining == 0 and "loyalty_active" or "loyalty_inactive"),
                        vars = { card.ability.extra.loyalty_remaining }
                    })
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.joker_main then
                card.ability.extra.loyalty_remaining = (card.ability.extra.every - 1 - (G.GAME.hands_played - card.ability.hands_played_at_create)) %
                    (card.ability.extra.every + 1)
                if not context.blueprint then
                    if card.ability.extra.loyalty_remaining == 0 then
                        local eval = function(card) return card.ability.extra.loyalty_remaining == 0 and not G.RESET_JIGGLES end
                        juice_card_until(card, eval, true)
                    end
                end
                if card.ability.extra.loyalty_remaining == card.ability.extra.every then
                    return {
                        xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
    },
    true
)