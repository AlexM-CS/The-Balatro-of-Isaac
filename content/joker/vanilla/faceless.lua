SMODS.Joker:take_ownership("faceless",
    {
        config = {
            extra = {
                dollars = 5,
                faces = 3
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
                    card.ability.extra.faces
                }
            }
        end,

        calculate = function(self, card, context)
            if context.discard and context.other_card == context.full_hand[#context.full_hand] then
                local face_cards = 0
                for _, discarded_card in ipairs(context.full_hand) do
                    if discarded_card:is_face() then face_cards = face_cards + 1 end
                end
                if face_cards >= card.ability.extra.faces then
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
        end
    },
    true
)