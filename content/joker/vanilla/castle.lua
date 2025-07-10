SMODS.Joker:take_ownership("castle",
    {
        config = {
            extra = {
                chips = 0,
                chip_mod = 3
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
            local suit = (G.GAME.current_round.castle_card or {}).suit or "Spades"
            return {
                vars = {
                    card.ability.extra.chip_mod,
                    localize(suit, "suits_singular"),
                    card.ability.extra.chips, colours = { G.C.SUITS[suit] }
                }
            }
        end,
        
        calculate = function(self, card, context)
            if context.discard and not context.blueprint and not context.other_card.debuff and
                context.other_card:is_suit(G.GAME.current_round.castle_card.suit) then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.CHIPS
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