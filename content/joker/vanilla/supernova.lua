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
            if card.ability.special.supernova_Xmult ~= 1 then
                return {
                    vars = {
                        card.ability.special.supernova_Xmult.."X "
                    }
                }
            else
                return {
                    vars = {
                        ""
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
    }
    --true
)