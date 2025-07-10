SMODS.Joker:take_ownership("stencil",
    {
        config = {
            special = {
                -- Some Jokers that gain mult, such as Joker Stencil, can have their mult
                -- be set at an irregular position if it grows and then Cricket's Head is sold.
                -- To counter this, a multiplier that will specifically accessed by Cricket's
                -- Head is used.
                stencil_Xmult = 1
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
                    card.ability.special.stencil_Xmult,
                    G.jokers and card.ability.special.stencil_Xmult * math.max(1, (G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_stencil", true)) or 1
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    xmult = card.ability.special.stencil_Xmult * math.max(1, (G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_stencil", true))
                }
            end
        end
    },
    true
)