SMODS.Joker:take_ownership("mail",
    {
        config = {
            extra = {
                dollars = 5
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
                    card.ability.extra.dollars,
                    localize((G.GAME.current_round.vremade_mail_card or {}).rank or "Ace", "ranks")
                }
            }
        end,

        calculate = function(self, card, context)
            if context.discard and not context.other_card.debuff and
                context.other_card:get_id() == G.GAME.current_round.vremade_mail_card.id then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                return {
                    dollars = card.ability.extra.dollars,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    },
    true
)