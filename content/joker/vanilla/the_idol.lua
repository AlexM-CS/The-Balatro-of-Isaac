SMODS.Joker:take_ownership("idol",
    {
        config = {
            extra = {
                Xmult = 2
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
            local idol_card = G.GAME.current_round.idol_card or { rank = "Ace", suit = "Spades" }
            return {
                vars = {
                    card.ability.extra.Xmult,
                    localize(idol_card.rank, "ranks"),
                    localize(idol_card.suit, "suits_plural"),
                    colours = { G.C.SUITS[idol_card.suit] }
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and
                context.other_card:get_id() == G.GAME.current_round.idol_card.id and
                context.other_card:is_suit(G.GAME.current_round.idol_card.suit) then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)