SMODS.Joker:take_ownership("hanging_chad",
    {
        config = {
            extra = {
                repetitions = 2
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
                    card.ability.extra.repetitions
                }
            }
        end,

        calculate = function(self, card, context)
            if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    },
    true
)