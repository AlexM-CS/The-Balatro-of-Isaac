SMODS.Joker:take_ownership("wee",
    {
        config = {
            extra = {
                chips = 0,
                chip_mod = 8
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
                    card.ability.extra.chips,
                    card.ability.extra.chip_mod
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 and not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.CHIPS,
                    message_card = card
                }
            end
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    },
    true
)