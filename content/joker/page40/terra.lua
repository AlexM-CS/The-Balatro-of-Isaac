SMODS.Joker {
    key = "terra",
    config = {
        extra = {
            poker_hand = "Full House"
        }
    },
    rarity = 3,
    pos = { x = 5, y = 4 },
    atlas = "tboi_jokers",
    cost = 10,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and context.scoring_name == card.ability.extra.poker_hand then
            local stone_card = SMODS.create_card({
                set = "Base",
                enhancement = "m_stone",
                seal = pseudorandom_element({"Gold", "Red", "Blue", "Purple"}, pseudoseed("terra")),
                area = G.discard
            })
            G.E_MANAGER:add_event(Event({
                func = function()
                    stone_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                    G.hand:emplace(stone_card)
                    return true
                end
            }))
            return {
                message = localize("k_plus_stone"),
                colour = G.C.SECONDARY_SET.Enhanced,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            return true
                        end
                    }))
                    SMODS.calculate_context({
                        playing_card_added = true,
                        cards = { stone_card }
                    })
                end
            }
        end
    end
}