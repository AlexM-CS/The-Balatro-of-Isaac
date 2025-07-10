SMODS.Joker:take_ownership("supernova",
    {
        config = {
            special = {
                -- Some Jokers that gain mult, such as Supernova, can have their mult
                -- be set at an irregular position if it grows and then Cricket's Head is sold.
                -- To counter this, a multiplier that will specifically accessed by Cricket's
                -- Head is used.
                supernova_Xmult = 1
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
            if card.ability.special.supernova_Xmult ~= 1 then
                return {
                    vars = {
                        card.ability.special.supernova_Xmult.."X ",
                        colours = {
                            G.C.RED
                        }
                    }
                }
            else
                return {
                    vars = {
                        "",
                        colours = {
                            G.C.WHITE
                        }
                    }
                }
            end
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    mult = card.ability.special.supernova_Xmult * G.GAME.hands[context.scoring_name].played
                }
            end
        end
    },
    true
)