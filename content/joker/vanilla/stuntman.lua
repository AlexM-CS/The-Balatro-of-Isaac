SMODS.Joker:take_ownership("stuntman",
    {
        config = {
            extra = {
                h_size = -2,
                chip_mod = 250
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
                    card.ability.extra.chip_mod,
                    card.ability.extra.h_size
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    chips = card.ability.extra.chip_mod
                }
            end
        end,

        add_to_deck = function(self, card, from_debuff)
            G.hand:change_size(card.ability.extra.h_size)
        end,

        remove_from_deck = function(self, card, from_debuff)
            G.hand:change_size(-card.ability.extra.h_size)
        end,
    },
    true
)