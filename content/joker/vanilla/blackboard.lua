SMODS.Joker:take_ownership("blackboard",
    {
        config = {
            extra = {
                Xmult = 3
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
                    localize("Spades", "suits_plural"),
                    localize("Clubs", "suits_plural")
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.joker_main then
                local all_black_suits = true
                for _, playing_card in ipairs(G.hand.cards) do
                    if not playing_card:is_suit("Clubs", nil, true) and not playing_card:is_suit("Spades", nil, true) then
                        all_black_suits = false
                        break
                    end
                end
                if all_black_suits then
                    return {
                        xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
    },
    true
)