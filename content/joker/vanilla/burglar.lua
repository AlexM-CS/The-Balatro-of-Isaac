SMODS.Joker:take_ownership("burglar",
    {
        config = {
            extra = {
                h_plays = 3
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
                    card.ability.extra.h_plays
                }
            }
        end,

        calculate = function(self, card, context)
            if context.setting_blind then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_discard(-G.GAME.current_round.discards_left, nil, true)
                        ease_hands_played(card.ability.extra.h_plays)
                        SMODS.calculate_effect({
                            message = localize({
                                type = "variable",
                                key = "a_hands",
                                vars = { card.ability.extra.h_plays }
                            }
                        )}, context.blueprint_card or card)
                        return true
                    end
                }))
                return nil, true
            end
        end
    },
    true
)