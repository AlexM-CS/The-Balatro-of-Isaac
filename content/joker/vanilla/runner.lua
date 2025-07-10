SMODS.Joker:take_ownership("runner",
    {
        config = {
            extra = {
                chips = 0,
                chip_mod = 15
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
            if context.before and context.main_eval and not context.blueprint and next(context.poker_hands["Straight"]) then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.CHIPS,
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